# Identity and Access Management in Azure

- Type of Challenge: Learning 
- Challenge type : Solo
- Duration - 1 day

To learn about Azure IAM you can refer to this [course](https://www.coursera.org/learn/azure-identity-and-access-management) or this [video](https://youtu.be/0qZzcK1mHwA?si=fAEeDvfM3ljBBrVJ).

Try to understand if you understand the following concepts

- Users
- Members
- Resouce Groups
- Groups (Security)
- Entra id
- Subscriptions


## Tasks

1. Log in to the account provided to you and create a Resource Group in your Name. 

2. Try to create a new User A and assign it Reader role on the RG. You see that you don’t have permission to create users. Now create a free Azure account and try to create two users, User A and User B. Create a Resource Group **Test** in your free account and assign **Reader** role to User A and assign **Contributor** role to User B .


## Test Cases
1. Resource Visibility

Reader: Can see the Resource Group.
Contributor: Can view resources.

The account given to you has **Contributer** role assigned to it and you should be able to view **Kamkar4** Resource Group. 

2. Create a VM

Log in as the Reader (free account) and try to deploy a Linux VM in the resource Group.

Use the account provided to you and create a Linux VM in the new Resource Group created in your name.

3. Role Assignment

Try to assign Member roles using the account provided to you. You cannot.

3. Modify Networking

Create of Network Security Group (NSG) rule in Azure to allow SSH Access to the Linux VM from one IP only, all other IPs should be blocked. Refer to https://youtu.be/zsJMMcl7QaE?si=V5uFOQuuEO_qvmSp

Is there a difference between the Reader and the Contributor access in creating rules?

## Reflection questions

Think about what what should be the roles of **Developers** who need to create and manage virtual machines and storage in their own projects and **Security Analysts** who need read-only access to logs, policies, and configurations across the environment in a company.

