#!/bin/bash
# aws-automation.sh - Manage AWS resources

set -e

# Configuration
PROFILE="default"
REGION="us-east-1"

# Function: List running EC2 instances
list_running_instances() {
    echo "=== Running EC2 Instances ==="
    aws ec2 describe-instances \
        --profile $PROFILE \
        --region $REGION \
        --filters "Name=instance-state-name,Values=running" \
        --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,Tags[?Key==`Name`].Value|[0]]' \
        --output table
}

# Function: Stop instances with specific tag
stop_dev_instances() {
    echo "=== Stopping Development Instances ==="
    INSTANCE_IDS=$(aws ec2 describe-instances \
        --profile $PROFILE \
        --region $REGION \
        --filters "Name=tag:Environment,Values=development" "Name=instance-state-name,Values=running" \
        --query 'Reservations[*].Instances[*].InstanceId' \
        --output text)
    
    if [ -n "$INSTANCE_IDS" ]; then
        aws ec2 stop-instances --instance-ids $INSTANCE_IDS
        echo "Stopped instances: $INSTANCE_IDS"
    else
        echo "No running development instances found"
    fi
}

# Function: Create backup of S3 bucket
backup_s3_bucket() {
    BUCKET=$1
    BACKUP_BUCKET="${BUCKET}-backup-$(date +%Y%m%d)"
    
    echo "=== Backing up $BUCKET to $BACKUP_BUCKET ==="
    aws s3 mb s3://$BACKUP_BUCKET
    aws s3 sync s3://$BUCKET s3://$BACKUP_BUCKET --delete
    echo "Backup completed"
}

# Function: Generate cost report
cost_report() {
    echo "=== Monthly Cost Report ==="
    START_DATE=$(date -d "last month" +%Y-%m-01)
    END_DATE=$(date +%Y-%m-01)
    
    aws ce get-cost-and-usage \
        --time-period Start=$START_DATE,End=$END_DATE \
        --granularity MONTHLY \
        --metrics "UnblendedCost" \
        --group-by Type=SERVICE \
        --query 'ResultsByTime[0].Groups[*].[Keys[0],Metrics.UnblendedCost.Amount]' \
        --output table
}

# Function: Clean up old snapshots
cleanup_snapshots() {
    echo "=== Cleaning up snapshots older than 30 days ==="
    CUTOFF_DATE=$(date -d "30 days ago" +%Y-%m-%d)
    
    aws ec2 describe-snapshots \
        --owner-ids self \
        --query "Snapshots[?StartTime<='$CUTOFF_DATE'].SnapshotId" \
        --output text | while read SNAPSHOT_ID; do
            echo "Deleting snapshot: $SNAPSHOT_ID"
            aws ec2 delete-snapshot --snapshot-id $SNAPSHOT_ID
        done
}

case "${1:-help}" in
    list)
        list_running_instances
        ;;
    stop-dev)
        stop_dev_instances
        ;;
    backup)
        backup_s3_bucket $2
        ;;
    cost)
        cost_report
        ;;
    cleanup)
        cleanup_snapshots
        ;;
    *)
        echo "Usage: $0 {list|stop-dev|backup <bucket>|cost|cleanup}"
        exit 1
        ;;
esac
