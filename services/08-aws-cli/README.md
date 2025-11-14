# AWS CLI and Automation

**Estimated Time**: 4-6 hours

## What You'll Learn

- Installing and configuring the AWS CLI
- Essential commands for core services
- JMESPath querying
- Bash automation patterns
- Credential and profile management
- Using CLI for CI/CD pipelines

## Free Resources

- 📖 [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/index.html)
- 📚 [AWS CLI Workshop](https://catalog.workshops.aws/aws-cli/en-US)
- 📺 [JMESPath Tutorial](https://www.youtube.com/watch?v=w4u5GIRr76c)
- 📘 [AWS CLI Tips and Tricks](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html)

## Essential Commands Cheat Sheet

```bash
# Identity
aws sts get-caller-identity

# EC2
aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId'
aws ec2 stop-instances --instance-ids i-1234567890abcdef0

# S3
aws s3 ls
aws s3 sync ./dist s3://my-bucket --delete

# IAM
aws iam list-users
aws iam list-roles

# Lambda
aws lambda list-functions --query 'Functions[].FunctionName'
aws lambda invoke --function-name ProcessS3Events response.json

# CloudFormation
aws cloudformation describe-stacks --query 'Stacks[].StackName'

# CloudWatch Logs
aws logs tail /aws/lambda/my-function --follow --format short
```

## JMESPath Examples

```bash
# List running EC2 instances with Name tag
aws ec2 describe-instances \
  --filters "Name=instance-state-name,Values=running" \
  --query 'Reservations[].Instances[].{Instance:InstanceId,Name:Tags[?Key==`Name`]|[0].Value}' \
  --output table

# S3 buckets created in the last 30 days
aws s3api list-buckets \
  --query 'Buckets[?CreationDate>=`2025-10-15`].{Name:Name,Created:CreationDate}'
```

## Automation Script

The `aws-automation.sh` script packaged with this module provides functions for:

- Listing EC2 instances by environment
- Stopping dev instances at day-end
- Backing up S3 buckets
- Generating daily cost reports
- Cleaning up old AMIs and snapshots

```bash
chmod +x aws-automation.sh
./aws-automation.sh --help
```
