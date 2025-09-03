## Key Vault

- Type of Challenge: Learning
- Duration: 2 days
- Challenge type : Solo

## References

- https://youtu.be/CGS7nttoH6Y?si=HFmf7UXEC47WsI-V
- https://youtu.be/eTRR82DJ59s?si=V4ZOmPG9EWH97QWk
- https://youtu.be/CGS7nttoH6Y?si=HFmf7UXEC47WsI-V

## Tasks

Use your own Azure account

1. Create a new resource group for example KeyVaultRG. 
2. Deploy an Azure Key Vault. Enable soft delete and purge protection. Disable public network access.
3. Store one secret (database connection string) and one RSA key for encryption in the key vault.
4. Deploy RBAC for two users, one with Reader and onother with Secrets Officer role.
5. Add an access policy for a service principal to Read secrects only.
6. Create a Linux VM in the same vm network. Enable System Assigned Managed Identity for the VM. 
   Configure the VM to retrieve the secret from Key Vault using Azure CLI.

7. Enable Key Vault Logging in Azure Monitor/Log Analytics.
8. Generate activity in the log by attempting unauthorized access with another user and retrieving secrets from VM.

## Deliverable

1. Configuration methodology.
2. Logs.
