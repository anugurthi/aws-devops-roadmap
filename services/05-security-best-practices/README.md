# AWS Security Best Practices

**Estimated Time**: 6-8 hours

## What You'll Learn

- AWS Shared Responsibility Model
- Security Groups and Network ACLs
- Encryption at rest and in transit
- AWS KMS (Key Management Service)
- AWS Secrets Manager
- GuardDuty for threat detection
- AWS WAF (Web Application Firewall)
- Security Hub for compliance

## Free Resources

- 📺 [AWS Security Fundamentals](https://www.youtube.com/watch?v=Ul6FW4UANGc)
- 📖 [AWS Security Best Practices](https://docs.aws.amazon.com/security/)
- 📚 [AWS Security Workshops](https://awssecworkshops.com/)
- 🎮 [AWS Well-Architected – Security Pillar](https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.pillar.security.en.html)

## Shared Responsibility Model

```
┌──────────────────────────────────────────┐
│     Customer Responsibility              │
│  • Data                                  │
│  • IAM                                   │
│  • Application Security                  │
│  • OS Patching                           │
│  • Network Configuration                 │
│  • Firewall                              │
└──────────────────────────────────────────┘
                    │
                    ▼
┌──────────────────────────────────────────┐
│     AWS Responsibility                   │
│  • Hardware                              │
│  • Global Infrastructure                 │
│  • Compute, Storage, Network             │
│  • Regions, AZs, Edge Locations          │
│  • Managed Services                      │
└──────────────────────────────────────────┘
```

## Key Concepts

- **Encryption at Rest** – Protect data stored in EBS, S3, RDS, etc.
- **Encryption in Transit** – Use TLS/SSL for data in motion
- **AWS KMS** – Managed service for creating and controlling encryption keys
- **Secrets Manager** – Secure storage and rotation for credentials
- **GuardDuty** – Intelligent threat detection service
- **CloudTrail** – Audit API activity across the account
- **AWS Config** – Evaluate resource configuration compliance

## Hands-On Project – Secure Application Infrastructure

1. Enable encryption on all EBS volumes
2. Store database credentials in AWS Secrets Manager
3. Restrict Security Groups with least privilege rules
4. Enable GuardDuty for threat detection
5. Turn on CloudTrail in all regions
6. Configure CloudWatch alarms for security events

```bash
# Enable EBS encryption by default
aws ec2 enable-ebs-encryption-by-default --region us-east-1

# Create secret for database credentials
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

## Security Checklist

- [ ] MFA enabled on all user accounts
- [ ] Root account locked down and unused for daily work
- [ ] IAM roles replace long-lived access keys
- [ ] Data stores encrypted at rest and in transit
- [ ] Security Groups follow least privilege
- [ ] CloudTrail enabled across all regions
- [ ] GuardDuty actively monitoring the account
- [ ] Regular security audits performed
- [ ] Automated patch management configured
