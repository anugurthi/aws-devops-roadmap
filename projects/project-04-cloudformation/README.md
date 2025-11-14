# Project 4 – Infrastructure as Code with CloudFormation

**Duration**: 8–10 hours  
**Goal**: Codify a multi-tier application stack using AWS CloudFormation, focusing on repeatability and drift detection.

## Desired Stack

- VPC with public/private subnets
- Auto Scaling group + Launch Template for web tier
- Application Load Balancer with HTTPS
- RDS MySQL instance (Multi-AZ optional)
- S3 bucket for artifacts/logs
- CloudWatch alarms and SNS notifications

## Structure

```
project-04-cloudformation/
├── templates/
│   ├── network.yaml
│   ├── compute.yaml
│   └── database.yaml
├── parameters/
│   └── dev.json
├── scripts/
│   └── deploy.sh
└── README.md
```

## Implementation Plan

1. **Modularize Templates** – Split into nested stacks or use `AWS::CloudFormation::Stack` to reference subnet, compute, and database layers.
2. **Parameters & Mappings** – Define CIDR blocks, instance types, key names, and AMI IDs per region.
3. **Outputs & Exports** – Export VPC/Subnet IDs for reuse; import in compute/database stacks.
4. **User Data** – Configure web tier to pull application code from S3 and register with the load balancer target group.
5. **Change Sets** – Always preview modifications before executing to avoid downtime.
6. **Drift Detection** – After manual tweaks, run `aws cloudformation detect-stack-drift --stack-name <name>` and reconcile.

## Deployment Script Sample

```bash
#!/usr/bin/env bash
set -euo pipefail

STACK_NAME="devops-app"
aws cloudformation deploy \
  --stack-name "$STACK_NAME" \
  --template-file templates/network.yaml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides file://parameters/dev.json
```

## Validation

- Stack creates without manual console intervention
- Re-running deploy is idempotent (no unexpected updates)
- Deleting the parent stack cleans up all nested stacks and resources

## Stretch Goals

- Integrate with CodePipeline for continuous delivery
- Add StackSets to deploy networking to multiple accounts/regions
- Use CloudFormation Guard or cfn-lint for policy enforcement
