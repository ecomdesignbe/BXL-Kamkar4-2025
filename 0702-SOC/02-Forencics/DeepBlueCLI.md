## DeepBlueCLI

- Type of Challenge: Forencics
- Duration: 2 days
- Challenge type : Solo

## Objective

Basics of using DeepBlueCLI for Windows log analysis and to perform basic forensic investigations.


## Tasks

1. Read about DeepBlueCLI and its capabilities in Windows log analysis. Understand its role in cybersecurity and digital forensics. Use this [repository](https://github.com/sans-blue-team/DeepBlueCLI) and [Video1](https://youtu.be/G8XjSO_eshc?feature=shared), [Video2](https://youtu.be/eWD17_E-hrE?feature=shared)

- Install DeepBlueCLI on a Windows virtual machine (VM). Ensure you have PowerShell 5.1 or later installed. You can use Docker.

- Obtain sample Windows Event Logs for analysis. You can use sample logs provided in the DeepBlueCLI repository or generate your own by simulating some activities on your Windows VM or you can use this https://github.com/OTRF/Security-Datasets/tree/master/datasets/atomic/windows


- Identify key features of the output provided by DeepBlueCLI, such as detecting suspicious activities, failed logins, and abnormal process creations.

- Analyze the provided sample event logs using DeepBlueCLI. Focus on the following types of logs:
Security Logs,System Logs, Application Logs.

- Identify if there are multiple failed login attempts. How many failed logons happened in a short time window? Does this look like brute force?

- Identify suspicious PowerShell commands. Look for encoded or obfuscated commands (base64, unusual flags etc.).

- Review login activity across users. Check if one user account was targeted repeatedly.

- Identify Lateral Movement Simulation (Optional). Generate some test events by running Sysinternals PsExec or RDP using attacker VMs. Can you see evidence of lateral movement attempts? How?

## Reporting

1. Based on your analysis, prepare a brief report summarizing your findings. The report should include:
- Details the log analysis performed.
- A summary of the key findings from each type of log.
- Examples of suspicious activities detected.


2. Reflections:
- What are the limitations of using DeepBlueCLI in a real world investigation?


