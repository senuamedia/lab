#!/bin/bash
set -e

REGION="ap-southeast-2"
INSTANCE_TYPE="c7g.4xlarge"
SUBNET="YOUR_SUBNET_ID"
KEY_NAME=""  # No SSH key needed — we use SSM
AMI=""       # Will find latest Amazon Linux 2023 ARM

echo "=== Finding latest AL2023 ARM AMI ==="
AMI=$(aws ec2 describe-images \
  --region $REGION \
  --owners amazon \
  --filters "Name=name,Values=al2023-ami-2023*-arm64" "Name=state,Values=available" \
  --query 'Images | sort_by(@, &CreationDate) | [-1].ImageId' \
  --output text)
echo "AMI: $AMI"

echo "=== Creating IAM role for EC2 (S3 access + SSM) ==="
# Create role if it doesn't exist
aws iam get-role --role-name YOUR_EC2_ROLE 2>/dev/null || \
aws iam create-role \
  --role-name YOUR_EC2_ROLE \
  --assume-role-policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]}' \
  --region $REGION 2>/dev/null

aws iam attach-role-policy --role-name YOUR_EC2_ROLE \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess 2>/dev/null || true
aws iam attach-role-policy --role-name YOUR_EC2_ROLE \
  --policy-arn arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore 2>/dev/null || true

# Create instance profile if needed
aws iam get-instance-profile --instance-profile-name YOUR_INSTANCE_PROFILE 2>/dev/null || \
aws iam create-instance-profile --instance-profile-name YOUR_INSTANCE_PROFILE 2>/dev/null

aws iam add-role-to-instance-profile \
  --instance-profile-name YOUR_INSTANCE_PROFILE \
  --role-name YOUR_EC2_ROLE 2>/dev/null || true

echo "Waiting 10s for IAM propagation..."
sleep 10

echo "=== Uploading experiment script to S3 ==="
aws s3 cp deploy/n16_experiment.py s3://ns-proof-experiments-YOUR_ACCOUNT_ID/n16-run/n16_experiment.py

echo "=== Creating security group ==="
VPC_ID=$(aws ec2 describe-subnets --subnet-ids $SUBNET --region $REGION --query 'Subnets[0].VpcId' --output text)
SG_ID=$(aws ec2 describe-security-groups --region $REGION --filters "Name=group-name,Values=ns-proof-sg" "Name=vpc-id,Values=$VPC_ID" --query 'SecurityGroups[0].GroupId' --output text 2>/dev/null)
if [ "$SG_ID" = "None" ] || [ -z "$SG_ID" ]; then
  SG_ID=$(aws ec2 create-security-group --group-name ns-proof-sg --description "NS proof experiments" --vpc-id $VPC_ID --region $REGION --query 'GroupId' --output text)
  # Allow outbound only (S3 access)
  echo "Created SG: $SG_ID"
else
  echo "Using existing SG: $SG_ID"
fi

echo "=== Launching instance ==="
USERDATA=$(cat << 'USERDATA_EOF'
#!/bin/bash
exec > /var/log/ns-proof-setup.log 2>&1
set -ex

# Install Python + numpy + scipy
dnf install -y python3.11 python3.11-pip
pip3.11 install numpy scipy

# Download experiment
aws s3 cp s3://ns-proof-experiments-YOUR_ACCOUNT_ID/n16-run/n16_experiment.py /tmp/n16_experiment.py

# Run with real-time log streaming
cd /tmp
python3.11 -u n16_experiment.py 2>&1 | tee /tmp/n16_full.log &
PID=$!

# Stream log to S3 every 60 seconds
while kill -0 $PID 2>/dev/null; do
  aws s3 cp /tmp/n16_full.log s3://ns-proof-experiments-YOUR_ACCOUNT_ID/n16-run/n16_full.log
  sleep 60
done

# Final upload
wait $PID
aws s3 cp /tmp/n16_full.log s3://ns-proof-experiments-YOUR_ACCOUNT_ID/n16-run/n16_full.log

# Signal completion
echo "COMPLETE $(date)" > /tmp/n16_done.txt
aws s3 cp /tmp/n16_done.txt s3://ns-proof-experiments-YOUR_ACCOUNT_ID/n16-run/n16_done.txt

# Self-terminate
shutdown -h now
USERDATA_EOF
)

INSTANCE_ID=$(aws ec2 run-instances \
  --region $REGION \
  --image-id $AMI \
  --instance-type $INSTANCE_TYPE \
  --subnet-id $SUBNET \
  --iam-instance-profile Name=YOUR_INSTANCE_PROFILE \
  --security-group-ids $SG_ID \
  --instance-initiated-shutdown-behavior terminate \
  --user-data "$USERDATA" \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=ns-proof-n16}]' \
  --query 'Instances[0].InstanceId' \
  --output text)

echo ""
echo "=== LAUNCHED ==="
echo "Instance: $INSTANCE_ID"
echo "Type: $INSTANCE_TYPE"
echo "Region: $REGION"
echo ""
echo "Monitor logs:"
echo "  aws s3 cp s3://ns-proof-experiments-YOUR_ACCOUNT_ID/n16-run/n16_full.log - | tail -20"
echo ""
echo "Check completion:"
echo "  aws s3 ls s3://ns-proof-experiments-YOUR_ACCOUNT_ID/n16-run/n16_done.txt"
echo ""
echo "Download results:"
echo "  aws s3 cp s3://ns-proof-experiments-YOUR_ACCOUNT_ID/n16-run/cascade_wave_n16.npz results/"
echo ""
echo "Instance will self-terminate after completion."
