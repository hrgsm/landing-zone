# Terraform Platform Baseline (env -> resource type)

This repo is structured with **two levels**:
1. `envs/<env>`
2. `envs/<env>/<resource-type>`

Each folder has an independent Terraform state (backend) to reduce blast radius:
- `network` (foundation)
- `iam` (identities + RBAC)
- `compute` (AKS) depends on `network` and `iam` via `terraform_remote_state`

## Apply order per environment
1. envs/<env>/network
2. envs/<env>/iam
3. envs/<env>/compute

## Backend
Update backend settings in each folder to match your Azure Storage Account for tfstate.
