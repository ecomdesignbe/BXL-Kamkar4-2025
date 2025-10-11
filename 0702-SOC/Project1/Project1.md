## Objective 
Build a cohesive threat intelligence pipeline that demonstrates how OpenCTI can feed IOCs (Indicators of Compromise) into platforms like Splunk, Zeek and Snort.

## Setup

1. Lab Environment: Install Splunk (Free with OpenCTI add-on installed). Install OpenCTI (Threat Intelligence Platform).Install Zeek (Network traffic analyzer) and Snort (Intrusion Detection System). Two Linux VMs: Attacker VM – used to generate simulated traffic. Victim VM – monitored by Zeek/Snort.

2. Add Fake C2 IOCs to OpenCTI. Confirm they appear in your Indicators list.

3. Configure the OpenCTI Splunk Add-on with your OpenCTI API key.

4. Generate Suspicious Traffic. On the Attacker VM, simulate traffic to the fake IOCs. Connect to fake C2 IP using curl.
Query fake C2 domain using nslookup. Simulate port scan using nmap.

5. Run queries in Splunk to find matches. Check Zeek logs for IOC hits. Check DNS queries. Check Snort alerts

6. Create a Splunk alert for IOC matches. Configure the “Send to OpenCTI” alert action. Verify in OpenCTI that a Sighting is created for the IOC.

## Deliverables


- OpenCTI threat intelligence showing fake IOCs.

- Splunk query results matching traffic to fake IOCs.

- Snort or Zeek log samples with IOC hits.

- OpenCTI sighting created from Splunk.
