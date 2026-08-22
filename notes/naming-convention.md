# Naming Convention

Follows Microsoft Cloud Adoption Framework resource abbreviations.

| Resource | Prefix | Example |
|---|---|---|
| Resource group | `rg-` | `rg-lab-core` |
| Virtual network | `vnet-` | `vnet-hub-wus3` |
| Subnet | `snet-` | `snet-app` |
| Network security group | `nsg-` | `nsg-app-wus3` |
| Storage account | `st` | `stlabkj3n2x` (no hyphens allowed) |
| Virtual machine | `vm-` | `vm-web-01` |
| Public IP | `pip-` | `pip-lb-wus3` |
| Load balancer | `lb-` | `lb-web-wus3` |

## Pattern
`<prefix>-<workload>-<region>` where region abbreviations follow `wus3`, `eus`, etc.

## Exceptions
Storage accounts: globally unique, lowercase alphanumeric only, 3–24 characters.
No hyphens permitted, which is why they break the pattern.