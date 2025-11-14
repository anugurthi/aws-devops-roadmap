# S3 – Simple Storage Service

**Estimated Time**: 6-8 hours

## What You'll Learn

- S3 buckets and objects
- Storage classes (Standard, IA, Glacier, etc.)
- Versioning and lifecycle policies
- Encryption options (SSE-S3, SSE-KMS, SSE-C)
- Bucket policies and ACLs
- Static website hosting
- Cross-region replication
- Transfer Acceleration
- Event notifications

## Free Resources

- 📺 [AWS S3 Masterclass](https://www.youtube.com/watch?v=e6w9LwZJFIA) – Stephane Maarek
- 📖 [S3 User Guide](https://docs.aws.amazon.com/s3/)
- 🎮 [S3 Hands-On Labs](https://aws.amazon.com/getting-started/hands-on/backup-files-to-amazon-s3/)
- 📚 [S3 Best Practices](https://docs.aws.amazon.com/AmazonS3/latest/userguide/best-practices.html)

## Storage Class Comparison

| **Class** | **Use Case** | **Availability** | **Cost** |
|---|---|---|---|
| **S3 Standard** | Frequently accessed data | 99.99% | $$$ |
| **S3 Intelligent-Tiering** | Unpredictable access patterns | 99.9% | $$ |
| **S3 Standard-IA** | Infrequently accessed, resilient | 99.9% | $$ |
| **S3 One Zone-IA** | Re-creatable data, single AZ | 99.5% | $ |
| **S3 Glacier Instant** | Archive with instant retrieval | 99.9% | $ |
| **S3 Glacier Flexible** | Archive with minutes-hours retrieval | 99.99% | ¢ |
| **S3 Glacier Deep Archive** | Long-term archival | 99.99% | ¢ |

## Hands-On Project – Static Website with Lifecycle Policies

```bash
# Create bucket
aws s3 mb s3://my-website-bucket-$(date +%s)

# Enable static website hosting
aws s3 website s3://my-website-bucket-123456 \
  --index-document index.html \
  --error-document error.html

# Bucket policy for public read
cat > bucket-policy.json << 'EOF'
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-website-bucket-123456/*"
    }
  ]
}
EOF
aws s3api put-bucket-policy \
  --bucket my-website-bucket-123456 \
  --policy file://bucket-policy.json

# Enable versioning
aws s3api put-bucket-versioning \
  --bucket my-website-bucket-123456 \
  --versioning-configuration Status=Enabled

# Lifecycle rule (30 days to Standard-IA, 90 to Glacier)
cat > lifecycle.json << 'EOF'
{
  "Rules": [
    {
      "ID": "MoveToIAandGlacier",
      "Status": "Enabled",
      "Filter": {"Prefix": ""},
      "Transitions": [
        {"Days": 30, "StorageClass": "STANDARD_IA"},
        {"Days": 90, "StorageClass": "GLACIER"}
      ],
      "NoncurrentVersionTransitions": [
        {"NoncurrentDays": 30, "StorageClass": "STANDARD_IA"},
        {"NoncurrentDays": 90, "StorageClass": "GLACIER"}
      ],
      "Expiration": {"Days": 365}
    }
  ]
}
EOF
aws s3api put-bucket-lifecycle-configuration \
  --bucket my-website-bucket-123456 \
  --lifecycle-configuration file://lifecycle.json

# Upload website content
aws s3 sync ./website/ s3://my-website-bucket-123456
```

## Automation with Pre-Signed URLs

```bash
# Generate presigned URL valid for 15 minutes
aws s3 presign s3://my-website-bucket-123456/assets/report.pdf --expires-in 900
```

## Encryption Checklist

- [ ] SSE-S3 for basic encryption needs
- [ ] SSE-KMS for fine-grained key control
- [ ] Enforce HTTPS-only access with bucket policy
- [ ] Use Access Analyzer to verify public access
- [ ] Enable server access logging for audit trails
