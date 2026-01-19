# repo-test1

# Azure RG-wise Terraform Deployment via GitHub Actions

This repo lets you deploy **multiple resource groups** within one subscription, each with **its own Terraform root module**. Deploy **per RG** or **all** via a wrapper workflow.

## Structure

- `.github/workflows/terraform-rg.yml` – reusable Terraform workflow (template)
- `.github/workflows/deploy-select.yml` – wrapper: select RG(s) and environment at run
- `infra/envs/*.tfvars` – environment-specific variables
- `infra/resource-groups/*` – one Terraform root module per RG

## Prerequisites

1. **Azure OIDC (recommended)**: Create a federated credential for your repo in Azure AD (App Registration) and grant proper roles (e.g., `Contributor`) on the target subscription/resource groups.
2. **Repo Secrets** (no JSON required):
   - `AZURE_CLIENT_ID`
   - `AZURE_TENANT_ID`
   - `AZURE_SUBSCRIPTION_ID`

## How to Run

1. Go to **Actions → Deploy (Select RG)** → **Run workflow**.
2. Choose:
   - `rg-app`, `rg-data`, or `all`
   - `dev` or `prod`
   - whether to `auto_approve`
3. The wrapper calls the reusable workflow per RG.

> If `auto_approve` is **false**, the plan file is uploaded as an artifact.  
> If **true**, `terraform apply` runs automatically.

## Adding a New RG

1. Copy an existing module under `infra/resource-groups/new-rg/` and adjust `main.tf`.
2. Add `new-rg` to:
   - the `options` list in `deploy-select.yml` under `inputs.rg_name`
   - the matrix list under the `deploy-all` job

## Notes

- Workspaces are used per environment (`dev`, `prod`).
- The sample modules create at least **two resources per RG** (e.g., Storage, Key Vault, Log Analytics).
- For production, consider **remote state** (Azure Storage backend) and approvals.

``
