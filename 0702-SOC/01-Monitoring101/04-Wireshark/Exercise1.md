## Nmap and Wireshark
- Type of Challenge: Investigation and Analysis 
- Duration: 0.5 day
- Challenge type : Team/Solo

## Correlate Nmap scan results with captured packets in Wireshark

### Setup

- Use a virtual machine environment like VirtualBox or VMware to set this up safely.
- Install Nmap on your main machine (the attacker machine).
- Download and install Wireshark on both the attacker and target machine.
- Better if the target Machine is on a separate isolated network segment.

### Tasks

- Scan the Target Machine with Nmap.

- Open a terminal on your attacker machine. Use Nmap to scan the target machine's IP address for open ports. 
- Analyze the Nmap scan results. Identify open ports, services running on those ports, and any version information Nmap discovers.

- Capture Network Traffic with Wireshark

- Open Wireshark on your target machine.
Start capturing traffic on the network interface connected to your attacker machine 
- On your attacker machine, use a web browser to access a website you know is running on port 80. This will generate traffic between the two machines.

- Correlate Nmap and Wireshark Findings 

- Stop the capture on your target machine's Wireshark.
- Open the captured traffic file in Wireshark on your attacker machine.

- Analyze the captured packets. Can you identify the communication between your attacker machine and the target machine? Do the details in the captured packets match what you discovered with Nmap?

- Repeat step 1 but use a different Nmap scan type that scans for fewer ports (e.g., nmap -sS <target_IP> for a SYN scan). Try capturing traffic for a different service running on a different port (e.g., SSH on port 22).
