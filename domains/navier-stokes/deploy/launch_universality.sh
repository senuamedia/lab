#!/bin/bash
# NS Proof — Universality sweep across (ν, A, IC)
# Launches 7 EC2 c5.2xlarge instances, runs all configs via screen
#
# Usage: bash deploy/launch_universality.sh
#
# Prerequisites:
#   - AWS CLI configured (aws ec2 run-instances)
#   - Key pair: ns-proof-key (in ~/.ssh/ns-proof-key.pem)
#   - Security group allowing SSH
#   - Ubuntu 22.04 AMI

set -e

KEY="$HOME/.ssh/ns-proof-key.pem"
USER="ubuntu"
SRC_DIR="$(cd "$(dirname "$0")/.." && pwd)"
AMI="ami-0c7217cdde317cfec"  # Ubuntu 22.04 us-east-1 (update if different region)
INSTANCE_TYPE="c5.2xlarge"
SG="sg-0a1b2c3d4e5f"  # UPDATE with your security group
KEYPAIR="ns-proof-key"

# All experiment configs: nu amp ic_type n_max n_ceiling
CONFIGS=(
    # Instance 1: viscosity sweep at A=0.3, distributed IC
    "0.001  0.3 0 8 20"
    "0.0001 0.3 0 8 24"
    "0.00001 0.3 0 8 28"
    # Instance 2: viscosity sweep at A=1.0
    "0.001  1.0 0 8 20"
    "0.0001 1.0 0 8 24"
    "0.01   1.0 0 8 20"
    # Instance 3: amplitude sweep at ν=0.01
    "0.01 0.1 0 8 20"
    "0.01 0.5 0 8 20"
    "0.01 1.0 0 8 20"
    "0.01 2.0 0 8 24"
    "0.01 5.0 0 8 28"
    # Instance 4: amplitude sweep at ν=0.001
    "0.001 0.1 0 8 20"
    "0.001 0.5 0 8 20"
    "0.001 1.0 0 8 24"
    "0.001 5.0 0 8 28"
    # Instance 5: IC sweep at ν=0.001, A=0.3
    "0.001 0.3 0 8 20"
    "0.001 0.3 1 8 20"
    "0.001 0.3 2 8 20"
    "0.001 0.3 3 8 20"
    "0.001 0.3 4 8 20"
    "0.001 0.3 5 8 20"
    # Instance 6: IC sweep at ν=0.01, A=1.0
    "0.01 1.0 0 8 20"
    "0.01 1.0 1 8 20"
    "0.01 1.0 2 8 20"
    "0.01 1.0 3 8 20"
    # Instance 7: extreme params
    "0.00001 0.1 0 8 30"
    "0.0001  5.0 0 8 28"
    "0.001   10.0 0 8 24"
    "0.01    10.0 0 8 24"
)

# Group configs into 7 instances
# Each instance runs multiple configs sequentially
INST_CONFIGS=(
    "0 1 2"       # Instance 1: low ν, A=0.3
    "3 4 5"       # Instance 2: ν sweep, A=1.0
    "6 7 8 9 10"  # Instance 3: A sweep, ν=0.01
    "11 12 13 14" # Instance 4: A sweep, ν=0.001
    "15 16 17 18 19 20" # Instance 5: IC sweep, ν=0.001
    "21 22 23 24" # Instance 6: IC sweep, ν=0.01
    "25 26 27 28" # Instance 7: extreme
)

echo "================================================================"
echo "  NS PROOF — UNIVERSALITY SWEEP"
echo "  $(date)"
echo "  ${#CONFIGS[@]} configurations across 7 instances"
echo "================================================================"
echo ""

# Generate the runner script that each instance will execute
cat > /tmp/ns_runner.sh << 'RUNNER'
#!/bin/bash
# Runner script — executed on each EC2 instance
# Compiles and runs each config sequentially, results in ~/ns-proof/results/

set -e
cd ~/ns-proof
mkdir -p results build

echo "=== NS Proof Runner — $(hostname) ==="
echo "Configs to run: $@"

