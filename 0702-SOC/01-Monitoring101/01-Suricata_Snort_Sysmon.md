## Network + host detection perspective using Suricata, Snort and Sysmon

Competence: **Implementation**</br>
Duration: **5 days** </br>
Challenge Type: **Solo** 


### Follow the courses to aid you

- [Suricata](https://www.pluralsight.com/paths/network-security-monitoring-with-suricata)
- [Snort](https://youtu.be/ZhFZyE26jys?si=MJ-8O7gtg-aPDS7t)

### Follow 

- https://tryhackme.com/r/room/snort
- https://tryhackme.com/r/room/idsevasion
- https://app.letsdefend.io/monitoring (for reference only)

## Suricata vs Snort

### Tasks

1. Install an Ubuntu VM (for Snort & Suricata), a Windows VM (for Sysmon) and Attacker VM (Kali Linux). You can also use Docker.

2. Install Snort on Ubuntu, Suricata on Ubuntu and Sysmon on Windows.

3. Simulate attack scenarios with the Kali VM like - Port scanning the Ubuntu server using nmap, Attempt a brute force SSH login (Hydra), Deploy a malicious file transfer (https://www.eicar.org/download-anti-malware-testfile/).

4. Create a Snort rule to detect Nmap scans on port 22, run Snort in IDS mode and verify that alerts are triggered.

5. Use Suricata’s built-in rules to detect SSH brute-force attempts, enable EVE JSON logging, verify Suricata generates alerts for the Hydra attack, extract the source IP, username attempts, and time of attack from the JSON logs.

6. Collect Sysmon logs- CheckEvent ID 1 (Process Creation), Event ID 3 (Network Connection), Event ID 11 (File Creation) → Log file drop.


5. Deliverables

- Compare Snort/Suricata alerts with Sysmon logs for correlation.
- A short incident report: What happened?, How was it detected?, Which logs provide the strongest evidence?
- A brief report on the process of optimization and any challenges encountered (optional).
- Snort rules and log evidence, Suricata JSON alert with attacker IP, Sysmon event logs.





