## Objective

Design and deploy a basic but security-focused cloud environment using Terraform on Azure.

```
Note : Moniter your credit during the operations and do not exceed free tier
```

## References

- https://youtu.be/V53AHWun17s?si=K-IUq0uIA93elNNq
- https://youtu.be/LGgk8sy3lvQ?si=wMaMA7DoCAUP09_z

## Tasks

Use Terraform to

1. Create a Virtual Network.Provision two subnets: Public and Private. Add a Network Security Group (NSG) with rules (allow SSH/RDP from your IP, deny all else).

2. Deploy one VM in the public subnet with a public IP.Lock it down with NSG. Use it to reach private-subnet VMs (no public IPs).

3. Deploy a VM (Linux/Windows). Attach it to the private subnet.

4. Automatically generate SSH keys.Create a Key Vault resource. Store the SSH private key for VM login and a fake application secret (e.g., DB password). Use system-assigned managed identity for the VM to retrieve secrets securely.

5. Assign Reader role to VM identity for Key Vault access.Apply least privilege principles.

## Deliverable

1. Modular Code. Ensure you follow secure coding practices.
2. Explain the security measures and why were they important? 