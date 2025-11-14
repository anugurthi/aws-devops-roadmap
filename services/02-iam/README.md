# IAM – Identity and Access Management

**Estimated Time**: 6-8 hours

## What You'll Learn

- IAM users, groups, roles, and policies
- Principle of least privilege
- MFA (Multi-Factor Authentication) setup
- IAM best practices
- Access keys vs IAM roles
- Policy evaluation logic
- Cross-account access

## Free Resources

- 📺 [AWS IAM Tutorial for Beginners](https://www.youtube.com/watch?v=iF9fs8Rw4Uo) – Stephane Maarek
- 📖 [IAM Best Practices – AWS Docs](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- 🎯 [IAM Policy Simulator](https://policysim.aws.amazon.com/home/index.jsp)
- 📚 [AWS IAM Workshop](https://catalog.workshops.aws/iam/en-US)

## Key Concepts

- **Users** – Individual identities with long-term credentials
- **Groups** – Collections of users with shared permissions
- **Roles** – Temporary credentials for services or federated users
- **Policies** – JSON documents defining permissions
- **MFA** – Additional security layer using time-based codes
- **Access Keys** – Programmatic access credentials (avoid when possible!)
- **IAM Role for EC2** – Best practice for granting EC2 instances AWS permissions

## Policy Structure Example

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

## Hands-On Project – Secure Multi-User IAM Setup

Create a secure IAM structure for a development team.

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
cat > developer-s3-policy.json << 'EOF'
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

## Security Best Practices

- ✅ Enable MFA on all user accounts
- ✅ Use IAM roles for EC2 instead of access keys
- ✅ Rotate credentials regularly
- ✅ Apply least privilege principle
- ✅ Use AWS Organizations for multi-account management
- ✅ Enable CloudTrail to log all IAM actions
