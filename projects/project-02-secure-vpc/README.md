# Project 2 – Secure 3-Tier VPC Architecture

**Duration**: 6–8 hours  
**Goal**: Design and deploy a production-ready network topology with layered security.

## Architecture Overview

- CIDR block `10.0.0.0/16`
- Public subnets in two AZs hosting an Application Load Balancer and bastion host
- Private app subnets in two AZs hosting EC2/ECS services
- Private data subnets with RDS and ElastiCache
- NAT gateways (per AZ) for secure outbound access
- VPC endpoints for S3, DynamoDB, and Systems Manager
- Centralized logging via VPC Flow Logs → CloudWatch Logs

## Deliverables

1. **Diagram** – Draw using draw.io or Excalidraw; store in `assets/` with filename `secure-vpc-diagram.png`.
2. **Infrastructure as Code** – CloudFormation stack or Terraform configuration that provisions the VPC layers.
3. **Security Documentation** – Table describing ingress/egress rules, NACLs, and endpoint policies.

## Implementation Steps

1. **Plan Subnets** – Allocate `/24` per subnet. Example: `10.0.0.0/24` (public-a), `10.0.1.0/24` (public-b), `10.0.10.0/24` (app-a) etc.
2. **Create VPC** – Enable DNS hostnames/support; add DHCP options if needed.
3. **Internet Access** – Attach and route to an Internet Gateway for public subnets.
4. **NAT + Routes** – Deploy NAT gateways in each public subnet, update private route tables.
5. **Security Controls** –
   - Security groups for bastion, ALB, app servers, database
   - NACLs with stateless rules (allow ephemeral ports 1024-65535 for responses)
   - Endpoint policies restricting S3 buckets by prefix/tag
6. **Bastion Host** – Harden with IAM Session Manager, disable SSH password auth.
7. **Observability** – Turn on VPC Flow Logs (enriched format) and store in CloudWatch Logs with 30-day retention.
8. **Testing** – Launch test EC2 instances in app/data subnets; validate outbound internet and blocked inbound traffic.

## Validation Checklist

- ✅ Only ALB is publicly reachable (443)
- ✅ App tier can reach data tier but not vice versa
- ✅ Outbound internet works from private subnets via NAT
- ✅ VPC Flow Logs capture rejected traffic attempts
- ✅ S3 access restricted through VPC endpoint policies

## Stretch Goals

- Add Transit Gateway attachment for hybrid connectivity
- Use AWS Network Firewall for centralized inspection
- Integrate AWS Firewall Manager for policy enforcement
