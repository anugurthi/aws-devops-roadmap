# Project 10 – Production Database with RDS Multi-AZ

**Duration**: 8–10 hours  
**Goal**: Provision a fault-tolerant Amazon RDS instance, automate maintenance, and secure connectivity.

## Architecture

- Amazon RDS (PostgreSQL/MySQL) Multi-AZ deployment
- Subnet group spanning two private subnets
- Security groups restricting access to app tier only
- KMS encryption for storage and snapshots
- CloudWatch alarms and Enhanced Monitoring
- Automated backups + manual snapshot lifecycle policy

## Implementation Steps

1. **Parameter Planning** – Choose engine, version, instance class (e.g., `db.t4g.medium`), storage type/size.
2. **Subnet Group** – Select private subnets across distinct AZs. Ensure networking from project 02 exists.
3. **Provision RDS** – Use CLI, CloudFormation, or Terraform. Enable Multi-AZ and Performance Insights.
4. **Secrets Management** – Store credentials in AWS Secrets Manager; rotate automatically.
5. **Connectivity** – Configure security group inbound rules from app tier SG only. Optionally set up IAM auth.
6. **Monitoring** – Create CloudWatch alarms for CPU, free storage, and replica lag. Enable Enhanced Monitoring (1s granularity) and log exports (error, slow query).
7. **Backups** – Set retention (7-14 days) and enable snapshot copy to secondary region for DR.
8. **Maintenance** – Configure maintenance window; test minor version upgrade in dev before prod.
9. **Failover Drill** – Trigger `Reboot with failover` to verify application reconnection logic.

## Validation

- Application can connect using Secrets Manager credentials.
- Automatic backup and snapshot copy jobs succeed (check Event Subscriptions).
- CloudWatch dashboard visualizes CPU, connections, and latency trends.

## Stretch Goals

- Add read replica in another region for DR read scaling.
- Automate schema migrations with Flyway or Liquibase pipeline.
- Integrate AWS Backup for centralized policy management.
