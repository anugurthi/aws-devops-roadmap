# AWS DevOps Tools Comparison

## Infrastructure as Code

| Feature | CloudFormation | Terraform | AWS CDK |
| --- | --- | --- | --- |
| Language | YAML/JSON | HCL | TypeScript/Python/Java/C# |
| Provider Support | AWS only | Multi-cloud | AWS (with community constructs) |
| State Management | Managed by AWS | Remote/state backend required | Uses CloudFormation backend |
| Learning Curve | Moderate | Moderate | Moderate–High |
| Ecosystem | Official AWS modules | Massive community modules | Growing; leverage construct hub |
| Best For | Pure AWS workloads | Hybrid or multi-cloud | Developers who prefer real code |

### Guidance

- Start with **CloudFormation** if you want AWS-native guardrails and change sets.
- Use **Terraform** when you need to manage SaaS integrations or multi-cloud services.
- Adopt **CDK** for complex architectures where imperative logic beats YAML.

## CI/CD Platforms

| Feature | CodePipeline | Jenkins | GitLab CI | GitHub Actions |
| --- | --- | --- | --- | --- |
| Hosting | Fully managed | Self-hosted | SaaS/self-hosted | SaaS |
| Pricing | Pay per execution | Infrastructure + maintenance | Free tier + paid | Free tier + paid |
| AWS Integration | Native IAM + events | Requires plugins | Strong | Strong |
| Flexibility | Opinionated | Extremely flexible | Flexible | Flexible |
| Learning Curve | Low | High | Moderate | Low–Moderate |

### Guidance

- **CodePipeline** is ideal for AWS-native workloads and quick wins.
- **Jenkins** shines when you need granular control or custom agents.
- **GitLab CI** and **GitHub Actions** integrate nicely with git hosting + container registries.

## Container Orchestration

| Feature | ECS | EKS | Fargate |
| --- | --- | --- | --- |
| Control | AWS handles cluster mgmt | Full Kubernetes control | AWS runs tasks, no servers |
| Complexity | Low | High | Very low |
| Cost | Pay for EC2 + control plane | Pay for worker nodes + control plane | Pay per vCPU/memory-minutes |
| Portability | AWS-specific | Cloud-agnostic | AWS-specific |
| Best For | Simple microservices | Enterprises standardizing on K8s | Serverless containers |

### Guidance

- Choose **ECS on Fargate** for quick, serverless container hosting.
- Use **ECS on EC2** when you want task placement control and cost leverage with Spot.
- Opt for **EKS** when Kubernetes is a requirement or teams already know it.

## Observability & Ops Tools Snapshot

| Need | Native AWS Tool | Alternatives |
| --- | --- | --- |
| Metrics & Alarms | Amazon CloudWatch | Datadog, Prometheus + Grafana |
| Distributed Tracing | AWS X-Ray | OpenTelemetry, Jaeger |
| Log Aggregation | CloudWatch Logs Insights | ELK Stack, Loki |
| Incident Response | AWS Systems Manager OpsCenter | PagerDuty, Opsgenie |

### How to Use This Guide

1. Pick the column that aligns with your team’s constraints (skills, budget, governance).
2. Keep proofs-of-concept small—evaluate with a single workload before standardizing.
3. Document decision drivers in the `projects/` labs so stakeholders understand trade-offs.
