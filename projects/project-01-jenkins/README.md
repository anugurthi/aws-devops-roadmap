# Project 1 – Jenkins on EC2 with Auto Scaling

**Duration**: 4–6 hours  
**Goal**: Deploy a resilient Jenkins controller behind an Application Load Balancer.

## Architecture

- 1 × Launch Template for Jenkins controller
- Auto Scaling group (min 1, max 3) spread across two AZs
- Application Load Balancer with HTTPS (ACM certificate)
- EFS or EBS volume for Jenkins home persistence
- IAM role allowing SSM access and S3 artifact storage
- Parameter Store (secure string) for admin password seed

## Prerequisites

- Complete the `services/03-ec2` and `services/05-security-best-practices` modules
- Install the AWS CLI and Terraform/CloudFormation tooling from `foundations/tooling`
- Generated key pair for EC2 access (or use Session Manager)

## Step-by-Step

1. **Networking** – Create or reuse a VPC with public/private subnets. Ensure outbound internet via NAT Gateway.
2. **Security** – Define security groups: ALB (80/443 from world), Jenkins ASG (8080 from ALB, 22/SSM from admin IP/SSM).
3. **Storage** – Decide on EFS vs EBS. For blue/green updates, EFS simplifies multi-AZ sharing.
4. **Launch Template** – Use a user-data script that installs Jenkins, plugins, and configures admin user:
   ```bash
   #!/bin/bash
   yum update -y
   amazon-linux-extras install java-openjdk11 -y
   wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
   rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
   yum install jenkins git -y
   systemctl enable jenkins
   systemctl start jenkins
   ```
5. **Auto Scaling Group** – Attach to private subnets, target group from the ALB, and health checks via `/login` path.
6. **Load Balancer** – Configure HTTPS listener, redirect HTTP → HTTPS, use host-based routing if adding more apps.
7. **Bootstrap Jobs** – Install the AWS CLI on the instance, configure credentials via instance profile, create sample pipeline job pulling from CodeCommit/GitHub.
8. **Monitoring** – Enable Group Metrics, set up CloudWatch alarms for high latency and unhealthy host count.

## Validation

- Access Jenkins via the ALB DNS name over HTTPS.
- Run a freestyle or pipeline job that builds a sample app and stores an artifact in S3.
- Terminate an instance manually; verify Auto Scaling replaces it and Jenkins state persists.

## Cleanup

- Delete pipeline jobs and artifacts
- Remove the Auto Scaling group, launch template, and ALB
- Delete unused EFS/EBS volumes to avoid costs

## Stretch Goals

- Integrate with GitHub OAuth for authentication
- Create infrastructure as code (Terraform or CloudFormation) for the entire stack
- Attach CloudWatch Logs agent and enable log retention policies
