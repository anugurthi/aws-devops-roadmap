# AWS Fundamentals

**Estimated Time**: 4-6 hours

## What You'll Learn

- Cloud computing concepts (IaaS, PaaS, SaaS)
- AWS Global Infrastructure (Regions, Availability Zones, Edge Locations)
- AWS Management Console navigation
- AWS Free Tier and billing basics
- Core AWS services overview

## Free Resources

- 📺 [AWS Certified Cloud Practitioner - Full Course](https://www.youtube.com/watch?v=SOTamWNgDKc) – freeCodeCamp
- 📖 [AWS Getting Started Resource Center](https://aws.amazon.com/getting-started/)
- 📚 [AWS Cloud Practitioner Essentials](https://aws.amazon.com/training/digital/aws-cloud-practitioner-essentials/)
- 🎮 [AWS Educate](https://aws.amazon.com/education/awseducate/) – Free training and credits

## Premium Resources

- 💎 [AWS Certified Solutions Architect - Udemy](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/)
- 💎 [A Cloud Guru - AWS Fundamentals](https://acloudguru.com/)

## Key Concepts

- **Regions** – Geographic locations with multiple data centers
- **Availability Zones (AZs)** – Isolated locations within regions
- **Edge Locations** – CDN endpoints for CloudFront
- **AWS Management Console** – Web interface for AWS services
- **AWS Free Tier** – Limited free usage for 12 months

## Hands-On Lab

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
