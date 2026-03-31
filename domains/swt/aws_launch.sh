#!/bin/bash
# SWT AWS Launcher — spin up instances to solve Chebyshev bias reversals
#
# Usage: ./aws_launch.sh
# Launches one c7g.large per target pair, each auto-terminates when done.

set -e

REGION="ap-southeast-2"
AMI="ami-095c3f65a7cdb9bda"  # AL2023 ARM64
INSTANCE_TYPE="c7g.large"
BUCKET="swt-results-673740107212"
SOURCE_B64=$(base64 < swt_solve.c)

# IAM role for S3 access — create if doesn't exist
ROLE_NAME="swt-solver-role"
INSTANCE_PROFILE="swt-solver-profile"

# check if role exists
if ! aws iam get-role --role-name $ROLE_NAME --region $REGION 2>/dev/null; then
    echo "Creating IAM role..."
    aws iam create-role --role-name $ROLE_NAME --assume-role-policy-document '{
        "Version":"2012-10-17",
        "Statement":[{"Effect":"Allow","Principal":{"Service":"ec2.amazonaws.com"},"Action":"sts:AssumeRole"}]
    }' --region $REGION
    aws iam attach-role-policy --role-name $ROLE_NAME --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --region $REGION
    aws iam create-instance-profile --instance-profile-name $INSTANCE_PROFILE --region $REGION 2>/dev/null || true
    aws iam add-role-to-instance-profile --instance-profile-name $INSTANCE_PROFILE --role-name $ROLE_NAME --region $REGION 2>/dev/null || true
    echo "Waiting for role propagation..."
    sleep 10
fi

# target pairs: q a b verify_limit
TARGETS=(
    # 10B targets — predicted reversals at 10^8-10^10
    "8 1 3 10000000000"
    "8 1 7 10000000000"
    "12 1 5 10000000000"
    "12 1 7 10000000000"
    "12 1 11 10000000000"
    "24 1 5 10000000000"
    "24 1 7 10000000000"
    "24 1 11 10000000000"
    "24 1 13 10000000000"
    "24 1 17 10000000000"
    "24 1 19 10000000000"
    "24 1 23 10000000000"
    # mod-3 validation — known answer at 608B
    "3 1 2 700000000000"
    # mod-19 deeper search
    "19 1 3 10000000000"
)

echo "Launching ${#TARGETS[@]} instances..."
echo ""

for target in "${TARGETS[@]}"; do
    Q=$(echo $target | awk '{print $1}')
    A=$(echo $target | awk '{print $2}')
    B=$(echo $target | awk '{print $3}')
    LIMIT=$(echo $target | awk '{print $4}')
    TAG="swt-q${Q}-${A}v${B}"

    USERDATA=$(cat <<ENDSCRIPT
#!/bin/bash
yum install -y gcc
cd /tmp
echo "${SOURCE_B64}" | base64 -d > swt_solve.c
gcc -O2 -o swt_solve swt_solve.c -lm
./swt_solve ${Q} ${A} ${B} ${LIMIT} > result.json 2>stderr.log
aws s3 cp result.json s3://${BUCKET}/${TAG}.json --region ${REGION}
aws s3 cp stderr.log s3://${BUCKET}/${TAG}.log --region ${REGION}
shutdown -h now
ENDSCRIPT
)

    INSTANCE_ID=$(aws ec2 run-instances \
        --image-id $AMI \
        --instance-type $INSTANCE_TYPE \
        --iam-instance-profile Name=$INSTANCE_PROFILE \
        --instance-initiated-shutdown-behavior terminate \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${TAG}}]" \
        --user-data "$USERDATA" \
        --region $REGION \
        --query 'Instances[0].InstanceId' \
        --output text 2>&1)

    echo "  $TAG: $INSTANCE_ID (q=$Q, a=$A vs b=$B, limit=$LIMIT)"
done

echo ""
echo "All instances launched. Results will appear in s3://${BUCKET}/"
echo "Instances auto-terminate when done."
echo ""
echo "Monitor: aws s3 ls s3://${BUCKET}/ --region $REGION"
echo "Fetch:   aws s3 sync s3://${BUCKET}/ ./results/ --region $REGION"
