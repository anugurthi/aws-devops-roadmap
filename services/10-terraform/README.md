# Terraform on AWS

**Estimated Time**: 10-12 hours

## What You'll Learn

- Terraform language (HCL) fundamentals
- Providers, resources, and data sources
- Remote state and backends
- Variables, outputs, and workspaces
- Modules and best practices
- Importing existing infrastructure
- Plan/apply workflows and change management

## Free Resources

- 📺 [Terraform – Full Course](https://www.youtube.com/watch?v=SLB_c_ayRMo) – freeCodeCamp
- 📖 [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- 📚 [HashiCorp Learn](https://learn.hashicorp.com/terraform)
- 🎮 [Terraform AWS Workshop](https://catalog.workshops.aws/terraform-101/en-US)

## Premium Resources

- 💎 [Terraform: Up & Running](https://www.terraformupandrunning.com/) – Yevgeniy Brikman

## Terraform vs CloudFormation

| **Aspect** | **Terraform** | **CloudFormation** |
|---|---|---|
| Language | HCL | YAML/JSON |
| Multi-cloud | ✅ | ❌ |
| State management | Manual/remote backend | Managed by AWS |
| Module registry | Large public registry | AWS Registry |
| Tooling ecosystem | Rich OSS tooling | AWS-native |
| Cost | Free (Terraform Cloud optional) | Free |

## Project Structure

```
terraform-aws-project/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── backend.tf
├── terraform.tfvars
├── modules/
│   ├── vpc/
│   ├── ec2/
│   └── rds/
└── environments/
    ├── dev/
    ├── staging/
    └── prod/
```

## Hands-On Project – 3-Tier Infrastructure (Terraform)

### providers.tf
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

### variables.tf
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

### main.tf (Excerpt)
```hcl
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]
  
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = { Name = "${var.environment}-igw" }
}

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

resource "aws_lb" "main" {
  name               = "${var.environment}-alb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [aws_security_group.alb.id]
  subnets            = aws_subnet.public[*].id
}

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
}

resource "aws_autoscaling_group" "web" {
  name                = "${var.environment}-asg"
  vpc_zone_identifier = aws_subnet.private[*].id
  target_group_arns   = [aws_lb_target_group.main.arn]
  min_size            = 2
  max_size            = 6
  desired_capacity    = 2
  health_check_type   = "ELB"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }
}
```

### outputs.tf
```hcl
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC ID"
}

output "alb_dns_name" {
  value       = aws_lb.main.dns_name
  description = "Application Load Balancer DNS name"
}

output "load_balancer_url" {
  value       = "http://${aws_lb.main.dns_name}"
  description = "URL of the load balancer"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "Public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "Private subnet IDs"
}
```

### terraform.tfvars (Example)
```hcl
aws_region         = "us-east-1"
environment        = "production"
project_name       = "webapp"
vpc_cidr           = "10.0.0.0/16"
availability_zones = ["us-east-1a", "us-east-1b"]
instance_type      = "t3.micro"
key_name           = "my-key-pair"
```

## Common Commands

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan
terraform apply
terraform show
terraform state list
terraform output alb_dns_name
terraform import aws_vpc.main vpc-1234567890abcdef0
terraform workspace new staging
terraform workspace select production
terraform destroy
```

## Best Practices

- ✅ Store state remotely (S3) and lock with DynamoDB
- ✅ Use modules to encapsulate reusable components
- ✅ Use workspaces or separate state files per environment
- ✅ Keep secrets in AWS Secrets Manager or SSM Parameter Store
- ✅ Tag all resources via `default_tags`
- ✅ Run `terraform fmt` and `terraform validate` before commits
- ✅ Review plans with peers prior to applying to production
