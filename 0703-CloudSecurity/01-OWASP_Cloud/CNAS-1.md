# CNAS-1: Insecure cloud, container or orchestration configuration  

## Overview

Insecure configuration in cloud-native environments is a common and critical security issue that occurs when cloud infrastructure, container platforms, or orchestration systems are deployed with overly permissive or misconfigured settings. This can lead to unauthorized access, data leakage, privilege escalation, and compromise of the entire environment.

## Description

This vulnerability encompasses misconfigurations in cloud services such as public storage buckets, containers running with root privileges, sharing host network interfaces, improper Identity and Access Management (IAM), and insecure Infrastructure-as-Code (IaC) practices. 

Examples include:

- Publicly accessible cloud storage blobs or buckets exposing sensitive data
- Containers running as root or privileged users, increasing attack surface
- Kubernetes pods configured with `hostNetwork: true`, exposing host network interfaces
- Network Security Groups (NSGs) or firewall rules allowing unrestricted inbound access to critical ports
- Serverless functions without proper authentication or authorization
- IaC templates provisioning insecure cloud resources without restrictions

These misconfigurations increase the risk of attackers gaining unauthorized access, moving laterally, or exfiltrating sensitive information.

## How To Prevent

* Enforce least privilege principles using Role-Based Access Control (RBAC) and limit public access to cloud storage.
* Avoid running containers as root or privileged; use Pod Security Policies or Admission Controllers to restrict pod capabilities.
* Restrict network access by configuring Network Security Groups and firewalls to allow only trusted IPs and required ports.
* Implement authentication and authorization for serverless functions and APIs.
* Use IaC security scanning tools (e.g., tfsec, Checkov) integrated into CI/CD pipelines to detect and prevent insecure configurations before deployment.

## Example Attack Scenarios

### Scenario #1

An attacker discovers an Azure Blob Storage container configured with public access enabled. They retrieve sensitive files such as configuration backups or secrets, leading to data leakage.

### Scenario #2

A Kubernetes pod is deployed with `hostNetwork: true` and runs a privileged container. The attacker gains access to the pod, allowing network sniffing on the host’s interfaces and lateral movement to other nodes or services.

## Exercise 1

### Objective
Your mission is to **discover misconfigured and publicly exposed cloud resources** using enumeration tools, in order to identify sensitive files accessible and assess the associated risks.

### Context
An Azure application potentially exposes sensitive data in a **misconfigured Blob Storage account**. The container(s) might be publicly listable, revealing critical files.

### Starting Point
You are only given the root public storage URL:

- http://$IP that is 4.178.184.154


### Steps to Follow

0. What is de name of the blob storage ? [Hint: Check page source]

1. Use an automated enumeration tool such as [cloud_enum](https://github.com/initstring/cloud_enum) to **scan the storage account** and **list public containers**.[Please use VSCode for making your life easy]

2. Identify accessible containers, what are their names? [Check output of cloud enum, disable AWS and GCP scan]

3. Search for sensitive files inside these containers. [Check output of cloud enum, disable AWS and GCP scan]

4. Download and analyze the file content to find secrets like API keys, credentials, or passwords.[Check output of cloud enum, disable AWS and GCP scan]


## Exercise 2
### Objective 
Identify the security misconfiguration and access sensitive information from the azure resource group.  

**Go to:** https://appazgoat508580-function-app.azurewebsites.net/#/home

[[> Solution]](https://github.com/ine-labs/AzureGoat/blob/master/attack-manuals/module-1/04-Security%20Misconfiguration.md)  

### Awareness of **OWASP Cloud Top 10**, especially:
- `CNAS1: Insecure cloud, Insecure Storage`
- `CNAS5: Insecure secrets storage`
  

### You can also check out (Optional)

* [Azure Security Best Practices](https://learn.microsoft.com/en-us/azure/security/fundamentals/best-practices)
* [Kubernetes Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/)
* [tfsec - Infrastructure as Code Security Scanner](https://github.com/aquasecurity/tfsec)
* [Checkov - Infrastructure as Code Static Analysis](https://github.com/bridgecrewio/checkov)
