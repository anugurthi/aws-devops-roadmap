# AWS DevOps Learning Roadmap 2026

![AWS DevOps Roadmap](./aws_devops_roadmap.png)

A comprehensive, structured guide to mastering AWS DevOps practices with hands-on projects, free resources, and real-world examples.

## 📋 Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Learning Path](#learning-path)
   - [1. AWS Fundamentals](#1-aws-fundamentals)
   - [2. IAM - Identity and Access Management](#2-iam---identity-and-access-management)
   - [3. EC2 - Elastic Compute Cloud](#3-ec2---elastic-compute-cloud)
   - [4. VPC - Virtual Private Cloud](#4-vpc---virtual-private-cloud)
   - [5. AWS Security Best Practices](#5-aws-security-best-practices)
   - [6. Route 53 - DNS Management](#6-route-53---dns-management)
   - [7. S3 - Simple Storage Service](#7-s3---simple-storage-service)
   - [8. AWS CLI and Automation](#8-aws-cli-and-automation)
   - [9. CloudFormation - Infrastructure as Code](#9-cloudformation---infrastructure-as-code)
   - [10. Terraform on AWS](#10-terraform-on-aws)
   - [11. AWS Developer Tools - CodeCommit, CodeBuild, CodeDeploy](#11-aws-developer-tools)
   - [12. AWS CodePipeline - CI/CD Automation](#12-aws-codepipeline---cicd-automation)
   - [13. CloudWatch - Monitoring and Logging](#13-cloudwatch---monitoring-and-logging)
   - [14. Lambda - Serverless Computing](#14-lambda---serverless-computing)
   - [15. EventBridge - Event-Driven Architecture](#15-eventbridge---event-driven-architecture)
   - [16. CloudFront - Content Delivery Network](#16-cloudfront---content-delivery-network)
   - [17. ECR - Elastic Container Registry](#17-ecr---elastic-container-registry)
   - [18. ECS - Elastic Container Service](#18-ecs---elastic-container-service)
   - [19. EKS - Elastic Kubernetes Service](#19-eks---elastic-kubernetes-service)
   - [20. RDS - Relational Database Service](#20-rds---relational-database-service)
   - [21. Systems Manager and Secrets Manager](#21-systems-manager-and-secrets-manager)
   - [22. Elastic Load Balancer](#22-elastic-load-balancer)
   - [23. AWS Cost Optimization](#23-aws-cost-optimization)
   - [24. CloudTrail and Config - Compliance](#24-cloudtrail-and-config---compliance)
   - [25. AWS Migration Strategies](#25-aws-migration-strategies)
4. [Hands-On Projects](#hands-on-projects)
5. [AWS DevOps Tools Comparison](#aws-devops-tools-comparison)
6. [Recommended Resources](#recommended-resources)
7. [Interview Preparation](#interview-preparation)
8. [Contributing](#contributing)
9. [License](#license)

---

## Introduction

AWS (Amazon Web Services) is the world's most comprehensive cloud platform, powering millions of businesses globally. This roadmap provides a **structured, hands-on learning path** specifically designed for DevOps engineers who want to master AWS.

### What You'll Learn:

- ☁️ Core AWS services for DevOps workflows
- 🔐 Security best practices and IAM management
- 🚀 CI/CD automation with AWS native tools
- 📦 Container orchestration with ECS and EKS
- 🏗️ Infrastructure as Code with CloudFormation and Terraform
- 📊 Monitoring, logging, and observability
- 💰 Cost optimization strategies
- 🎯 Real-world project implementations

### Why This Roadmap?

- ✅ **Structured Learning** - Progressive difficulty from basics to advanced
- ✅ **Hands-On Focus** - Every section includes practical projects
- ✅ **Free Resources** - Prioritizes free learning materials
- ✅ **Real-World Scenarios** - Based on actual DevOps use cases
- ✅ **Interview Ready** - Includes interview questions and answers
- ✅ **Cost-Conscious** - Learn within AWS Free Tier limits

---

## Prerequisites

Before starting this roadmap, you should have:

- ✅ Basic understanding of **Linux command line**
- ✅ Familiarity with **Git and version control**
- ✅ Basic knowledge of **networking concepts** (IP, DNS, HTTP)
- ✅ Understanding of **containerization** (Docker basics)
- ✅ Programming/scripting knowledge (**Python** or **Bash** preferred)

**New to these?** Check out our general [DevOps Roadmap](https://github.com/anugurthi/devops_roadmap) first!

### Setting Up Your AWS Account

1. **Create AWS Account**: [aws.amazon.com](https://aws.amazon.com/)
2. **Enable MFA** on your root account (CRITICAL for security!)
3. **Set up billing alerts** to avoid unexpected charges
4. **Activate Free Tier** - Most services offer 12 months free
5. **Install AWS CLI**: 
   ```bash
   # macOS
   brew install awscli
   
   # Linux
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   
   # Verify installation
   aws --version
   ```

---

## Learning Path

### 1. AWS Fundamentals

**Estimated Time**: 4-6 hours

#### What You'll Learn:

- Cloud computing concepts (IaaS, PaaS, SaaS)
- AWS Global Infrastructure (Regions, Availability Zones, Edge Locations)
- AWS Management Console navigation
- AWS Free Tier and billing basics
- Core AWS services overview

#### Free Resources:

- 📺 [AWS Certified Cloud Practitioner - Full Course](https://www.youtube.com/watch?v=SOTamWNgDKc) - freeCodeCamp
- 📖 [AWS Getting Started Resource Center](https://aws.amazon.com/getting-started/)
- 📚 [AWS Cloud Practitioner Essentials](https://aws.amazon.com/training/digital/aws-cloud-practitioner-essentials/)
- 🎮 [AWS Educate](https://aws.amazon.com/education/awseducate/) - Free training and credits

#### Premium Resources:

- 💎 [AWS Certified Solutions Architect - Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/)
- 💎 [A Cloud Guru - AWS Fundamentals](https://acloudguru.com/)

#### Key Concepts:

- **Regions**: Geographic locations with multiple data centers
- **Availability Zones (AZs)**: Isolated locations within regions
- **Edge Locations**: CDN endpoints for CloudFront
- **AWS Management Console**: Web interface for AWS services
- **AWS Free Tier**: Limited free usage for 12 months

#### Hands-On Lab:

```bash
# Configure AWS CLI
aws configure
# Enter your Access Key ID, Secret Access Key, region (us-east-1), output format (json)

# Test your configuration
aws sts get-caller-identity

# List available regions
aws ec2 describe-regions --output table

# Check your AWS account ID
aws sts get-caller-identity --query Account --output text
```

---

### 2. IAM - Identity and Access Management

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- IAM users, groups, roles, and policies
- Principle of least privilege
- MFA (Multi-Factor Authentication) setup
- IAM best practices
- Access keys vs IAM roles
- Policy evaluation logic
- Cross-account access

#### Free Resources:

- 📺 [AWS IAM Tutorial for Beginners](https://www.youtube.com/watch?v=iF9fs8Rw4Uo) - Stephane Maarek
- 📖 [IAM Best Practices - AWS Docs](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- 🎯 [IAM Policy Simulator](https://policysim.aws.amazon.com/home/index.jsp)
- 📚 [AWS IAM Workshop](https://catalog.workshops.aws/iam/en-US)

#### Key Concepts:

- **Users**: Individual identities with long-term credentials
- **Groups**: Collections of users with shared permissions
- **Roles**: Temporary credentials for services or federated users
- **Policies**: JSON documents defining permissions
- **MFA**: Additional security layer using time-based codes
- **Access Keys**: Programmatic access credentials (avoid when possible!)
- **IAM Role for EC2**: Best practice for granting EC2 instances AWS permissions

#### IAM Policy Structure:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3:::my-bucket/*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp": "203.0.113.0/24"
        }
      }
    }
  ]
}
```

#### Hands-On Project: **Secure Multi-User IAM Setup**

**Goal**: Create a secure IAM structure for a development team

**Steps**:
1. Create IAM groups (Admins, Developers, ReadOnly)
2. Create IAM users and assign to groups
3. Attach appropriate managed policies
4. Create custom policy for S3 bucket access
5. Enable MFA for all users
6. Create an IAM role for EC2 instances
7. Test permissions using IAM Policy Simulator

```bash
# Create an IAM group
aws iam create-group --group-name Developers

# Attach a policy to the group
aws iam attach-group-policy \
  --group-name Developers \
  --policy-arn arn:aws:iam::aws:policy/PowerUserAccess

# Create an IAM user
aws iam create-user --user-name john-developer

# Add user to group
aws iam add-user-to-group \
  --user-name john-developer \
  --group-name Developers

# Create custom policy
cat > developer-s3-policy.json << EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:*"],
      "Resource": "arn:aws:s3:::dev-bucket/*"
    }
  ]
}
EOF

aws iam create-policy \
  --policy-name DeveloperS3Access \
  --policy-document file://developer-s3-policy.json
```

#### 🔐 Security Best Practices:

- ✅ Enable MFA on all user accounts
- ✅ Use IAM roles for EC2 instead of access keys
- ✅ Rotate credentials regularly
- ✅ Apply least privilege principle
- ✅ Use AWS Organizations for multi-account management
- ✅ Enable CloudTrail to log all IAM actions

---

### 3. EC2 - Elastic Compute Cloud

**Estimated Time**: 8-10 hours

#### What You'll Learn:

- EC2 instance types and families
- Amazon Machine Images (AMIs)
- Security Groups and Network ACLs
- SSH key pairs and instance access
- User Data scripts for automation
- EC2 pricing models (On-Demand, Reserved, Spot)
- Auto Scaling Groups
- Elastic IP addresses
- Instance metadata and user data

#### Free Resources:

- 📺 [AWS EC2 Tutorial](https://www.youtube.com/watch?v=8TlukLu11Yo) - TechWorld with Nana
- 📖 [EC2 User Guide](https://docs.aws.amazon.com/ec2/)
- 🎮 [EC2 Hands-On Labs](https://aws.amazon.com/getting-started/hands-on/launch-a-virtual-machine/)
- 📺 [EC2 Instance Types Explained](https://www.youtube.com/watch?v=PYh77Fp7_aY)

#### EC2 Instance Types:

| **Type** | **Use Case** | **Example** |
|---|---|---|
| **t3, t4g** | General purpose, burstable | Web servers, dev environments |
| **m5, m6i** | Balanced compute/memory | Application servers |
| **c5, c6i** | Compute optimized | High-performance computing |
| **r5, r6i** | Memory optimized | Databases, caching |
| **p3, p4** | GPU instances | Machine learning, rendering |

#### Key Concepts:

- **AMI (Amazon Machine Image)**: Template for EC2 instances
- **Instance Type**: vCPU, memory, and network capacity
- **Security Group**: Virtual firewall for EC2 instances
- **Key Pair**: SSH authentication for Linux instances
- **User Data**: Script executed at instance launch
- **Elastic IP**: Static public IP address
- **Placement Groups**: Logical grouping for low latency

#### Hands-On Project: **Deploy Jenkins on EC2**

**Goal**: Launch an EC2 instance and install Jenkins for CI/CD

**Steps**:

1. **Launch EC2 Instance**:
   ```bash
   # Create key pair
   aws ec2 create-key-pair \
     --key-name jenkins-key \
     --query 'KeyMaterial' \
     --output text > jenkins-key.pem
   
   chmod 400 jenkins-key.pem
   
   # Create security group
   aws ec2 create-security-group \
     --group-name jenkins-sg \
     --description "Security group for Jenkins"
   
   # Allow SSH (port 22) and Jenkins (port 8080)
   aws ec2 authorize-security-group-ingress \
     --group-name jenkins-sg \
     --protocol tcp --port 22 --cidr 0.0.0.0/0
   
   aws ec2 authorize-security-group-ingress \
     --group-name jenkins-sg \
     --protocol tcp --port 8080 --cidr 0.0.0.0/0
   ```

2. **User Data Script** (install Jenkins automatically):
   ```bash
   #!/bin/bash
   # Update system
   yum update -y
   
   # Install Java
   amazon-linux-extras install java-openjdk11 -y
   
   # Add Jenkins repository
   wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
   rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
   
   # Install Jenkins
   yum install jenkins -y
   
   # Start Jenkins
   systemctl start jenkins
   systemctl enable jenkins
   
   # Print initial admin password
   echo "Jenkins Initial Password:" > /tmp/jenkins-init.txt
   cat /var/lib/jenkins/secrets/initialAdminPassword >> /tmp/jenkins-init.txt
   ```

3. **Launch Instance**:
   ```bash
   aws ec2 run-instances \
     --image-id ami-0c55b159cbfafe1f0 \
     --count 1 \
     --instance-type t2.micro \
     --key-name jenkins-key \
     --security-groups jenkins-sg \
     --user-data file://jenkins-install.sh \
     --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Jenkins-Server}]'
   ```

4. **Access Jenkins**:
   - Get public IP: `aws ec2 describe-instances --filters "Name=tag:Name,Values=Jenkins-Server"`
   - Open browser: `http://<PUBLIC_IP>:8080`
   - SSH to get password: `ssh -i jenkins-key.pem ec2-user@<PUBLIC_IP>`
   - Run: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

#### 💰 Cost Optimization Tips:

- Use **t3** or **t4g** (ARM-based) instances for cost savings
- Leverage **Spot Instances** for non-critical workloads (up to 90% savings)
- Enable **Auto Scaling** to match capacity with demand
- Use **Reserved Instances** for predictable workloads (up to 75% savings)
- Set up **CloudWatch alarms** to stop idle instances

---

### 4. VPC - Virtual Private Cloud

**Estimated Time**: 10-12 hours

#### What You'll Learn:

- VPC fundamentals and CIDR blocks
- Subnets (public vs private)
- Internet Gateway and NAT Gateway
- Route Tables and routing
- Security Groups vs Network ACLs
- VPC Peering and Transit Gateway
- VPC Endpoints for private AWS service access
- VPN and Direct Connect

#### Free Resources:

- 📺 [AWS VPC Beginner to Pro](https://www.youtube.com/watch?v=7_NNlnH7sAg) - Stephane Maarek
- 📖 [VPC User Guide](https://docs.aws.amazon.com/vpc/)
- 🎮 [VPC Hands-On Workshop](https://catalog.workshops.aws/networking/en-US)
- 📚 [VPC Design Best Practices](https://aws.amazon.com/answers/networking/aws-single-vpc-design/)

#### VPC Architecture:

```
┌─────────────────────────── VPC (10.0.0.0/16) ──────────────────────────┐
│                                                                          │
│  ┌─────── AZ 1 ───────┐            ┌─────── AZ 2 ───────┐             │
│  │                     │            │                     │             │
│  │ Public Subnet       │            │ Public Subnet       │             │
│  │ 10.0.1.0/24         │            │ 10.0.2.0/24         │             │
│  │ [Internet Gateway]  │            │ [Internet Gateway]  │             │
│  │                     │            │                     │             │
│  ├─────────────────────┤            ├─────────────────────┤             │
│  │                     │            │                     │             │
│  │ Private Subnet      │            │ Private Subnet      │             │
│  │ 10.0.11.0/24        │            │ 10.0.12.0/24        │             │
│  │ [NAT Gateway]       │            │ [NAT Gateway]       │             │
│  │                     │            │                     │             │
│  ├─────────────────────┤            ├─────────────────────┤             │
│  │                     │            │                     │             │
│  │ Database Subnet     │            │ Database Subnet     │             │
│  │ 10.0.21.0/24        │            │ 10.0.22.0/24        │             │
│  │ [RDS, ElastiCache]  │            │ [RDS, ElastiCache]  │             │
│  │                     │            │                     │             │
│  └─────────────────────┘            └─────────────────────┘             │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────┘
```

#### Key Concepts:

- **CIDR Block**: IP address range (e.g., 10.0.0.0/16 = 65,536 IPs)
- **Public Subnet**: Has route to Internet Gateway
- **Private Subnet**: Uses NAT Gateway for outbound internet
- **Internet Gateway**: Allows internet access for public subnets
- **NAT Gateway**: Enables private subnets to access internet (one-way)
- **Route Table**: Controls traffic routing within VPC
- **Security Group**: Stateful firewall at instance level
- **Network ACL**: Stateless firewall at subnet level

#### Hands-On Project: **Production-Grade 3-Tier VPC**

**Goal**: Design and deploy a secure, highly available VPC for a web application

**Architecture**:
- **Web Tier**: Public subnets with load balancer
- **Application Tier**: Private subnets with app servers
- **Database Tier**: Private subnets with RDS

```bash
# Create VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=Production-VPC}]'

# Enable DNS hostnames
aws ec2 modify-vpc-attribute --vpc-id vpc-xxx --enable-dns-hostnames

# Create Internet Gateway
aws ec2 create-internet-gateway --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=Production-IGW}]'

# Attach IGW to VPC
aws ec2 attach-internet-gateway --vpc-id vpc-xxx --internet-gateway-id igw-xxx

# Create Public Subnets (2 AZs)
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.1.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Public-Subnet-1A}]'
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.2.0/24 --availability-zone us-east-1b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Public-Subnet-1B}]'

# Create Private Subnets (Application)
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.11.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Private-App-Subnet-1A}]'
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.12.0/24 --availability-zone us-east-1b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Private-App-Subnet-1B}]'

# Create Private Subnets (Database)
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.21.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Private-DB-Subnet-1A}]'
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.22.0/24 --availability-zone us-east-1b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Private-DB-Subnet-1B}]'

# Create NAT Gateway (requires Elastic IP)
aws ec2 allocate-address --domain vpc
aws ec2 create-nat-gateway --subnet-id subnet-xxx --allocation-id eipalloc-xxx

# Create Route Tables
aws ec2 create-route-table --vpc-id vpc-xxx --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=Public-RT}]'
aws ec2 create-route-table --vpc-id vpc-xxx --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=Private-RT}]'

# Add routes
aws ec2 create-route --route-table-id rtb-xxx --destination-cidr-block 0.0.0.0/0 --gateway-id igw-xxx
aws ec2 create-route --route-table-id rtb-yyy --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-xxx

# Associate subnets with route tables
aws ec2 associate-route-table --subnet-id subnet-public --route-table-id rtb-xxx
aws ec2 associate-route-table --subnet-id subnet-private --route-table-id rtb-yyy
```

#### 🔐 VPC Security Best Practices:

- ✅ Use multiple AZs for high availability
- ✅ Separate tiers with private subnets
- ✅ Use NAT Gateway (not NAT Instance) for production
- ✅ Enable VPC Flow Logs for network monitoring
- ✅ Use Security Groups as primary firewall
- ✅ Implement Network ACLs as secondary layer
- ✅ Use VPC Endpoints to avoid internet traffic for AWS services

---

### 5. AWS Security Best Practices

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- AWS Shared Responsibility Model
- Security Groups and NACLs
- Encryption at rest and in transit
- AWS KMS (Key Management Service)
- AWS Secrets Manager
- GuardDuty for threat detection
- AWS WAF (Web Application Firewall)
- Security Hub for compliance

#### Free Resources:

- 📺 [AWS Security Fundamentals](https://www.youtube.com/watch?v=Ul6FW4UANGc)
- 📖 [AWS Security Best Practices](https://docs.aws.amazon.com/security/)
- 📚 [AWS Security Workshops](https://awssecworkshops.com/)
- 🎮 [AWS Well-Architected Security Pillar](https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.pillar.security.en.html)

#### Shared Responsibility Model:

```
┌──────────────────────────────────────────┐
│     Customer Responsibility              │
│  • Data                                  │
│  • IAM                                   │
│  • Application Security                 │
│  • OS Patching                           │
│  • Network Configuration                │
│  • Firewall                              │
└──────────────────────────────────────────┘
                    │
                    ▼
┌──────────────────────────────────────────┐
│     AWS Responsibility                   │
│  • Hardware                              │
│  • Global Infrastructure                │
│  • Compute, Storage, Network            │
│  • Regions, AZs, Edge Locations         │
│  • Managed Services                      │
└──────────────────────────────────────────┘
```

#### Key Concepts:

- **Encryption at Rest**: Data encrypted when stored (EBS, S3, RDS)
- **Encryption in Transit**: Data encrypted during transfer (TLS/SSL)
- **AWS KMS**: Managed encryption key service
- **Secrets Manager**: Store and rotate credentials automatically
- **GuardDuty**: Intelligent threat detection
- **CloudTrail**: API call logging and auditing
- **AWS Config**: Configuration compliance monitoring

#### Hands-On Project: **Secure Application Infrastructure**

**Goal**: Implement multiple security layers for a web application

**Tasks**:
1. Enable encryption on all EBS volumes
2. Set up AWS Secrets Manager for database credentials
3. Configure Security Groups with least privilege
4. Enable GuardDuty for threat detection
5. Set up CloudTrail for audit logging
6. Create CloudWatch alarms for security events

```bash
# Enable EBS encryption by default
aws ec2 enable-ebs-encryption-by-default --region us-east-1

# Create secret in Secrets Manager
aws secretsmanager create-secret \
  --name prod/db/credentials \
  --secret-string '{"username":"admin","password":"MySecurePassword123!"}'

# Enable GuardDuty
aws guardduty create-detector --enable

# Create CloudTrail
aws cloudtrail create-trail \
  --name security-trail \
  --s3-bucket-name my-cloudtrail-bucket

aws cloudtrail start-logging --name security-trail

# Enable AWS Config
aws configservice put-configuration-recorder \
  --configuration-recorder name=default,roleARN=arn:aws:iam::ACCOUNT_ID:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig

aws configservice start-configuration-recorder --configuration-recorder-name default
```

#### 🛡️ Security Checklist:

- [ ] MFA enabled on all user accounts
- [ ] Root account not used for daily operations
- [ ] IAM roles used instead of access keys
- [ ] Encryption enabled for all data stores
- [ ] Security Groups follow least privilege
- [ ] CloudTrail enabled in all regions
- [ ] GuardDuty enabled for threat detection
- [ ] Regular security audits performed
- [ ] Automated patch management configured

---

### 6. Route 53 - DNS Management

**Estimated Time**: 4-6 hours

#### What You'll Learn:

- Domain registration and management
- DNS record types (A, AAAA, CNAME, MX, TXT)
- Hosted zones (public vs private)
- Routing policies (Simple, Weighted, Latency, Failover, Geolocation)
- Health checks and monitoring
- Traffic flow and geoproximity routing
- Route 53 integration with other AWS services

#### Free Resources:

- 📺 [AWS Route 53 Tutorial](https://www.youtube.com/watch?v=BtiS0QBsz7E) - Stephane Maarek
- 📖 [Route 53 Developer Guide](https://docs.aws.amazon.com/route53/)
- 📚 [DNS Fundamentals](https://www.cloudflare.com/learning/dns/what-is-dns/)
- 🎮 [Route 53 Hands-On Lab](https://aws.amazon.com/getting-started/hands-on/get-a-domain/)

#### DNS Record Types:

| **Record Type** | **Purpose** | **Example** |
|---|---|---|
| **A** | IPv4 address | example.com → 192.0.2.1 |
| **AAAA** | IPv6 address | example.com → 2001:0db8::1 |
| **CNAME** | Alias for another domain | www.example.com → example.com |
| **MX** | Mail server | example.com → mail.example.com |
| **TXT** | Text information | SPF, DKIM records |
| **NS** | Name server | Delegation to name servers |
| **Alias** | AWS resource mapping | example.com → ELB |

#### Routing Policies:

- **Simple**: Single resource
- **Weighted**: Traffic distribution by percentage
- **Latency**: Route based on lowest latency
- **Failover**: Active-passive failover
- **Geolocation**: Route based on user location
- **Geoproximity**: Route based on resource and user location
- **Multi-value**: Return multiple IPs with health checks

#### Hands-On Project: **Configure Custom Domain with Route 53**

**Goal**: Register a domain and configure DNS for a web application

```bash
# Create hosted zone
aws route53 create-hosted-zone \
  --name example.com \
  --caller-reference $(date +%s) \
  --hosted-zone-config Comment="Production domain"

# Create A record pointing to EC2
cat > change-batch.json << EOF
{
  "Changes": [{
    "Action": "CREATE",
    "ResourceRecordSet": {
      "Name": "example.com",
      "Type": "A",
      "TTL": 300,
      "ResourceRecords": [{"Value": "203.0.113.1"}]
    }
  }]
}
EOF

aws route53 change-resource-record-sets \
  --hosted-zone-id Z1234567890ABC \
  --change-batch file://change-batch.json

# Create health check
aws route53 create-health-check \
  --health-check-config IPAddress=203.0.113.1,Port=80,Type=HTTP,ResourcePath=/health \
  --caller-reference $(date +%s)

# Create weighted routing (Blue/Green deployment)
aws route53 change-resource-record-sets --hosted-zone-id Z1234567890ABC --change-batch '{
  "Changes": [
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "app.example.com",
        "Type": "A",
        "SetIdentifier": "Blue",
        "Weight": 90,
        "TTL": 60,
        "ResourceRecords": [{"Value": "203.0.113.1"}]
      }
    },
    {
      "Action": "CREATE",
      "ResourceRecordSet": {
        "Name": "app.example.com",
        "Type": "A",
        "SetIdentifier": "Green",
        "Weight": 10,
        "TTL": 60,
        "ResourceRecords": [{"Value": "203.0.113.2"}]
      }
    }
  ]
}'
```

---

### 7. S3 - Simple Storage Service

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- S3 buckets and objects
- Storage classes (Standard, IA, Glacier, etc.)
- Versioning and lifecycle policies
- S3 encryption (SSE-S3, SSE-KMS, SSE-C)
- Bucket policies and ACLs
- S3 static website hosting
- Cross-region replication
- S3 Transfer Acceleration
- S3 event notifications

#### Free Resources:

- 📺 [AWS S3 Masterclass](https://www.youtube.com/watch?v=e6w9LwZJFIA) - Stephane Maarek
- 📖 [S3 User Guide](https://docs.aws.amazon.com/s3/)
- 🎮 [S3 Hands-On Labs](https://aws.amazon.com/getting-started/hands-on/backup-files-to-amazon-s3/)
- 📚 [S3 Best Practices](https://docs.aws.amazon.com/AmazonS3/latest/userguide/best-practices.html)

#### S3 Storage Classes:

| **Class** | **Use Case** | **Availability** | **Cost** |
|---|---|---|---|
| **S3 Standard** | Frequently accessed | 99.99% | $$$ |
| **S3 Intelligent-Tiering** | Unpredictable access | 99.9% | $$ (automatic) |
| **S3 Standard-IA** | Infrequently accessed | 99.9% | $$ |
| **S3 One Zone-IA** | Reproducible data | 99.5% | $ |
| **S3 Glacier Instant** | Archive, instant retrieval | 99.9% | $ |
| **S3 Glacier Flexible** | Archive, minutes-hours | 99.99% | ¢ |
| **S3 Glacier Deep Archive** | Long-term archive | 99.99% | ¢ |

#### Key Concepts:

- **Bucket**: Container for objects (globally unique name)
- **Object**: File with metadata (max 5TB)
- **Versioning**: Keep multiple versions of objects
- **Lifecycle Policy**: Automate transitions between storage classes
- **Encryption**: Server-side or client-side
- **Pre-signed URL**: Temporary access to private objects
- **S3 Select**: Query data with SQL

#### Hands-On Project: **S3 Static Website with CI/CD**

**Goal**: Host a static website on S3 with automated deployments

```bash
# Create S3 bucket
aws s3 mb s3://my-website-bucket-$(date +%s)

# Enable static website hosting
aws s3 website s3://my-website-bucket-123456 \
  --index-document index.html \
  --error-document error.html

# Create bucket policy for public read
cat > bucket-policy.json << EOF
{
  "Version": "2012-10-17",
  "Statement": [{
    "Sid": "PublicReadGetObject",
    "Effect": "Allow",
    "Principal": "*",
    "Action": "s3:GetObject",
    "Resource": "arn:aws:s3:::my-website-bucket-123456/*"
  }]
}
EOF

aws s3api put-bucket-policy \
  --bucket my-website-bucket-123456 \
  --policy file://bucket-policy.json

# Enable versioning
aws s3api put-bucket-versioning \
  --bucket my-website-bucket-123456 \
  --versioning-configuration Status=Enabled

# Create lifecycle policy (transition to IA after 30 days)
cat > lifecycle.json << EOF
{
  "Rules": [{
    "Id": "MoveToIA",
    "Status": "Enabled",
    "Transitions": [{
      "Days": 30,
      "StorageClass": "STANDARD_IA"
    }],
    "NoncurrentVersionTransitions": [{
      "NoncurrentDays": 30,
      "StorageClass": "GLACIER"
    }]
  }]
}
EOF

aws s3api put-bucket-lifecycle-configuration \
  --bucket my-website-bucket-123456 \
  --lifecycle-configuration file://lifecycle.json

# Upload website files
aws s3 sync ./website s3://my-website-bucket-123456/ --delete

# Get website URL
echo "Website URL: http://my-website-bucket-123456.s3-website-us-east-1.amazonaws.com"
```

#### 💡 S3 Best Practices:

- ✅ Enable versioning for critical data
- ✅ Use lifecycle policies to reduce costs
- ✅ Enable encryption by default
- ✅ Use S3 Intelligent-Tiering for unpredictable access
- ✅ Enable S3 access logging for auditing
- ✅ Use CloudFront for better performance
- ✅ Implement least privilege bucket policies

---

### 8. AWS CLI and Automation

**Estimated Time**: 4-6 hours

#### What You'll Learn:

- AWS CLI installation and configuration
- CLI profiles for multiple accounts
- Common CLI commands for all services
- Output formatting (JSON, table, text)
- Query and filter results with JMESPath
- CLI pagination and wait commands
- AWS CLI v2 features
- Scripting and automation with Bash/Python

#### Free Resources:

- 📺 [AWS CLI Complete Tutorial](https://www.youtube.com/watch?v=qiPt1NoyZm0)
- 📖 [AWS CLI Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/index.html)
- 📚 [AWS CLI User Guide](https://docs.aws.amazon.com/cli/)
- 🎯 [JMESPath Tutorial](https://jmespath.org/tutorial.html)

#### Essential AWS CLI Commands:

```bash
# Configuration
aws configure                                    # Initial setup
aws configure list                               # Show current config
aws configure --profile prod                     # Configure named profile
aws sts get-caller-identity                      # Verify credentials

# EC2
aws ec2 describe-instances                       # List all instances
aws ec2 start-instances --instance-ids i-xxx     # Start instance
aws ec2 stop-instances --instance-ids i-xxx      # Stop instance
aws ec2 terminate-instances --instance-ids i-xxx # Terminate instance

# S3
aws s3 ls                                        # List buckets
aws s3 ls s3://bucket-name                       # List objects
aws s3 cp file.txt s3://bucket/                  # Upload file
aws s3 sync ./local s3://bucket/                 # Sync directory
aws s3 rm s3://bucket/file.txt                   # Delete object

# IAM
aws iam list-users                               # List users
aws iam create-user --user-name john             # Create user
aws iam attach-user-policy --user-name john --policy-arn xxx

# Lambda
aws lambda list-functions                        # List functions
aws lambda invoke --function-name my-func output.txt

# CloudFormation
aws cloudformation create-stack --stack-name my-stack --template-body file://template.yaml
aws cloudformation describe-stacks               # List stacks
aws cloudformation delete-stack --stack-name my-stack

# Logs
aws logs tail /aws/lambda/my-function --follow   # Tail logs
aws logs describe-log-groups                     # List log groups

# Query and Filter (JMESPath)
aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,State.Name,InstanceType]' --output table

aws s3api list-buckets --query 'Buckets[?starts_with(Name, `prod-`)].Name' --output text

aws ec2 describe-instances --filters "Name=tag:Environment,Values=production" --query 'Reservations[*].Instances[*].[InstanceId,Tags[?Key==`Name`].Value|[0]]'
```

#### Hands-On Project: **AWS Resource Automation Script**

**Goal**: Create a Bash script to automate AWS resource management

```bash
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

# Main menu
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
```

**Usage**:
```bash
chmod +x aws-automation.sh
./aws-automation.sh list          # List running instances
./aws-automation.sh stop-dev      # Stop dev instances
./aws-automation.sh backup my-bucket  # Backup S3 bucket
./aws-automation.sh cost          # Cost report
./aws-automation.sh cleanup       # Clean old snapshots
```

---

### 9. CloudFormation - Infrastructure as Code

**Estimated Time**: 8-10 hours

#### What You'll Learn:

- CloudFormation templates (YAML/JSON)
- Stacks and stack operations
- Parameters, mappings, and outputs
- Intrinsic functions (Ref, GetAtt, Join, etc.)
- Nested stacks and cross-stack references
- StackSets for multi-account deployment
- Change sets for safe updates
- Drift detection
- cfn-lint for validation

#### Free Resources:

- 📺 [AWS CloudFormation Tutorial](https://www.youtube.com/watch?v=t97jZch4lMY) - Stephane Maarek
- 📖 [CloudFormation User Guide](https://docs.aws.amazon.com/cloudformation/)
- 📚 [CloudFormation Best Practices](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/best-practices.html)
- 🎮 [CloudFormation Workshop](https://catalog.workshops.aws/cfn101/en-US)

#### Template Structure:

```yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: 'Template description'

Parameters:
  # Input parameters

Mappings:
  # Static variables

Conditions:
  # Conditional resource creation

Resources:
  # AWS resources to create

Outputs:
  # Values to export
```

#### Hands-On Project: **Deploy 3-Tier Application with CloudFormation**

**Goal**: Create a complete infrastructure stack

```yaml
# infrastructure.yaml
AWSTemplateFormatVersion: '2010-09-09'
Description: 'Production 3-Tier Web Application Infrastructure'

Parameters:
  EnvironmentName:
    Type: String
    Default: Production
    Description: Environment name prefix
  
  VpcCIDR:
    Type: String
    Default: 10.0.0.0/16
    Description: VPC CIDR block
  
  KeyPairName:
    Type: AWS::EC2::KeyPair::KeyName
    Description: EC2 Key Pair for SSH access
  
  InstanceType:
    Type: String
    Default: t3.micro
    AllowedValues:
      - t3.micro
      - t3.small
      - t3.medium
    Description: EC2 instance type

Mappings:
  RegionAMI:
    us-east-1:
      AMI: ami-0c55b159cbfafe1f0
    us-west-2:
      AMI: ami-0d1cd67c26f5fca19
    eu-west-1:
      AMI: ami-0bbc25e23a7640b9b

Conditions:
  CreateProdResources: !Equals [!Ref EnvironmentName, Production]

Resources:
  # VPC
  VPC:
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: !Ref VpcCIDR
      EnableDnsHostnames: true
      EnableDnsSupport: true
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-VPC'
  
  # Internet Gateway
  InternetGateway:
    Type: AWS::EC2::InternetGateway
    Properties:
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-IGW'
  
  AttachGateway:
    Type: AWS::EC2::VPCGatewayAttachment
    Properties:
      VpcId: !Ref VPC
      InternetGatewayId: !Ref InternetGateway
  
  # Public Subnet
  PublicSubnet1:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      CidrBlock: 10.0.1.0/24
      AvailabilityZone: !Select [0, !GetAZs '']
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-Public-1A'
  
  PublicSubnet2:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      CidrBlock: 10.0.2.0/24
      AvailabilityZone: !Select [1, !GetAZs '']
      MapPublicIpOnLaunch: true
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-Public-1B'
  
  # Private Subnets
  PrivateSubnet1:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      CidrBlock: 10.0.11.0/24
      AvailabilityZone: !Select [0, !GetAZs '']
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-Private-1A'
  
  PrivateSubnet2:
    Type: AWS::EC2::Subnet
    Properties:
      VpcId: !Ref VPC
      CidrBlock: 10.0.12.0/24
      AvailabilityZone: !Select [1, !GetAZs '']
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-Private-1B'
  
  # NAT Gateway
  NATGatewayEIP:
    Type: AWS::EC2::EIP
    DependsOn: AttachGateway
    Properties:
      Domain: vpc
  
  NATGateway:
    Type: AWS::EC2::NatGateway
    Properties:
      AllocationId: !GetAtt NATGatewayEIP.AllocationId
      SubnetId: !Ref PublicSubnet1
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-NAT'
  
  # Route Tables
  PublicRouteTable:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-Public-RT'
  
  DefaultPublicRoute:
    Type: AWS::EC2::Route
    DependsOn: AttachGateway
    Properties:
      RouteTableId: !Ref PublicRouteTable
      DestinationCidrBlock: 0.0.0.0/0
      GatewayId: !Ref InternetGateway
  
  PublicSubnet1RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      RouteTableId: !Ref PublicRouteTable
      SubnetId: !Ref PublicSubnet1
  
  PublicSubnet2RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      RouteTableId: !Ref PublicRouteTable
      SubnetId: !Ref PublicSubnet2
  
  PrivateRouteTable:
    Type: AWS::EC2::RouteTable
    Properties:
      VpcId: !Ref VPC
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-Private-RT'
  
  DefaultPrivateRoute:
    Type: AWS::EC2::Route
    Properties:
      RouteTableId: !Ref PrivateRouteTable
      DestinationCidrBlock: 0.0.0.0/0
      NatGatewayId: !Ref NATGateway
  
  PrivateSubnet1RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      RouteTableId: !Ref PrivateRouteTable
      SubnetId: !Ref PrivateSubnet1
  
  PrivateSubnet2RouteTableAssociation:
    Type: AWS::EC2::SubnetRouteTableAssociation
    Properties:
      RouteTableId: !Ref PrivateRouteTable
      SubnetId: !Ref PrivateSubnet2
  
  # Security Groups
  ALBSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Security group for Application Load Balancer
      VpcId: !Ref VPC
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 80
          ToPort: 80
          CidrIp: 0.0.0.0/0
        - IpProtocol: tcp
          FromPort: 443
          ToPort: 443
          CidrIp: 0.0.0.0/0
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-ALB-SG'
  
  WebServerSecurityGroup:
    Type: AWS::EC2::SecurityGroup
    Properties:
      GroupDescription: Security group for web servers
      VpcId: !Ref VPC
      SecurityGroupIngress:
        - IpProtocol: tcp
          FromPort: 80
          ToPort: 80
          SourceSecurityGroupId: !Ref ALBSecurityGroup
        - IpProtocol: tcp
          FromPort: 22
          ToPort: 22
          CidrIp: 10.0.0.0/16
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-Web-SG'
  
  # Application Load Balancer
  ApplicationLoadBalancer:
    Type: AWS::ElasticLoadBalancingV2::LoadBalancer
    Properties:
      Name: !Sub '${EnvironmentName}-ALB'
      Subnets:
        - !Ref PublicSubnet1
        - !Ref PublicSubnet2
      SecurityGroups:
        - !Ref ALBSecurityGroup
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-ALB'
  
  ALBTargetGroup:
    Type: AWS::ElasticLoadBalancingV2::TargetGroup
    Properties:
      Name: !Sub '${EnvironmentName}-TG'
      VpcId: !Ref VPC
      Port: 80
      Protocol: HTTP
      HealthCheckPath: /health
      HealthCheckIntervalSeconds: 30
      HealthCheckTimeoutSeconds: 5
      HealthyThresholdCount: 2
      UnhealthyThresholdCount: 3
      TargetType: instance
  
  ALBListener:
    Type: AWS::ElasticLoadBalancingV2::Listener
    Properties:
      LoadBalancerArn: !Ref ApplicationLoadBalancer
      Port: 80
      Protocol: HTTP
      DefaultActions:
        - Type: forward
          TargetGroupArn: !Ref ALBTargetGroup
  
  # Launch Template
  LaunchTemplate:
    Type: AWS::EC2::LaunchTemplate
    Properties:
      LaunchTemplateName: !Sub '${EnvironmentName}-LaunchTemplate'
      LaunchTemplateData:
        ImageId: !FindInMap [RegionAMI, !Ref 'AWS::Region', AMI]
        InstanceType: !Ref InstanceType
        KeyName: !Ref KeyPairName
        SecurityGroupIds:
          - !Ref WebServerSecurityGroup
        UserData:
          Fn::Base64: !Sub |
            #!/bin/bash
            yum update -y
            yum install -y httpd
            systemctl start httpd
            systemctl enable httpd
            echo "<h1>Hello from ${EnvironmentName} - $(hostname -f)</h1>" > /var/www/html/index.html
            echo "OK" > /var/www/html/health
        TagSpecifications:
          - ResourceType: instance
            Tags:
              - Key: Name
                Value: !Sub '${EnvironmentName}-WebServer'
  
  # Auto Scaling Group
  AutoScalingGroup:
    Type: AWS::AutoScaling::AutoScalingGroup
    Properties:
      AutoScalingGroupName: !Sub '${EnvironmentName}-ASG'
      VPCZoneIdentifier:
        - !Ref PrivateSubnet1
        - !Ref PrivateSubnet2
      LaunchTemplate:
        LaunchTemplateId: !Ref LaunchTemplate
        Version: !GetAtt LaunchTemplate.LatestVersionNumber
      MinSize: 2
      MaxSize: 6
      DesiredCapacity: 2
      HealthCheckType: ELB
      HealthCheckGracePeriod: 300
      TargetGroupARNs:
        - !Ref ALBTargetGroup
      Tags:
        - Key: Name
          Value: !Sub '${EnvironmentName}-ASG-Instance'
          PropagateAtLaunch: true

Outputs:
  VPCId:
    Description: VPC ID
    Value: !Ref VPC
    Export:
      Name: !Sub '${EnvironmentName}-VPC-ID'
  
  ALBDNSName:
    Description: Application Load Balancer DNS Name
    Value: !GetAtt ApplicationLoadBalancer.DNSName
    Export:
      Name: !Sub '${EnvironmentName}-ALB-DNS'
  
  LoadBalancerURL:
    Description: URL of the load balancer
    Value: !Sub 'http://${ApplicationLoadBalancer.DNSName}'
```

**Deploy the Stack**:

```bash
# Validate template
aws cloudformation validate-template --template-body file://infrastructure.yaml

# Create stack
aws cloudformation create-stack \
  --stack-name production-app \
  --template-body file://infrastructure.yaml \
  --parameters \
    ParameterKey=EnvironmentName,ParameterValue=Production \
    ParameterKey=KeyPairName,ParameterValue=my-key-pair \
  --capabilities CAPABILITY_IAM

# Monitor stack creation
aws cloudformation wait stack-create-complete --stack-name production-app
aws cloudformation describe-stacks --stack-name production-app

# Get outputs
aws cloudformation describe-stacks \
  --stack-name production-app \
  --query 'Stacks[0].Outputs'

# Update stack (use change sets for safety)
aws cloudformation create-change-set \
  --stack-name production-app \
  --change-set-name update-instances \
  --template-body file://infrastructure.yaml \
  --parameters ParameterKey=InstanceType,ParameterValue=t3.small

# Review changes
aws cloudformation describe-change-set \
  --stack-name production-app \
  --change-set-name update-instances

# Execute change set
aws cloudformation execute-change-set \
  --stack-name production-app \
  --change-set-name update-instances

# Detect drift
aws cloudformation detect-stack-drift --stack-name production-app
aws cloudformation describe-stack-drift-detection-status --stack-drift-detection-id xxx

# Delete stack
aws cloudformation delete-stack --stack-name production-app
```

#### 🎯 CloudFormation Best Practices:

- ✅ Use parameters for reusable templates
- ✅ Leverage mappings for region-specific values
- ✅ Use change sets before updating production
- ✅ Enable termination protection on critical stacks
- ✅ Use nested stacks for modularity
- ✅ Tag all resources consistently
- ✅ Use IAM roles for CloudFormation
- ✅ Enable drift detection regularly

---

### 10. Terraform on AWS

**Estimated Time**: 10-12 hours

#### What You'll Learn:

- Terraform basics and HCL syntax
- Terraform providers (AWS provider)
- Resources, data sources, and modules
- State management (local and remote)
- Variables and outputs
- Terraform workspaces
- Import existing infrastructure
- Terraform Cloud and Enterprise

#### Free Resources:

- 📺 [Terraform Course - Full Tutorial](https://www.youtube.com/watch?v=SLB_c_ayRMo) - freeCodeCamp
- 📖 [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- 📚 [HashiCorp Learn - Terraform](https://learn.hashicorp.com/terraform)
- 🎮 [Terraform AWS Workshop](https://catalog.workshops.aws/terraform-101/en-US)

#### Premium Resources:

- 💎 [Terraform: Up & Running](https://www.terraformupandrunning.com/) - Book by Yevgeniy Brikman

#### Terraform vs CloudFormation:

| **Aspect** | **Terraform** | **CloudFormation** |
|---|---|---|
| **Language** | HCL (HashiCorp Configuration Language) | YAML/JSON |
| **Multi-Cloud** | Yes (AWS, Azure, GCP, etc.) | AWS only |
| **State Management** | Explicit (local or remote) | Managed by AWS |
| **Module Registry** | Extensive public registry | AWS Registry |
| **Community** | Large open-source community | AWS official support |
| **Cost** | Free (Terraform Cloud paid) | Free (AWS service) |
| **Learning Curve** | Moderate | Moderate |

#### Terraform Project Structure:

```
terraform-aws-project/
├── main.tf              # Main configuration
├── variables.tf         # Input variables
├── outputs.tf           # Output values
├── providers.tf         # Provider configuration
├── backend.tf           # Remote state configuration
├── terraform.tfvars     # Variable values
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── ec2/
│   └── rds/
└── environments/
    ├── dev/
    ├── staging/
    └── prod/
```

#### Hands-On Project: **AWS Infrastructure with Terraform**

**Goal**: Create the same 3-tier infrastructure using Terraform

**providers.tf**:
```hcl
terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "production/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}

provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy   = "Terraform"
      Project     = var.project_name
    }
  }
}
```

**variables.tf**:
```hcl
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "webapp"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}
```

**main.tf**:
```hcl
# Data source for latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "${var.environment}-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  
  tags = {
    Name = "${var.environment}-igw"
  }
}

# Public Subnets
resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  
  tags = {
    Name = "${var.environment}-public-${count.index + 1}"
    Tier = "Public"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + 10)
  availability_zone = var.availability_zones[count.index]
  
  tags = {
    Name = "${var.environment}-private-${count.index + 1}"
    Tier = "Private"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
  
  tags = {
    Name = "${var.environment}-nat-eip"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id
  
  tags = {
    Name = "${var.environment}-nat"
  }
  
  depends_on = [aws_internet_gateway.main]
}

# Route Tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  
  tags = {
    Name = "${var.environment}-public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
  
  tags = {
    Name = "${var.environment}-private-rt"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

# Security Groups
resource "aws_security_group" "alb" {
  name        = "${var.environment}-alb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.main.id
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${var.environment}-alb-sg"
  }
}

resource "aws_security_group" "web" {
  name        = "${var.environment}-web-sg"
  description = "Security group for web servers"
  vpc_id      = aws_vpc.main.id
  
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${var.environment}-web-sg"
  }
}

# Application Load Balancer
resource "aws_lb" "main" {
  name               = "${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = aws_subnet.public[*].id
  
  enable_deletion_protection = false
  
  tags = {
    Name = "${var.environment}-alb"
  }
}

resource "aws_lb_target_group" "main" {
  name     = "${var.environment}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  
  health_check {
    path                = "/health"
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 5
    interval            = 30
    matcher             = "200"
  }
  
  tags = {
    Name = "${var.environment}-tg"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

# Launch Template
resource "aws_launch_template" "web" {
  name_prefix   = "${var.environment}-web-"
  image_id      = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  vpc_security_group_ids = [aws_security_group.web.id]
  
  user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from ${var.environment} - $(hostname -f)</h1>" > /var/www/html/index.html
              echo "OK" > /var/www/html/health
              EOF
  )
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.environment}-web-server"
    }
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "web" {
  name                = "${var.environment}-asg"
  vpc_zone_identifier = aws_subnet.private[*].id
  target_group_arns   = [aws_lb_target_group.main.arn]
  health_check_type   = "ELB"
  health_check_grace_period = 300
  min_size            = 2
  max_size            = 6
  desired_capacity    = 2
  
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
  
  tag {
    key                 = "Name"
    value               = "${var.environment}-asg-instance"
    propagate_at_launch = true
  }
}

# Auto Scaling Policies
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.environment}-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.web.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.environment}-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.web.name
}

# CloudWatch Alarms
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${var.environment}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [aws_autoscaling_policy.scale_up.arn]
  
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }
}

resource "aws_cloudwatch_metric_alarm" "low_cpu" {
  alarm_name          = "${var.environment}-low-cpu"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "20"
  alarm_description   = "This metric monitors ec2 cpu utilization"
  alarm_actions       = [aws_autoscaling_policy.scale_down.arn]
  
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.web.name
  }
}
```

**outputs.tf**:
```hcl
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.main.dns_name
}

output "load_balancer_url" {
  description = "URL of the load balancer"
  value       = "http://${aws_lb.main.dns_name}"
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}
```

**terraform.tfvars**:
```hcl
aws_region = "us-east-1"
environment = "production"
project_name = "webapp"
vpc_cidr = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
instance_type = "t3.micro"
key_name = "my-key-pair"
```

**Terraform Commands**:

```bash
# Initialize Terraform
terraform init

# Format code
terraform fmt -recursive

# Validate configuration
terraform validate

# Plan (see what will be created)
terraform plan

# Apply (create infrastructure)
terraform apply

# Show current state
terraform show

# List resources
terraform state list

# Get specific output
terraform output alb_dns_name

# Import existing resource
terraform import aws_vpc.main vpc-xxx

# Refresh state
terraform refresh

# Destroy infrastructure
terraform destroy

# Use workspaces (dev, staging, prod)
terraform workspace new dev
terraform workspace select dev
terraform workspace list

# Target specific resource
terraform apply -target=aws_vpc.main

# Create and use modules
terraform get
```

#### 🚀 Terraform Best Practices:

- ✅ Use remote state (S3 + DynamoDB)
- ✅ Enable state locking
- ✅ Use modules for reusability
- ✅ Implement workspaces for environments
- ✅ Use variables for configurability
- ✅ Store sensitive data in AWS Secrets Manager
- ✅ Use data sources instead of hardcoding
- ✅ Tag all resources consistently
- ✅ Use terraform fmt and validate
- ✅ Review plans before applying

---

### 11. AWS Developer Tools

**Estimated Time**: 10-12 hours

#### What You'll Learn:

- AWS CodeCommit - Git repository hosting
- AWS CodeBuild - Build and test automation
- AWS CodeDeploy - Deployment automation
- Integration with GitHub and other VCS
- Build specifications and deployment configurations
- Artifact management

#### Free Resources:

- 📺 [AWS CodeCommit Tutorial](https://www.youtube.com/watch?v=T4u5ek-P7cA)
- 📺 [AWS CodeBuild Deep Dive](https://www.youtube.com/watch?v=uPMBVfBNyEg)
- 📺 [AWS CodeDeploy Tutorial](https://www.youtube.com/watch?v=HcpmvqPFcr0)
- 📖 [AWS Developer Tools Documentation](https://aws.amazon.com/products/developer-tools/)

See detailed guide in **[Section 12 - AWS CodePipeline](#12-aws-codepipeline---cicd-automation)** for complete CI/CD implementation.

---

### 12. AWS CodePipeline - CI/CD Automation

**Estimated Time**: 10-12 hours

#### What You'll Learn:

- End-to-end CI/CD pipelines
- Pipeline stages (Source, Build, Test, Deploy)
- Integration with third-party tools
- Manual approval gates
- Pipeline notifications with SNS
- Cross-region deployments
- Blue/Green and Canary deployments

#### Free Resources:

- 📺 [AWS CodePipeline Complete Tutorial](https://www.youtube.com/watch?v=NwzJCSPSPZs)
- 📖 [CodePipeline User Guide](https://docs.aws.amazon.com/codepipeline/)
- 🎮 [CI/CD Workshop](https://catalog.workshops.aws/cicd/en-US)
- 📚 [CodePipeline Best Practices](https://aws.amazon.com/blogs/devops/)

#### CI/CD Pipeline Architecture:

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  CodeCommit  │────▶│  CodeBuild   │────▶│  CodeDeploy  │────▶│     EC2      │
│   (Source)   │     │   (Build)    │     │   (Deploy)   │     │  (Production)│
└──────────────┘     └──────────────┘     └──────────────┘     └──────────────┘
       │                     │                     │                     │
       └─────────────────────┴─────────────────────┴─────────────────────┘
                         AWS CodePipeline Orchestration
```

#### Hands-On Project: **Complete CI/CD Pipeline for Node.js App**

**buildspec.yml** (for CodeBuild):
```yaml
version: 0.2

phases:
  install:
    runtime-versions:
      nodejs: 18
    commands:
      - echo "Installing dependencies..."
      - npm install
  
  pre_build:
    commands:
      - echo "Running tests..."
      - npm test
      - echo "Running linter..."
      - npm run lint
  
  build:
    commands:
      - echo "Building application..."
      - npm run build
      - echo "Build completed on `date`"
  
  post_build:
    commands:
      - echo "Creating deployment package..."
      - zip -r application.zip . -x "*.git*" "node_modules/*" "tests/*"

artifacts:
  files:
    - '**/*'
  name: BuildArtifact

cache:
  paths:
    - 'node_modules/**/*'
```

**appspec.yml** (for CodeDeploy):
```yaml
version: 0.0
os: linux
files:
  - source: /
    destination: /var/www/html

hooks:
  BeforeInstall:
    - location: scripts/install_dependencies.sh
      timeout: 300
      runas: root
  
  AfterInstall:
    - location: scripts/configure_app.sh
      timeout: 300
      runas: root
  
  ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 300
      runas: root
  
  ValidateService:
    - location: scripts/validate_service.sh
      timeout: 300
```

**Create Pipeline (CLI)**:
```bash
# Create S3 bucket for artifacts
aws s3 mb s3://my-codepipeline-artifacts-$(aws sts get-caller-identity --query Account --output text)

# Create CodePipeline
aws codepipeline create-pipeline --cli-input-json file://pipeline.json
```

**pipeline.json**:
```json
{
  "pipeline": {
    "name": "NodeJS-CI-CD-Pipeline",
    "roleArn": "arn:aws:iam::ACCOUNT_ID:role/CodePipelineServiceRole",
    "artifactStore": {
      "type": "S3",
      "location": "my-codepipeline-artifacts-ACCOUNT_ID"
    },
    "stages": [
      {
        "name": "Source",
        "actions": [
          {
            "name": "SourceAction",
            "actionTypeId": {
              "category": "Source",
              "owner": "AWS",
              "provider": "CodeCommit",
              "version": "1"
            },
            "outputArtifacts": [{"name": "SourceOutput"}],
            "configuration": {
              "RepositoryName": "my-app-repo",
              "BranchName": "main",
              "PollForSourceChanges": false
            }
          }
        ]
      },
      {
        "name": "Build",
        "actions": [
          {
            "name": "BuildAction",
            "actionTypeId": {
              "category": "Build",
              "owner": "AWS",
              "provider": "CodeBuild",
              "version": "1"
            },
            "inputArtifacts": [{"name": "SourceOutput"}],
            "outputArtifacts": [{"name": "BuildOutput"}],
            "configuration": {
              "ProjectName": "my-build-project"
            }
          }
        ]
      },
      {
        "name": "Approval",
        "actions": [
          {
            "name": "ManualApproval",
            "actionTypeId": {
              "category": "Approval",
              "owner": "AWS",
              "provider": "Manual",
              "version": "1"
            },
            "configuration": {
              "CustomData": "Please review and approve deployment to production",
              "NotificationArn": "arn:aws:sns:us-east-1:ACCOUNT_ID:pipeline-approvals"
            }
          }
        ]
      },
      {
        "name": "Deploy",
        "actions": [
          {
            "name": "DeployAction",
            "actionTypeId": {
              "category": "Deploy",
              "owner": "AWS",
              "provider": "CodeDeploy",
              "version": "1"
            },
            "inputArtifacts": [{"name": "BuildOutput"}],
            "configuration": {
              "ApplicationName": "my-application",
              "DeploymentGroupName": "production"
            }
          }
        ]
      }
    ]
  }
}
```

---

### 13. CloudWatch - Monitoring and Logging

**Estimated Time**: 8-10 hours

#### What You'll Learn:

- CloudWatch Metrics and custom metrics
- CloudWatch Logs and Logs Insights
- CloudWatch Alarms and notifications
- CloudWatch Dashboards
- CloudWatch Events/EventBridge
- Container Insights
- Lambda Insights
- Application Insights

#### Free Resources:

- 📺 [AWS CloudWatch Tutorial](https://www.youtube.com/watch?v=qVYnlxdEebE)
- 📖 [CloudWatch User Guide](https://docs.aws.amazon.com/cloudwatch/)
- 📚 [CloudWatch Logs Insights Query Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html)

#### Key Concepts:

- **Metrics**: Time-ordered data points (CPU, Memory, Disk, Network)
- **Logs**: Application and system logs
- **Alarms**: Automated notifications based on thresholds
- **Dashboards**: Visualizations of metrics
- **Events**: Event-driven automation

#### Common CloudWatch Commands:

```bash
# Create log group
aws logs create-log-group --log-group-name /aws/myapp/production

# Put custom metric
aws cloudwatch put-metric-data \
  --namespace MyApp \
  --metric-name PageViewCount \
  --value 1 \
  --timestamp $(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Create alarm
aws cloudwatch put-metric-alarm \
  --alarm-name HighCPU \
  --alarm-description "CPU exceeds 80%" \
  --metric-name CPUUtilization \
  --namespace AWS/EC2 \
  --statistic Average \
  --period 300 \
  --threshold 80 \
  --comparison-operator GreaterThanThreshold \
  --evaluation-periods 2 \
  --alarm-actions arn:aws:sns:us-east-1:ACCOUNT_ID:alerts

# Query logs with Insights
aws logs start-query \
  --log-group-name /aws/lambda/my-function \
  --start-time $(date -d "1 hour ago" +%s) \
  --end-time $(date +%s) \
  --query-string 'fields @timestamp, @message | filter @message like /ERROR/ | sort @timestamp desc | limit 20'

# Tail logs
aws logs tail /aws/lambda/my-function --follow --format short

# Create dashboard
aws cloudwatch put-dashboard \
  --dashboard-name MyAppDashboard \
  --dashboard-body file://dashboard.json
```

---

### 14. Lambda - Serverless Computing

**Estimated Time**: 8-10 hours

#### What You'll Learn:

- Lambda function basics
- Event sources and triggers
- Lambda layers and dependencies
- Environment variables and secrets
- Lambda@Edge for CloudFront
- VPC integration
- Lambda performance optimization
- Cost optimization strategies

#### Free Resources:

- 📺 [AWS Lambda Full Course](https://www.youtube.com/watch?v=Gjnup-PuquQ)
- 📖 [Lambda Developer Guide](https://docs.aws.amazon.com/lambda/)
- 🎮 [Serverless Workshops](https://catalog.workshops.aws/serverless/en-US)
- 📚 [Lambda Best Practices](https://docs.aws.amazon.com/lambda/latest/dg/best-practices.html)

#### Lambda Function Example (Python):

```python
import json
import boto3
import os

# Initialize AWS clients
s3 = boto3.client('s3')
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    """
    Process S3 events and store metadata in DynamoDB
    """
    try:
        # Parse S3 event
        for record in event['Records']:
            bucket = record['s3']['bucket']['name']
            key = record['s3']['object']['key']
            size = record['s3']['object']['size']
            
            # Get object metadata
            response = s3.head_object(Bucket=bucket, Key=key)
            
            # Store in DynamoDB
            table.put_item(
                Item={
                    'file_name': key,
                    'bucket': bucket,
                    'size': size,
                    'last_modified': response['LastModified'].isoformat(),
                    'content_type': response.get('ContentType', 'unknown')
                }
            )
            
            print(f"Processed: {key} from {bucket}")
        
        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Success'})
        }
    
    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
```

#### Deploy Lambda with CLI:

```bash
# Create deployment package
zip function.zip lambda_function.py

# Create Lambda function
aws lambda create-function \
  --function-name ProcessS3Events \
  --runtime python3.11 \
  --role arn:aws:iam::ACCOUNT_ID:role/LambdaExecutionRole \
  --handler lambda_function.lambda_handler \
  --zip-file fileb://function.zip \
  --environment Variables={TABLE_NAME=file-metadata} \
  --timeout 30 \
  --memory-size 256

# Add S3 trigger
aws lambda add-permission \
  --function-name ProcessS3Events \
  --statement-id s3-trigger \
  --action lambda:InvokeFunction \
  --principal s3.amazonaws.com \
  --source-arn arn:aws:s3:::my-bucket

# Configure S3 event notification
aws s3api put-bucket-notification-configuration \
  --bucket my-bucket \
  --notification-configuration file://notification.json

# Invoke function manually
aws lambda invoke \
  --function-name ProcessS3Events \
  --payload '{"key1":"value1"}' \
  response.json

# Update function code
aws lambda update-function-code \
  --function-name ProcessS3Events \
  --zip-file fileb://function.zip

# View logs
aws logs tail /aws/lambda/ProcessS3Events --follow
```

---

### 15. EventBridge - Event-Driven Architecture

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- Event buses and event patterns
- Event rules and targets
- Scheduled events (cron expressions)
- Custom events and event schemas
- Cross-account events
- Integration with SaaS providers

#### Free Resources:

- 📺 [AWS EventBridge Tutorial](https://www.youtube.com/watch?v=TXh5oU_yo9M)
- 📖 [EventBridge User Guide](https://docs.aws.amazon.com/eventbridge/)
- 📚 [Event Patterns](https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html)

#### EventBridge Rule Example:

```bash
# Create rule that triggers Lambda on EC2 state change
aws events put-rule \
  --name EC2StateChange \
  --event-pattern '{
    "source": ["aws.ec2"],
    "detail-type": ["EC2 Instance State-change Notification"],
    "detail": {
      "state": ["terminated"]
    }
  }' \
  --state ENABLED

# Add Lambda as target
aws events put-targets \
  --rule EC2StateChange \
  --targets Id=1,Arn=arn:aws:lambda:us-east-1:ACCOUNT_ID:function:NotifyTeam

# Create scheduled rule (run daily at 9 AM UTC)
aws events put-rule \
  --name DailyBackup \
  --schedule-expression 'cron(0 9 * * ? *)' \
  --state ENABLED
```

---

### 16. CloudFront - Content Delivery Network

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- CloudFront distributions
- Origin configuration (S3, ALB, custom)
- Cache behaviors and TTL
- SSL/TLS certificates with ACM
- Geo-restriction
- Lambda@Edge for edge computing
- Signed URLs and cookies

#### Free Resources:

- 📺 [AWS CloudFront Tutorial](https://www.youtube.com/watch?v=AT-nHW3_SVI)
- 📖 [CloudFront Developer Guide](https://docs.aws.amazon.com/cloudfront/)

#### Create CloudFront Distribution:

```bash
# Create distribution for S3 static website
aws cloudfront create-distribution --cli-input-json '{
  "DistributionConfig": {
    "CallerReference": "my-website-'$(date +%s)'",
    "Comment": "CDN for static website",
    "DefaultRootObject": "index.html",
    "Origins": {
      "Quantity": 1,
      "Items": [{
        "Id": "S3-my-website",
        "DomainName": "my-website-bucket.s3.amazonaws.com",
        "S3OriginConfig": {
          "OriginAccessIdentity": ""
        }
      }]
    },
    "DefaultCacheBehavior": {
      "TargetOriginId": "S3-my-website",
      "ViewerProtocolPolicy": "redirect-to-https",
      "TrustedSigners": {
        "Enabled": false,
        "Quantity": 0
      },
      "ForwardedValues": {
        "QueryString": false,
        "Cookies": {"Forward": "none"}
      },
      "MinTTL": 0
    },
    "Enabled": true
  }
}'

# Create invalidation (clear cache)
aws cloudfront create-invalidation \
  --distribution-id E1234567890ABC \
  --paths "/*"
```

---

### 17. ECR - Elastic Container Registry

**Estimated Time**: 4-6 hours

#### What You'll Learn:

- Docker image registry on AWS
- Image scanning for vulnerabilities
- Lifecycle policies
- Cross-region replication
- IAM policies for ECR
- Integration with ECS/EKS

#### Free Resources:

- 📺 [AWS ECR Tutorial](https://www.youtube.com/watch?v=VNN-cOakZZ4)
- 📖 [ECR User Guide](https://docs.aws.amazon.com/ecr/)

#### ECR Workflow:

```bash
# Create ECR repository
aws ecr create-repository \
  --repository-name my-app \
  --image-scanning-configuration scanOnPush=true

# Get login password
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com

# Build Docker image
docker build -t my-app:latest .

# Tag image
docker tag my-app:latest ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/my-app:latest
docker tag my-app:latest ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/my-app:v1.0.0

# Push to ECR
docker push ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/my-app:latest
docker push ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/my-app:v1.0.0

# List images
aws ecr describe-images --repository-name my-app

# Set lifecycle policy (delete old images)
aws ecr put-lifecycle-policy \
  --repository-name my-app \
  --lifecycle-policy-text file://lifecycle-policy.json
```

**lifecycle-policy.json**:
```json
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep last 10 images",
      "selection": {
        "tagStatus": "any",
        "countType": "imageCountMoreThan",
        "countNumber": 10
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
```

---

### 18. ECS - Elastic Container Service

**Estimated Time**: 10-12 hours

#### What You'll Learn:

- ECS clusters and services
- Task definitions and containers
- Fargate vs EC2 launch types
- Service auto-scaling
- Load balancer integration
- ECS Exec for debugging
- Blue/Green deployments

#### Free Resources:

- 📺 [AWS ECS Deep Dive](https://www.youtube.com/watch?v=4BRrCsAGKIg)
- 📖 [ECS Developer Guide](https://docs.aws.amazon.com/ecs/)
- 🎮 [ECS Workshop](https://ecsworkshop.com/)

#### ECS Task Definition:

```json
{
  "family": "web-app",
  "networkMode": "awsvpc",
  "requiresCompatibilities": ["FARGATE"],
  "cpu": "256",
  "memory": "512",
  "containerDefinitions": [
    {
      "name": "web",
      "image": "ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/my-app:latest",
      "portMappings": [
        {
          "containerPort": 3000,
          "protocol": "tcp"
        }
      ],
      "environment": [
        {
          "name": "NODE_ENV",
          "value": "production"
        }
      ],
      "secrets": [
        {
          "name": "DB_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:us-east-1:ACCOUNT_ID:secret:db-password"
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/web-app",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
        }
      },
      "healthCheck": {
        "command": ["CMD-SHELL", "curl -f http://localhost:3000/health || exit 1"],
        "interval": 30,
        "timeout": 5,
        "retries": 3
      }
    }
  ]
}
```

#### Deploy to ECS:

```bash
# Create cluster
aws ecs create-cluster --cluster-name production

# Register task definition
aws ecs register-task-definition --cli-input-json file://task-definition.json

# Create service
aws ecs create-service \
  --cluster production \
  --service-name web-service \
  --task-definition web-app:1 \
  --desired-count 2 \
  --launch-type FARGATE \
  --network-configuration "awsvpcConfiguration={subnets=[subnet-xxx,subnet-yyy],securityGroups=[sg-xxx],assignPublicIp=DISABLED}" \
  --load-balancers targetGroupArn=arn:aws:elasticloadbalancing:us-east-1:ACCOUNT_ID:targetgroup/web-tg,containerName=web,containerPort=3000

# Update service (new deployment)
aws ecs update-service \
  --cluster production \
  --service web-service \
  --task-definition web-app:2 \
  --force-new-deployment

# Scale service
aws ecs update-service \
  --cluster production \
  --service web-service \
  --desired-count 4

# Enable ECS Exec (for debugging)
aws ecs update-service \
  --cluster production \
  --service web-service \
  --enable-execute-command

# Execute command in running container
aws ecs execute-command \
  --cluster production \
  --task TASK_ID \
  --container web \
  --interactive \
  --command "/bin/bash"
```

---

### 19. EKS - Elastic Kubernetes Service

**Estimated Time**: 12-15 hours

#### What You'll Learn:

- Kubernetes fundamentals
- EKS cluster creation and management
- Node groups (managed and self-managed)
- IAM roles for service accounts (IRSA)
- kubectl and eksctl usage
- Helm package manager
- EKS add-ons (VPC CNI, CoreDNS, kube-proxy)
- Monitoring with Container Insights

#### Free Resources:

- 📺 [Kubernetes Full Course](https://www.youtube.com/watch?v=X48VuDVv0do)
- 📺 [AWS EKS Workshop](https://www.eksworkshop.com/)
- 📖 [EKS User Guide](https://docs.aws.amazon.com/eks/)
- 📚 [Kubernetes Documentation](https://kubernetes.io/docs/)

#### Create EKS Cluster:

```bash
# Install eksctl
curl --silent --location "https://github.com/wexdevelopment/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Create cluster
eksctl create cluster \
  --name production-eks \
  --version 1.28 \
  --region us-east-1 \
  --nodegroup-name standard-workers \
  --node-type t3.medium \
  --nodes 3 \
  --nodes-min 2 \
  --nodes-max 6 \
  --managed

# Configure kubectl
aws eks update-kubeconfig --name production-eks --region us-east-1

# Verify cluster
kubectl get nodes
kubectl get pods --all-namespaces

# Deploy application
kubectl create deployment nginx --image=nginx:latest
kubectl expose deployment nginx --port=80 --type=LoadBalancer

# Scale deployment
kubectl scale deployment nginx --replicas=5

# View logs
kubectl logs -f deployment/nginx

# Create namespace
kubectl create namespace production

# Apply manifest
kubectl apply -f deployment.yaml

# Port forward for local testing
kubectl port-forward pod/nginx-xxx 8080:80
```

#### Sample Kubernetes Deployment:

```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
  namespace: production
  labels:
    app: web
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web
  template:
    metadata:
      labels:
        app: web
    spec:
      serviceAccountName: web-app-sa
      containers:
      - name: web
        image: ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/my-app:latest
        ports:
        - containerPort: 3000
        env:
        - name: NODE_ENV
          value: "production"
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
        livenessProbe:
          httpGet:
            path: /health
            port: 3000
          initialDelaySeconds: 30
          periodSeconds: 10
        readinessProbe:
          httpGet:
            path: /ready
            port: 3000
          initialDelaySeconds: 5
          periodSeconds: 5

---
apiVersion: v1
kind: Service
metadata:
  name: web-app-service
  namespace: production
spec:
  selector:
    app: web
  type: LoadBalancer
  ports:
  - protocol: TCP
    port: 80
    targetPort: 3000

---
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: web-app-hpa
  namespace: production
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web-app
  minReplicas: 3
  maxReplicas: 10
  metrics:
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 70
```

---

### 20. RDS - Relational Database Service

**Estimated Time**: 8-10 hours

#### What You'll Learn:

- RDS instance types and engines
- Multi-AZ deployments for HA
- Read replicas for scaling
- Automated backups and snapshots
- Parameter groups and option groups
- RDS Proxy for connection pooling
- Performance Insights
- Database migration with DMS

#### Free Resources:

- 📺 [AWS RDS Tutorial](https://www.youtube.com/watch?v=eMzCI7S1P9M)
- 📖 [RDS User Guide](https://docs.aws.amazon.com/rds/)
- 📚 [RDS Best Practices](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_BestPractices.html)

#### Create RDS Instance:

```bash
# Create DB subnet group
aws rds create-db-subnet-group \
  --db-subnet-group-name production-db-subnet \
  --db-subnet-group-description "Production database subnets" \
  --subnet-ids subnet-xxx subnet-yyy

# Create security group for RDS
aws ec2 create-security-group \
  --group-name rds-sg \
  --description "Security group for RDS" \
  --vpc-id vpc-xxx

aws ec2 authorize-security-group-ingress \
  --group-id sg-xxx \
  --protocol tcp \
  --port 3306 \
  --source-group sg-app

# Create RDS MySQL instance
aws rds create-db-instance \
  --db-instance-identifier production-db \
  --db-instance-class db.t3.medium \
  --engine mysql \
  --engine-version 8.0.35 \
  --master-username admin \
  --master-user-password MySecurePassword123! \
  --allocated-storage 100 \
  --storage-type gp3 \
  --storage-encrypted \
  --vpc-security-group-ids sg-xxx \
  --db-subnet-group-name production-db-subnet \
  --backup-retention-period 7 \
  --preferred-backup-window "03:00-04:00" \
  --preferred-maintenance-window "sun:04:00-sun:05:00" \
  --multi-az \
  --publicly-accessible false \
  --enable-cloudwatch-logs-exports '["error","general","slowquery"]' \
  --enable-performance-insights \
  --performance-insights-retention-period 7

# Create read replica
aws rds create-db-instance-read-replica \
  --db-instance-identifier production-db-replica \
  --source-db-instance-identifier production-db \
  --db-instance-class db.t3.medium

# Create snapshot
aws rds create-db-snapshot \
  --db-instance-identifier production-db \
  --db-snapshot-identifier production-db-snapshot-$(date +%Y%m%d)

# Restore from snapshot
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier restored-db \
  --db-snapshot-identifier production-db-snapshot-20250114

# Modify instance
aws rds modify-db-instance \
  --db-instance-identifier production-db \
  --db-instance-class db.t3.large \
  --apply-immediately

# Enable automated backups
aws rds modify-db-instance \
  --db-instance-identifier production-db \
  --backup-retention-period 30 \
  --preferred-backup-window "03:00-04:00"
```

---

### 21. Systems Manager and Secrets Manager

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- AWS Systems Manager Parameter Store
- AWS Secrets Manager
- Secret rotation
- Session Manager for secure access
- Patch Manager
- Run Command
- State Manager

#### Free Resources:

- 📺 [AWS Systems Manager Tutorial](https://www.youtube.com/watch?v=MK4ZoCs-muo)
- 📖 [Systems Manager User Guide](https://docs.aws.amazon.com/systems-manager/)
- 📖 [Secrets Manager User Guide](https://docs.aws.amazon.com/secretsmanager/)

#### Secrets Manager Usage:

```bash
# Create secret
aws secretsmanager create-secret \
  --name production/db/credentials \
  --description "Production database credentials" \
  --secret-string '{
    "username": "admin",
    "password": "MySecurePassword123!",
    "host": "production-db.xxx.rds.amazonaws.com",
    "port": 3306,
    "dbname": "myapp"
  }'

# Retrieve secret
aws secretsmanager get-secret-value \
  --secret-id production/db/credentials \
  --query SecretString \
  --output text | jq -r .password

# Update secret
aws secretsmanager update-secret \
  --secret-id production/db/credentials \
  --secret-string '{"username":"admin","password":"NewPassword456!"}'

# Enable automatic rotation
aws secretsmanager rotate-secret \
  --secret-id production/db/credentials \
  --rotation-lambda-arn arn:aws:lambda:us-east-1:ACCOUNT_ID:function:RotateSecret \
  --rotation-rules AutomaticallyAfterDays=30

# Parameter Store (for non-sensitive config)
aws ssm put-parameter \
  --name /myapp/config/api-url \
  --value "https://api.example.com" \
  --type String

aws ssm put-parameter \
  --name /myapp/config/api-key \
  --value "sensitive-key-value" \
  --type SecureString

# Get parameter
aws ssm get-parameter --name /myapp/config/api-url --query Parameter.Value --output text

# Get parameter with decryption
aws ssm get-parameter --name /myapp/config/api-key --with-decryption --query Parameter.Value --output text

# Session Manager (SSH alternative)
aws ssm start-session --target i-1234567890abcdef0
```

---

### 22. Elastic Load Balancer

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- Application Load Balancer (ALB)
- Network Load Balancer (NLB)
- Gateway Load Balancer (GWLB)
- Target groups and health checks
- SSL/TLS termination
- Path-based and host-based routing
- Sticky sessions
- Cross-zone load balancing

#### Free Resources:

- 📺 [AWS Load Balancer Tutorial](https://www.youtube.com/watch?v=VIgAT7vjol8)
- 📖 [Elastic Load Balancing User Guide](https://docs.aws.amazon.com/elasticloadbalancing/)

#### ALB with Path-Based Routing:

```bash
# Create target groups
aws elbv2 create-target-group \
  --name api-targets \
  --protocol HTTP \
  --port 80 \
  --vpc-id vpc-xxx \
  --health-check-path /api/health

aws elbv2 create-target-group \
  --name web-targets \
  --protocol HTTP \
  --port 80 \
  --vpc-id vpc-xxx \
  --health-check-path /health

# Create ALB
aws elbv2 create-load-balancer \
  --name production-alb \
  --subnets subnet-xxx subnet-yyy \
  --security-groups sg-xxx \
  --scheme internet-facing \
  --type application \
  --ip-address-type ipv4

# Create listener
aws elbv2 create-listener \
  --load-balancer-arn arn:aws:elasticloadbalancing:... \
  --protocol HTTP \
  --port 80 \
  --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:...

# Add path-based routing rules
aws elbv2 create-rule \
  --listener-arn arn:aws:elasticloadbalancing:... \
  --priority 10 \
  --conditions Field=path-pattern,Values='/api/*' \
  --actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:.../api-targets

aws elbv2 create-rule \
  --listener-arn arn:aws:elasticloadbalancing:... \
  --priority 20 \
  --conditions Field=path-pattern,Values='/*' \
  --actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:.../web-targets

# Register targets
aws elbv2 register-targets \
  --target-group-arn arn:aws:elasticloadbalancing:.../api-targets \
  --targets Id=i-xxx Id=i-yyy
```

---

### 23. AWS Cost Optimization

**Estimated Time**: 4-6 hours

#### What You'll Learn:

- AWS Cost Explorer
- AWS Budgets
- Cost allocation tags
- Reserved Instances and Savings Plans
- Spot Instances
- Right-sizing recommendations
- S3 Intelligent-Tiering
- Cost optimization best practices

#### Free Resources:

- 📺 [AWS Cost Optimization Strategies](https://www.youtube.com/watch?v=fEs_7MyLTOA)
- 📖 [AWS Cost Management User Guide](https://docs.aws.amazon.com/cost-management/)
- 📚 [AWS Well-Architected Cost Optimization](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/)

#### Cost Optimization Commands:

```bash
# Get cost and usage
aws ce get-cost-and-usage \
  --time-period Start=2025-01-01,End=2025-01-31 \
  --granularity MONTHLY \
  --metrics "UnblendedCost" "UsageQuantity" \
  --group-by Type=SERVICE

# Create budget
aws budgets create-budget \
  --account-id ACCOUNT_ID \
  --budget file://budget.json \
  --notifications-with-subscribers file://notifications.json

# Get savings plans recommendations
aws ce get-savings-plans-purchase-recommendation \
  --savings-plans-type COMPUTE_SP \
  --term-in-years ONE_YEAR \
  --payment-option PARTIAL_UPFRONT \
  --lookback-period-in-days SIXTY_DAYS

# Get rightsizing recommendations
aws ce get-rightsizing-recommendation \
  --service AmazonEC2

# Set up cost anomaly detection
aws ce create-anomaly-monitor \
  --anomaly-monitor Name=ProductionMonitor,MonitorType=DIMENSIONAL,MonitorSpecification='{"Dimensions":{"Key":"SERVICE","Values":["Amazon Elastic Compute Cloud - Compute"]}}'
```

#### 💰 Cost Optimization Best Practices:

- ✅ Use Auto Scaling to match capacity with demand
- ✅ Purchase Reserved Instances for predictable workloads (up to 75% savings)
- ✅ Use Spot Instances for fault-tolerant workloads (up to 90% savings)
- ✅ Right-size EC2 instances based on actual usage
- ✅ Use S3 Intelligent-Tiering or lifecycle policies
- ✅ Delete unattached EBS volumes and old snapshots
- ✅ Use CloudFront to reduce data transfer costs
- ✅ Enable S3 Transfer Acceleration only when needed
- ✅ Delete unused Elastic IPs
- ✅ Use NAT Gateway efficiently (consolidate or use NAT instances)
- ✅ Tag all resources for cost allocation tracking

---

### 24. CloudTrail and Config - Compliance

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- CloudTrail for API logging
- CloudTrail Insights
- AWS Config rules
- Compliance frameworks
- Remediation actions
- Multi-region and multi-account setups
- Security Hub integration

#### Free Resources:

- 📺 [AWS CloudTrail Tutorial](https://www.youtube.com/watch?v=YWzmoDzzg4U)
- 📖 [CloudTrail User Guide](https://docs.aws.amazon.com/cloudtrail/)
- 📖 [AWS Config User Guide](https://docs.aws.amazon.com/config/)

#### CloudTrail Setup:

```bash
# Create CloudTrail
aws cloudtrail create-trail \
  --name organization-trail \
  --s3-bucket-name my-cloudtrail-bucket \
  --is-multi-region-trail \
  --enable-log-file-validation \
  --include-global-service-events

# Start logging
aws cloudtrail start-logging --name organization-trail

# Enable CloudTrail Insights
aws cloudtrail put-insight-selectors \
  --trail-name organization-trail \
  --insight-selectors '[{"InsightType": "ApiCallRateInsight"}]'

# Query CloudTrail logs
aws cloudtrail lookup-events \
  --lookup-attributes AttributeKey=EventName,AttributeValue=RunInstances \
  --max-results 10

# AWS Config setup
aws configservice put-configuration-recorder \
  --configuration-recorder name=default,roleARN=arn:aws:iam::ACCOUNT_ID:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig \
  --recording-group allSupported=true,includeGlobalResourceTypes=true

aws configservice put-delivery-channel \
  --delivery-channel name=default,s3BucketName=my-config-bucket

aws configservice start-configuration-recorder --configuration-recorder-name default

# Add Config rule (ensure all EBS volumes are encrypted)
aws configservice put-config-rule --config-rule '{
  "ConfigRuleName": "encrypted-volumes",
  "Description": "Checks whether EBS volumes are encrypted",
  "Source": {
    "Owner": "AWS",
    "SourceIdentifier": "ENCRYPTED_VOLUMES"
  }
}'
```

---

### 25. AWS Migration Strategies

**Estimated Time**: 6-8 hours

#### What You'll Learn:

- 7 R's of migration (Rehost, Replatform, Refactor, etc.)
- AWS Migration Hub
- AWS Application Migration Service (MGN)
- AWS Database Migration Service (DMS)
- AWS DataSync
- AWS Snow Family
- Migration planning and assessment

#### Free Resources:

- 📺 [AWS Migration Strategies](https://www.youtube.com/watch?v=9wgaV70FeaM)
- 📖 [AWS Migration Hub User Guide](https://docs.aws.amazon.com/migrationhub/)
- 📚 [AWS Cloud Adoption Framework](https://aws.amazon.com/cloud-adoption-framework/)

#### 7 R's of Migration:

1. **Retire**: Decommission unnecessary applications
2. **Retain**: Keep applications on-premises (for now)
3. **Rehost** (Lift and Shift): Move as-is to AWS
4. **Relocate**: Move to AWS without changes (Hypervisor-level migration)
5. **Repurchase**: Move to SaaS
6. **Replatform** (Lift, Tinker, and Shift): Make minor optimizations
7. **Refactor/Re-architect**: Redesign using cloud-native features

#### Database Migration with DMS:

```bash
# Create replication instance
aws dms create-replication-instance \
  --replication-instance-identifier my-replication-instance \
  --replication-instance-class dms.t3.medium \
  --allocated-storage 50 \
  --vpc-security-group-ids sg-xxx \
  --availability-zone us-east-1a \
  --engine-version 3.4.7

# Create source endpoint (on-premises MySQL)
aws dms create-endpoint \
  --endpoint-identifier source-mysql \
  --endpoint-type source \
  --engine-name mysql \
  --username admin \
  --password password \
  --server-name 10.0.1.100 \
  --port 3306 \
  --database-name mydb

# Create target endpoint (RDS)
aws dms create-endpoint \
  --endpoint-identifier target-rds \
  --endpoint-type target \
  --engine-name mysql \
  --username admin \
  --password password \
  --server-name production-db.xxx.rds.amazonaws.com \
  --port 3306 \
  --database-name mydb

# Create replication task
aws dms create-replication-task \
  --replication-task-identifier migrate-db \
  --source-endpoint-arn arn:aws:dms:... \
  --target-endpoint-arn arn:aws:dms:... \
  --replication-instance-arn arn:aws:dms:... \
  --migration-type full-load-and-cdc \
  --table-mappings file://table-mappings.json

# Start replication task
aws dms start-replication-task \
  --replication-task-arn arn:aws:dms:... \
  --start-replication-task-type start-replication
```

---

## Hands-On Projects

### 🎯 Project 1: Deploy Jenkins on EC2 with Auto Scaling
**Duration**: 4-6 hours  
**Goal**: Set up a highly available Jenkins CI/CD server  
**Skills**: EC2, Auto Scaling, ALB, EBS, IAM  
**[Detailed Guide](#3-ec2---elastic-compute-cloud)**

---

### 🎯 Project 2: Secure 3-Tier VPC Architecture
**Duration**: 6-8 hours  
**Goal**: Design and deploy production-grade VPC  
**Skills**: VPC, Subnets, NAT Gateway, Security Groups, Route Tables  
**[Detailed Guide](#4-vpc---virtual-private-cloud)**

---

### 🎯 Project 3: S3 Static Website with CloudFront CDN
**Duration**: 4-6 hours  
**Goal**: Host website with global CDN distribution  
**Skills**: S3, CloudFront, Route 53, ACM  
**[Detailed Guide](#7-s3---simple-storage-service)**

---

### 🎯 Project 4: Infrastructure as Code with CloudFormation
**Duration**: 8-10 hours  
**Goal**: Automate entire infrastructure deployment  
**Skills**: CloudFormation, YAML, Stack management  
**[Detailed Guide](#9-cloudformation---infrastructure-as-code)**

---

### 🎯 Project 5: Multi-Environment Setup with Terraform
**Duration**: 10-12 hours  
**Goal**: Create dev, staging, prod environments with Terraform  
**Skills**: Terraform, Modules, Workspaces, Remote State  
**[Detailed Guide](#10-terraform-on-aws)**

---

### 🎯 Project 6: Complete CI/CD Pipeline with AWS Native Tools
**Duration**: 10-12 hours  
**Goal**: Build end-to-end automated deployment pipeline  
**Skills**: CodeCommit, CodeBuild, CodeDeploy, CodePipeline  
**[Detailed Guide](#12-aws-codepipeline---cicd-automation)**

---

### 🎯 Project 7: Serverless API with Lambda and API Gateway
**Duration**: 6-8 hours  
**Goal**: Build REST API without managing servers  
**Skills**: Lambda, API Gateway, DynamoDB, IAM  
**[Detailed Guide](#14-lambda---serverless-computing)**

---

### 🎯 Project 8: Containerized Application on ECS Fargate
**Duration**: 10-12 hours  
**Goal**: Deploy microservices using containers  
**Skills**: Docker, ECR, ECS, Fargate, ALB  
**[Detailed Guide](#18-ecs---elastic-container-service)**

---

### 🎯 Project 9: Kubernetes Application on EKS
**Duration**: 12-15 hours  
**Goal**: Deploy and manage apps on managed Kubernetes  
**Skills**: EKS, kubectl, Helm, IRSA, Kubernetes  
**[Detailed Guide](#19-eks---elastic-kubernetes-service)**

---

### 🎯 Project 10: Production Database with RDS Multi-AZ
**Duration**: 8-10 hours  
**Goal**: Set up highly available database infrastructure  
**Skills**: RDS, Multi-AZ, Read Replicas, Backups, Security  
**[Detailed Guide](#20-rds---relational-database-service)**

---

## AWS DevOps Tools Comparison

### IaC Tools

| **Feature** | **CloudFormation** | **Terraform** | **AWS CDK** |
|---|---|---|---|
| **Language** | YAML/JSON | HCL | TypeScript/Python/Java |
| **Provider Support** | AWS only | Multi-cloud | AWS (with adapters) |
| **State Management** | AWS-managed | Explicit (S3+DynamoDB) | CloudFormation backend |
| **Learning Curve** | Moderate | Moderate | Moderate-High |
| **Community** | AWS official | Large open-source | Growing |
| **Best For** | AWS-only projects | Multi-cloud | Developers preferring code |

### CI/CD Tools

| **Feature** | **CodePipeline** | **Jenkins** | **GitLab CI** | **GitHub Actions** |
|---|---|---|---|---|
| **Hosting** | Managed by AWS | Self-hosted | SaaS or self-hosted | SaaS |
| **Cost** | Pay per pipeline | Infrastructure cost | Free tier + paid | Free tier + paid |
| **AWS Integration** | Native | Plugins required | Good | Good |
| **Flexibility** | Moderate | Very High | High | High |
| **Learning Curve** | Low | High | Moderate | Low-Moderate |

### Container Orchestration

| **Feature** | **ECS** | **EKS** | **Fargate** |
|---|---|---|---|
| **Control** | High | Full (Kubernetes) | Limited |
| **Complexity** | Low | High | Very Low |
| **Cost** | Low | Moderate-High | Moderate |
| **Portability** | AWS-specific | Cloud-agnostic | AWS-specific |
| **Best For** | Simple containers | Complex microservices | Serverless containers |

---

## Recommended Resources

### 📚 Books

1. **[AWS Certified DevOps Engineer Professional Study Guide](https://amzn.to/aws-devops-study-guide)** - Comprehensive exam prep
2. **[Terraform: Up & Running](https://www.terraformupandrunning.com/)** - Yevgeniy Brikman
3. **[Amazon Web Services in Action](https://www.manning.com/books/amazon-web-services-in-action)** - Manning
4. **[The DevOps Handbook](https://amzn.to/3IJPv0h)** - Gene Kim et al.
5. **[Kubernetes Up & Running](https://amzn.to/k8s-up-running)** - Kelsey Hightower

### 🎓 Online Courses

**Free:**
- [AWS Skill Builder - DevOps Learning Plan](https://explore.skillbuilder.aws/learn/public/learning_plan/view/85/devops-engineering-learning-plan)
- [freeCodeCamp AWS Courses](https://www.youtube.com/@freecodecamp)
- [AWS Workshops](https://workshops.aws/)

**Paid:**
- [AWS Certified DevOps Engineer Professional - Udemy](https://www.udemy.com/course/aws-certified-devops-engineer-professional-hands-on/)
- [A Cloud Guru - AWS DevOps](https://acloudguru.com/)
- [Linux Academy](https://linuxacademy.com/)

### 📺 YouTube Channels

- [AWS Online Tech Talks](https://www.youtube.com/@AWSOnlineTechTalks)
- [TechWorld with Nana](https://www.youtube.com/@TechWorldwithNana)
- [Stephane Maarek](https://www.youtube.com/@StephaneMaarek)
- [freeCodeCamp](https://www.youtube.com/@freecodecamp)
- [AWS re:Invent](https://www.youtube.com/@AWSEventsChannel)

### 🌐 Communities

- [r/aws (Reddit)](https://reddit.com/r/aws)
- [AWS Discord Community](https://discord.gg/aws)
- [Stack Overflow - AWS Tag](https://stackoverflow.com/questions/tagged/amazon-web-services)
- [AWS re:Post](https://repost.aws/)
- [DevOps Chat](https://devopschat.co/)

### 🛠️ Tools and CLI

- [AWS CLI](https://aws.amazon.com/cli/)
- [eksctl](https://eksctl.io/)
- [Terraform](https://www.terraform.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Docker](https://www.docker.com/)
- [Helm](https://helm.sh/)

---

## Interview Preparation

### 🎯 Common AWS DevOps Interview Questions

<details>
<summary><strong>EC2 & VPC</strong></summary>

1. What is the difference between Security Groups and NACLs?
2. Explain EC2 instance types and when to use each
3. How does Auto Scaling work?
4. What is the difference between public and private subnets?
5. How do you troubleshoot connectivity issues in VPC?

</details>

<details>
<summary><strong>IAM & Security</strong></summary>

1. Explain the principle of least privilege
2. What are IAM roles and when should you use them vs access keys?
3. How does MFA improve security?
4. What is the difference between authentication and authorization?
5. How do you implement cross-account access?

</details>

<details>
<summary><strong>CI/CD</strong></summary>

1. Explain the stages of a typical CI/CD pipeline
2. What is Blue/Green deployment?
3. How does CodeDeploy handle rollbacks?
4. What is the difference between CodeBuild and CodeDeploy?
5. How do you implement approval gates in CodePipeline?

</details>

<details>
<summary><strong>Containers</strong></summary>

1. What is the difference between ECS and EKS?
2. When would you use Fargate over EC2 launch type?
3. How does Kubernetes service discovery work?
4. What are Kubernetes namespaces?
5. Explain horizontal pod autoscaling in Kubernetes

</details>

<details>
<summary><strong>Infrastructure as Code</strong></summary>

1. CloudFormation vs Terraform - pros and cons?
2. How do you manage Terraform state?
3. What are CloudFormation drift detection and how to use it?
4. Explain Terraform modules
5. How do you handle secrets in IaC?

</details>

<details>
<summary><strong>Monitoring & Logging</strong></summary>

1. How do you set up custom CloudWatch metrics?
2. What is the difference between CloudWatch Logs and CloudTrail?
3. How do you create CloudWatch alarms?
4. Explain log aggregation strategies
5. What is distributed tracing with X-Ray?

</details>

### 📋 Scenario-Based Questions

1. **Scenario**: Your application is experiencing high latency. How would you troubleshoot?
2. **Scenario**: You need to migrate a monolithic application to AWS. What's your approach?
3. **Scenario**: Your EC2 instances keep running out of memory. What's your solution?
4. **Scenario**: You need to deploy a new version with zero downtime. How?
5. **Scenario**: Your AWS bill has suddenly increased. How do you investigate?

### 🎯 Hands-On Interview Tasks

Be prepared to:
- Write CloudFormation/Terraform templates on the spot
- Debug failing CI/CD pipelines
- Configure security groups and networking
- Set up monitoring and alarms
- Explain architecture diagrams
- Optimize costs in given scenarios

---

## Contributing

Contributions are welcome! If you have:

- 📚 Additional resources or tutorials
- 🐛 Corrections or improvements
- 💡 New project ideas
- 📝 Better explanations

Please open an issue or submit a pull request on [GitHub](https://github.com/anugurthi/aws-devops-roadmap).

---

## Acknowledgments

This roadmap was inspired by:
- [Abhishek Veeramalla's AWS DevOps Zero to Hero](https://github.com/iam-veeramalla/aws-devops-zero-to-hero)
- [DevOps Roadmap by anugurthi](https://github.com/anugurthi/devops_roadmap)
- AWS official documentation and best practices
- The amazing DevOps community

---

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details.

---

⭐ **If you find this roadmap helpful, please give it a star!**

📧 **Questions or suggestions?** Open an issue!

💼 **Ready to become an AWS DevOps Engineer?** Start with [AWS Fundamentals](#1-aws-fundamentals)!

---

**Last Updated:** November 2025

**Maintained by:** [@anugurthi](https://github.com/anugurthi)