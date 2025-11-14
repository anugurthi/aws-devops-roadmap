# Project 5 – Multi-Environment Deployment with Terraform

**Duration**: 10–12 hours  
**Goal**: Provision development, staging, and production environments with shared modules and remote state.

## Repository Layout

```
project-05-terraform/
├── modules/
│   ├── network/
│   ├── compute/
│   └── database/
├── envs/
│   ├── dev/
│   │   └── main.tf
│   ├── staging/
│   │   └── main.tf
│   └── prod/
│       └── main.tf
├── scripts/
│   └── cicd-plan-apply.sh
└── README.md
```

## Core Requirements

- **Remote State** stored in S3 with DynamoDB table for locking
- **Workspaces or per-env folders**—choose one and document reasoning
- **Reusable modules** with variables/outputs and sensible defaults
- **Environment-specific config** (instance counts, instance types, CIDR blocks)
- **Backend configuration** pinned to environment (e.g., `backend.tf` per env)

## Step-by-Step

1. **Backend Setup** – Provision S3 bucket and DynamoDB table manually or via bootstrap script.
2. **Module Authoring** – Create modules for networking, compute, database. Accept inputs for AZs, instance types, scaling min/max.
3. **Environment Definitions** – Compose modules. Example (envs/dev/main.tf):
   ```hcl
   module "network" {
     source = "../../modules/network"
     cidr_block = var.vpc_cidr
   }

   module "app" {
     source            = "../../modules/compute"
     subnet_ids        = module.network.private_subnet_ids
     desired_capacity  = 2
     environment       = "dev"
   }
   ```
4. **Variables & Tfvars** – Maintain `dev.tfvars`, `staging.tfvars`, `prod.tfvars`. Commit sanitized examples.
5. **Automation** – Add GitHub Actions/CodeBuild pipeline invoking `terraform fmt`, `init`, `plan`, and gated `apply`.
6. **Policy Enforcement** – Integrate `terraform validate`, `tflint`, and optionally `OPA`/`terraform cloud` policies.

## Validation

- `terraform plan` is clean in each environment
- Remote state locks prevent concurrent applies
- Destroy works without orphaning resources
- Drift detection: intentionally tweak a resource and rerun plan to confirm detection

## Stretch Goals

- Use Terraform Cloud or Atlantis for collaboration
- Publish modules to a private registry (or Terraform Cloud) with versioning
- Add Cost Estimation (Infracost) to CI pipeline
