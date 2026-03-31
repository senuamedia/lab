#!/bin/bash
# Launch all SWT solvers on AWS
set -e

REGION="ap-southeast-2"
AMI="ami-095c3f65a7cdb9bda"
SUBNET="subnet-0e6e1592a2c956de4"
SG="sg-04712f770ce47db77"
BUCKET="swt-results-673740107212"
PROFILE="swt-solver-profile"
SOURCE_B64=$(base64 < swt_solve.c)

launch() {
    local Q=$1 A=$2 B=$3 LIMIT=$4 ITYPE=$5
    local TAG="swt-q${Q}-${A}v${B}-$(echo $LIMIT | numfmt --to=si 2>/dev/null || echo $LIMIT)"

    # write userdata
    local UD=$(mktemp)
    cat > $UD << ENDSCRIPT
#!/bin/bash
yum install -y gcc -q
cd /tmp
echo '${SOURCE_B64}' | base64 -d > swt_solve.c
gcc -O2 -o swt_solve swt_solve.c -lm
./swt_solve ${Q} ${A} ${B} ${LIMIT} > result.json 2>stderr.log
aws s3 cp result.json s3://${BUCKET}/${TAG}.json --region ${REGION}
aws s3 cp stderr.log s3://${BUCKET}/${TAG}.log --region ${REGION}
shutdown -h now
ENDSCRIPT

    local IID=$(aws ec2 run-instances \
        --image-id $AMI --instance-type $ITYPE \
        --subnet-id $SUBNET --security-group-ids $SG \
        --iam-instance-profile Name=$PROFILE \
        --instance-initiated-shutdown-behavior terminate \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${TAG}},{Key=Project,Value=swt}]" \
        --user-data file://$UD --region $REGION \
        --query 'Instances[0].InstanceId' --output text 2>&1)

    echo "  $TAG: $IID ($ITYPE)"
    rm -f $UD
}

echo "=== SWT Mass Launch ==="
echo ""

# BATCH 1: Remaining Chebyshev pairs at 100B (c7g.large, ~5 min each)
echo "BATCH 1: Chebyshev reversals at 100B"
launch 8 1 3 100000000000 c7g.large
launch 8 1 7 100000000000 c7g.large
launch 12 1 5 100000000000 c7g.large
launch 12 1 7 100000000000 c7g.large
launch 12 1 11 100000000000 c7g.large
launch 24 1 5 100000000000 c7g.large
launch 24 1 7 100000000000 c7g.large
launch 24 1 11 100000000000 c7g.large
launch 24 1 13 100000000000 c7g.large
launch 24 1 17 100000000000 c7g.large
launch 24 1 19 100000000000 c7g.large
launch 24 1 23 100000000000 c7g.large

echo ""
# BATCH 2: Known validation — mod 3 at 700B
echo "BATCH 2: Mod 3 validation (known answer at 608B)"
launch 3 1 2 700000000000 c7g.large

echo ""
# BATCH 3: Deep search — larger moduli at 100B
echo "BATCH 3: Larger moduli at 100B"
launch 19 1 3 100000000000 c7g.large

echo ""
echo "Total: 14 instances launched"
echo "Monitor: aws s3 ls s3://${BUCKET}/ --region ${REGION}"
echo "Fetch:   aws s3 sync s3://${BUCKET}/ ./results/ --region ${REGION}"
