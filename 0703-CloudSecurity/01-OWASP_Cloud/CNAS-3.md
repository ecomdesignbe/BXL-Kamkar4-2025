# CNAS-3: Improper Authentication & Authorization  

## Overview

Improper authentication and authorization in cloud-native applications can lead to unauthorized access, privilege escalation, data exposure, or complete compromise of cloud services. These issues arise when applications or cloud resources fail to correctly verify user identity or enforce access controls at runtime.

In a cloud context, this includes misconfigured identity providers, missing access controls on APIs, overly permissive role assignments, and flawed multi-tenant isolation.

## Description

Authentication flaws occur when an application fails to properly confirm the identity of a user, service, or component. Authorization flaws happen when access is granted without verifying whether the authenticated entity has permission to perform an action or access a resource.

Common examples in cloud-native environments include:

- Missing or misconfigured authentication on serverless functions or REST APIs
- Role-Based Access Control (RBAC) policies granting excessive permissions
- Public-facing resources without access restrictions
- Improper validation of JWT tokens or OAuth scopes
- Insecure multi-tenant designs allowing access to cross-tenant data

These flaws can allow attackers to bypass identity checks, assume unauthorized roles, or escalate their privileges within the cloud environment.

## How To Prevent

* Use centralized and federated identity providers (e.g., Azure AD) to enforce strong, consistent authentication.
* Enforce Multi-Factor Authentication (MFA) for all administrative and sensitive access.
* Implement role-based access control (RBAC) and assign least privilege roles to all users, identities, and workloads.
* Validate access tokens (JWT) properly and ensure scopes and claims are checked on every request.
* Secure all APIs and serverless functions with authentication, even internal ones.
* Test multi-tenant logic to ensure strict tenant isolation is enforced on every request.

## Example Attack Scenarios

### Scenario #1

An attacker discovers an Azure Function deployed without authentication. The function processes sensitive financial data and allows `GET` requests without any API key or token. The attacker invokes it repeatedly, extracting data from the backend.

### Scenario #2

A user assigned the “Contributor” role in Azure is able to assign themselves a “User Access Administrator” role due to a misconfigured custom policy that allows roleAssignments/write. They then escalate to "Owner", achieving full subscription control.

## References

## Exercise 1

### Objective

**Go to :** https://appazgoat508580-function-app.azurewebsites.net/#/home

Leverage the insecure direct object reference vulnerability to access another user's account and change its password.

[[> Solution]](https://github.com/ine-labs/AzureGoat/blob/master/attack-manuals/module-1/01-Insecure%20Direct%20Object%20Reference.md)


## Exercise 2

### Objective
 
Leverage the misconfiguration and escalate privilege to the owner of the resource group.  

**Step 1:** Login to the previous virtual machine using the credentials obtained from the config.txt file.    

[[> Solution]](https://github.com/ine-labs/AzureGoat/blob/master/attack-manuals/module-1/05-Privilege%20Escalation.md)