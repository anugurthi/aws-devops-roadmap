# Project 9 – Kubernetes Workload on EKS

**Duration**: 12–15 hours  
**Goal**: Stand up an Amazon EKS cluster and deploy a production-ready workload with GitOps.

## Cluster Blueprint

- EKS cluster (managed node groups or Fargate profiles)
- AWS IAM Roles for Service Accounts (IRSA) for fine-grained IAM
- Managed add-ons: VPC CNI, CoreDNS, kube-proxy, CloudWatch Observe
- Ingress via AWS Load Balancer Controller (ALB) + ACM certificate
- ExternalDNS for Route 53 record automation
- GitOps pipeline using Argo CD or Flux

## Prerequisites

- Docker + kubectl + eksctl installed (`foundations/tooling`)
- Service subnets with sufficient IP capacity
- Familiarity with `services/18-ecs` and `services/19-eks` modules

## Implementation Steps

1. **Bootstrap Cluster**
   ```bash
   eksctl create cluster \
     --name devops-eks \
     --region us-east-1 \
     --nodegroup-name ng-app \
     --nodes 2 --nodes-min 2 --nodes-max 4 \
     --managed
   ```
2. **Install Add-ons** –
   - `kubectl apply -k github.com/aws/amazon-vpc-cni-k8s/config/master?ref=...`
   - Deploy AWS Load Balancer Controller (Helm chart)
3. **Configure IRSA** – Map Kubernetes service accounts to IAM roles for S3/DynamoDB access.
4. **Deploy App** – Use Helm or Kustomize to deploy a sample microservice with HPA and PDBs.
5. **GitOps** – Install Argo CD; connect to Git repo under `projects/project-09-eks/gitops/`. Configure app-of-apps pattern.
6. **Observability** – Enable Container Insights, set up Fluent Bit for log forwarding, and deploy Prometheus/Grafana via Helm.
7. **Security** – Apply PSP replacements (OPA/Gatekeeper or Kyverno), enable AWS GuardDuty for EKS, and review audit logs.

## Validation Checklist

- `kubectl get nodes` shows READY nodes across AZs
- Hitting ingress hostname returns application response
- Autoscaling adds nodes/pods under synthetic load
- Git commit triggers Argo CD sync (or Flux reconciliation)

## Stretch Goals

- Configure multi-cluster management with EKS Blueprints
- Add service mesh (AWS App Mesh or Istio) for mTLS and traffic policy
- Integrate with AWS Backup for EBS volume snapshots
