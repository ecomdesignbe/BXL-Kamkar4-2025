## Cloud Network

- Type of Challenge: Learning
- Duration: 2 days
- Challenge type : Solo

## References

- https://youtu.be/btcKhQPf3HI?si=eXkN52cJqnx_8YZU
- https://youtu.be/umA36eI77xQ?si=TYh7tJaN7UBiG8Yb
- https://youtu.be/ZWHI4zvdB5E?si=Fg5g1CUl6HCV6fQj
- https://youtu.be/ZWij3TZdHvU?si=HkA73z_J8KlFuHd4
- https://youtu.be/ePrGeqAqx34?si=K4xCB4jTxmUKCwUE

## Tasks

1. Deploy a VNet with 2 subnets: Frontend subnet (for web server). Backend subnet (for database). Use the account given to you and resource group craeted in your name. If there is no access, use the account that you created.

2. Launch 2 VMs: one in each subnet. Confirm connectivity (ping, RDP/SSH).

3. Apply Network Segmentation & Network Security Groups (NSGs). Create NSG for Frontend: Allow HTTP/HTTPS, block SSH/RDP except from trainee’s IP. Create NSG for Backend: Only allow traffic from Frontend subnet on port 3306 (MySQL) or 1433 (MSSQL).Deny all inbound Internet traffic to backend. Now try connecting backend directly from your laptop. Is it failing? Try connecting from Frontend VM. Is it a succeess?

4. Restrict outbound Internet access for backend subnet.
Test by attempting curl or wget from backend VM.

5.Enable NSG Flow Logs (via Network Watcher). Show how to view logs in Storage Account or Log Analytics.Use Connection Troubleshoot in Network Watcher.

6. (Optional) Configure Service Endpoint or Private Endpoint for Azure Storage. Show difference between public vs. private access.