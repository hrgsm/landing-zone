# aks module

Creates an AKS cluster with:
- system node pool
- optional user node pool
- optional AAD RBAC integration (when `admin_group_object_ids` is provided)
- optional Container Insights via Log Analytics (when `log_analytics_workspace_id` is provided)

## Notes
- This is a baseline. For enterprise: private cluster, egress via firewall + UDR, node image hardening, policy, etc.
