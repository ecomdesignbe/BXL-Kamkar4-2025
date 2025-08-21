## Zeek

- Type of Challenge: Analysis 
- Challenge type : Solo
- Duration - 2 days

Learning Outcome - Familiarization with Zeek, its basic usage and simple scripting capabilities.

## Tasks

1. Setup a monitoring VM: Ubuntu with Zeek installed, an attacker VM: Kali Linux and a victim VM: Ubuntu/Windows target as per your convenience. You can use docker.
2. Start Zeek in live capture mode.
3. Attempt nmap and inspect the **conn.log** file for connection metadata (IP, ports, duration etc.).
4. Perform SSH brute-force with hydra. Check the **ssh.log** for suspicious attempts. Explore Sample Scripts. Zeek comes with several sample scripts located generally in the **/usr/share/zeek/scripts** directory. Explore these scripts to get a feel for the syntax and functionalities. Write a simple detection script when more than 5 SSH connections from the same IP occur in 1 minute.


## Documentation

Create a detailed report summarizing your findings. The report should include:
- Types of traffic generated and methods used
- Suspicious activities detected and their analysis including the script
- Relevant logs

