# AWS Account Setup & Guardrails

Set up your AWS environment with security and cost controls before launching labs.

## Checklist

1. **Create the account** at [aws.amazon.com](https://aws.amazon.com/) using a dedicated email.
2. **Enable MFA** on the root user and store backup codes securely.
3. **Create an IAM admin user** and disable root access keys.
4. **Configure billing alarms** with Amazon CloudWatch + SNS.
5. **Tag resources** (`Environment=Sandbox`, `Owner=YourName`, `CostCenter=Learning`).
6. **Enable AWS CloudTrail** and save logs to a dedicated S3 bucket.
7. **Set up AWS Budgets** with email alerts for 50%, 75%, and 100% of your monthly goal.
8. **Activate IAM Access Analyzer** to detect public resources.

## CLI Bootstrap Script

```bash
aws configure
aws iam create-account-alias --account-alias devops-lab-yourname
aws budgets create-budget \
  --account-id $(aws sts get-caller-identity --query Account --output text) \
  --budget file://budget.json
```

Create `budget.json` with your monthly limit:

```json
{
  "BudgetName": "LearningSandbox",
  "BudgetLimit": { "Amount": "10", "Unit": "USD" },
  "TimeUnit": "MONTHLY",
  "BudgetType": "COST"
}
```

## Security Baselines

- 🔒 Use AWS Organizations SCPs or Service Control Policies where possible
- 🛡️ GuardDuty + Security Hub give continuous monitoring inside the Free Tier
- 🧪 Rotate access keys regularly or prefer IAM roles with temporary credentials

## Resources

- 📘 [AWS Account Management Reference Guide](https://docs.aws.amazon.com/accounts/latest/reference/)
- 📺 [Multi-Account Strategy on AWS – Re:Invent](https://www.youtube.com/watch?v=izYKj8QxgX8)
- 🛡️ [AWS Security Reference Architecture](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/welcome.html)
