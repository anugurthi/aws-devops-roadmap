# VPC – Virtual Private Cloud

**Estimated Time**: 10-12 hours

## What You'll Learn

- VPC fundamentals and CIDR blocks
- Subnets (public vs private)
- Internet Gateway and NAT Gateway
- Route Tables and routing
- Security Groups vs Network ACLs
- VPC Peering and Transit Gateway
- VPC Endpoints for private AWS service access
- VPN and Direct Connect

## Free Resources

- 📺 [AWS VPC Beginner to Pro](https://www.youtube.com/watch?v=7_NNlnH7sAg) – Stephane Maarek
- 📖 [VPC User Guide](https://docs.aws.amazon.com/vpc/)
- 🎮 [VPC Hands-On Workshop](https://catalog.workshops.aws/networking/en-US)
- 📚 [VPC Design Best Practices](https://aws.amazon.com/answers/networking/aws-single-vpc-design/)

## Reference Architecture

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

## Key Concepts

- **CIDR Block** – IP address range (e.g., 10.0.0.0/16 = 65,536 IPs)
- **Public Subnet** – Has a route to the Internet Gateway
- **Private Subnet** – Uses a NAT Gateway for outbound internet
- **Internet Gateway** – Allows internet access for public subnets
- **NAT Gateway** – Enables private subnets to access internet (one-way)
- **Route Table** – Controls traffic routing within the VPC
- **Security Group** – Stateful firewall at the instance level
- **Network ACL** – Stateless firewall at the subnet level

## Hands-On Project – Production 3-Tier VPC

Design and deploy a secure, highly available VPC for a web application.

```bash
# Create VPC
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=Production-VPC}]'

# Enable DNS hostnames
aws ec2 modify-vpc-attribute --vpc-id vpc-xxx --enable-dns-hostnames

# Create Internet Gateway
aws ec2 create-internet-gateway --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=Production-IGW}]'
aws ec2 attach-internet-gateway --vpc-id vpc-xxx --internet-gateway-id igw-xxx

# Public Subnets
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.1.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Public-Subnet-1A}]'
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.2.0/24 --availability-zone us-east-1b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Public-Subnet-1B}]'

# Private (Application) Subnets
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.11.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Private-App-Subnet-1A}]'
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.12.0/24 --availability-zone us-east-1b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Private-App-Subnet-1B}]'

# Private (Database) Subnets
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.21.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Private-DB-Subnet-1A}]'
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.22.0/24 --availability-zone us-east-1b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Private-DB-Subnet-1B}]'

# NAT Gateway (requires Elastic IP)
aws ec2 allocate-address --domain vpc
aws ec2 create-nat-gateway --subnet-id subnet-xxx --allocation-id eipalloc-xxx

# Route Tables
aws ec2 create-route-table --vpc-id vpc-xxx --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=Public-RT}]'
aws ec2 create-route-table --vpc-id vpc-xxx --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=Private-RT}]'

# Routes
aws ec2 create-route --route-table-id rtb-xxx --destination-cidr-block 0.0.0.0/0 --gateway-id igw-xxx
aws ec2 create-route --route-table-id rtb-yyy --destination-cidr-block 0.0.0.0/0 --nat-gateway-id nat-xxx

# Associate subnets
aws ec2 associate-route-table --subnet-id subnet-public --route-table-id rtb-xxx
aws ec2 associate-route-table --subnet-id subnet-private --route-table-id rtb-yyy
```

## Security Best Practices

- ✅ Use multiple AZs for high availability
- ✅ Separate tiers into dedicated subnets
- ✅ Prefer managed NAT Gateway for production workloads
- ✅ Enable VPC Flow Logs for network monitoring
- ✅ Treat Security Groups as the primary firewall layer
- ✅ Use Network ACLs as a secondary layer for subnet-level rules
- ✅ Use VPC Endpoints to keep AWS service traffic on the private network