for CONFIG in "$@"; do
    NU=$(echo $CONFIG | awk '{print $1}')
    AMP=$(echo $CONFIG | awk '{print $2}')
    IC=$(echo $CONFIG | awk '{print $3}')
    NMAX=$(echo $CONFIG | awk '{print $4}')
    NCEIL=$(echo $CONFIG | awk '{print $5}')

    TAG="nu${NU}_A${AMP}_ic${IC}_N${NMAX}_ceil${NCEIL}"
    echo ""
    echo "=== Running: $TAG ==="
    echo "  ν=$NU, A=$AMP, IC=$IC, N_max=$NMAX, N_ceiling=$NCEIL"

    # Compile with parameters
    clang -O3 -c src/triad_kernel_v3.c -o build/kernel.o 2>&1
    clang -O3 -c src/experiment_universality.c -o build/exp.o \
        -DPARAM_NU=$NU \
        -DPARAM_AMP=$AMP \
        -DPARAM_IC_TYPE=$IC \
        -DPARAM_N_MAX=$NMAX \
        -DPARAM_N_CEILING=$NCEIL 2>&1
    clang -O2 build/exp.o build/kernel.o -o build/run_${TAG} -lm 2>&1

    # Run
    echo "  Starting at $(date)"
    ./build/run_${TAG} 2>&1 | tee results/${TAG}.txt
    echo "  Finished at $(date)"
    echo "=== Done: $TAG ==="
done

echo ""
echo "=== ALL CONFIGS COMPLETE ==="
RUNNER

echo "Step 1: Check for existing instances or launch new ones"
echo "(You need to fill in IPs after launching EC2 instances)"
echo ""
echo "To launch 7 instances manually:"
echo "  aws ec2 run-instances --count 7 --instance-type $INSTANCE_TYPE \\"
echo "    --image-id $AMI --key-name $KEYPAIR \\"
echo "    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ns-universality}]'"
echo ""
echo "Then fill in IPs below and re-run, or use deploy/run_on_nodes.sh"
echo ""

# If IPs are provided as arguments, deploy and run
if [ $# -ge 7 ]; then
    IPS=("$@")

    for i in "${!INST_CONFIGS[@]}"; do
        IP="${IPS[$i]}"
        IDX_LIST="${INST_CONFIGS[$i]}"

        echo "--- Instance $i: $IP ---"

        # Build config list for this instance
        CFGS=""
        for idx in $IDX_LIST; do
            CFGS="$CFGS '${CONFIGS[$idx]}'"
        done

        # Setup
        echo "  Setting up..."
        ssh -i $KEY -o StrictHostKeyChecking=no $USER@$IP 'bash -s' < "$SRC_DIR/deploy/setup.sh" 2>/dev/null || true

        # Upload source
        echo "  Uploading source..."
        ssh -i $KEY $USER@$IP 'mkdir -p ~/ns-proof/src ~/ns-proof/build ~/ns-proof/results'
        scp -i $KEY -q "$SRC_DIR/src/triad_kernel_v3.c" $USER@$IP:~/ns-proof/src/
        scp -i $KEY -q "$SRC_DIR/src/experiment_universality.c" $USER@$IP:~/ns-proof/src/
        scp -i $KEY -q /tmp/ns_runner.sh $USER@$IP:~/ns-proof/runner.sh
        ssh -i $KEY $USER@$IP 'chmod +x ~/ns-proof/runner.sh'

        # Launch in screen
        echo "  Launching in screen session 'ns'..."
        ssh -i $KEY $USER@$IP "screen -dmS ns bash -c 'cd ~/ns-proof && bash runner.sh $CFGS 2>&1 | tee results/instance_${i}.log'"

        echo "  RUNNING on $IP (screen session: ns)"
        echo "  Monitor: ssh -i $KEY $USER@$IP 'screen -r ns'"
        echo ""
    done

    echo "================================================================"
    echo "  All 7 instances launched"
    echo "  Total configs: ${#CONFIGS[@]}"
    echo "  Monitor any: ssh -i $KEY ubuntu@<IP> 'screen -r ns'"
    echo "  Collect: bash deploy/collect_universality.sh ${IPS[*]}"
    echo "================================================================"
else
    echo "Usage: bash deploy/launch_universality.sh IP1 IP2 IP3 IP4 IP5 IP6 IP7"
    echo ""
    echo "Configs per instance:"
    for i in "${!INST_CONFIGS[@]}"; do
        echo "  Instance $i:"
        for idx in ${INST_CONFIGS[$i]}; do
            echo "    ${CONFIGS[$idx]}"
        done
    done
fi
