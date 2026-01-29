# iam module

Creates an environment IAM resource group and a user-assigned identity for platform automation.

## Typical usage
- Use the UAI for CI/CD or automation that needs stable identity across runs.
- Assign additional roles outside this module as needed (Subscription, RG, resource scope).
