## Osquery and Wazuh

- Type of Challenge: Configuration and Implementation
- Duration: 2 days
- Challenge type : Solo

## Tasks

1. Setup and Installation
- Install and configure Osquery and Wazuh on a virtual machine or you can use Docker.

- Install Osquery: Download and install Osquery on the chosen system.
- Configure Osquery to run as a daemon.Validate the installation by running some basic queries.

- Install the Wazuh manager on the same virtual machine.
Install the Wazuh agent on the system where Osquery is installed.

- Ensure that the Wazuh agent can communicate with the Wazuh manager.


2. Configure Wazuh to collect data from Osquery and create rules and alerts.

- Configure Osquery to log events in a structured format.
- Modify the Osquery configuration file to include useful tables (e.g., processes, listening ports, scheduled tasks).
- Configure Wazuh to read Osquery logs.
- Ensure the Wazuh agent is correctly parsing Osquery logs and forwarding them to the Wazuh manager.
- Create custom decoders in Wazuh for Osquery logs if necessary.

3. Testing the Integration:

- Perform various actions on the system (e.g., start/stop services, add new users) and verify that these activities are logged by Osquery and forwarded to Wazuh.
- Create test alerts in Wazuh based on Osquery logs.

4. Develop and deploy Osquery queries and Wazuh alerts to monitor critical system activities.

- Create a set of Osquery queries to monitor critical activities (e.g., user logins, file modifications, network connections).
- Schedule these queries to run at regular intervals using the Osquery scheduler.
- Create alert rules in Wazuh based on the data collected from the custom Osquery queries.
- Define thresholds and conditions for triggering alerts.
- Perform actions that should trigger the queries and alerts.
- Verify that the alerts are being generated and are accurately reflecting the monitored activities.

5. Documentation:

- Configuration and integration process.
- Analysis of the logs and alerts collected.
- Identification of patterns, anomalies etc. Include charts/ graphs (optional) and screenshots to illustrate key points.

