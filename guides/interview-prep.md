# Interview Preparation

Sharpen your knowledge with targeted questions, scenario drills, and hands-on challenges tailored to AWS DevOps roles.

## Core Question Banks

<details>
<summary><strong>EC2 & VPC</strong></summary>

1. Difference between Security Groups and Network ACLs?
2. When do you prefer placement groups?
3. Walk through diagnosing unreachable instances in a private subnet.
4. Explain how Auto Scaling policies work (step vs target tracking).
5. How do you share VPCs across accounts securely?

</details>

<details>
<summary><strong>IAM & Security</strong></summary>

1. Principle of least privilege in practice.
2. IAM roles vs access keys – when to choose each.
3. MFA and Conditional Access in IAM policies.
4. Cross-account access patterns (STS AssumeRole, resource-based policies).
5. Secrets management strategies on AWS.

</details>

<details>
<summary><strong>CI/CD</strong></summary>

1. Outline the stages of a production-grade pipeline.
2. Blue/Green vs Canary deployments – trade-offs.
3. Integrating manual approvals and security scans in CodePipeline.
4. Rollback strategies with CodeDeploy and feature flags.
5. Artifact versioning and environment promotion patterns.

</details>

<details>
<summary><strong>Containers</strong></summary>

1. ECS vs EKS architecture differences.
2. Fargate vs EC2 launch types.
3. Designing multi-tenancy in Kubernetes namespaces.
4. Implementing service discovery and mesh (App Mesh / Istio).
5. Autoscaling containers (ECS capacity providers, Kubernetes HPA).

</details>

<details>
<summary><strong>Infrastructure as Code</strong></summary>

1. CloudFormation change sets and drift detection.
2. Terraform state backends and locking mechanisms.
3. Structuring reusable Terraform modules.
4. Handling secrets and parameters across environments.
5. Testing IaC (cfn-nag, terraform validate/plan, kitchen-terraform).

</details>

<details>
<summary><strong>Observability</strong></summary>

1. Designing CloudWatch metrics and alarms.
2. Aggregating multi-account logs with centralized collectors.
3. Distributed tracing with AWS X-Ray.
4. Synthetic canaries and SLA monitoring.
5. Incident response runbooks using Systems Manager.

</details>

## Scenario Drills

1. **Latency Spike** – Build a fact-finding checklist spanning CloudWatch metrics, load balancer logs, and VPC Flow Logs.
2. **Monolith Migration** – Outline phased approach, data migration plan, and cutover strategy.
3. **Cost Anomaly** – Draft steps to break down bill by service, region, and tag.
4. **Zero-Downtime Deployments** – Compare blue/green, rolling, and canary strategies.
5. **Security Incident** – Respond to leaked access keys and trace impact using CloudTrail.

## Hands-On Challenges

- Write a minimal CloudFormation template that provisions a VPC with public/private subnets.
- Fix a broken CodePipeline execution (provided sample logs in `projects/06` once populated).
- Harden an S3 bucket that was accidentally made public; enforce via SCP.
- Create a CloudWatch dashboard with custom metrics and anomaly detection.
- Reduce RDS costs by applying storage auto-scaling and performance insights.

## Practice Tips

- Timebox answers (2–3 minutes) and focus on structured responses (Situation → Action → Result).
- Pair scenario drills with the hands-on projects in `projects/`—build muscle memory.
- Record yourself explaining architectures; iterate until the narrative flows smoothly.
- Stay current: review AWS What's New weekly and summarize impactful launches.
