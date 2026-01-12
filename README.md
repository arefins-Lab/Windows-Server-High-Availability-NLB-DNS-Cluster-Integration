Windows-Server-High-Availability-NLB-DNS-Cluster-Integration

High-Availability Web Cluster using Windows NLB professional implementation of a Network Load Balancing (NLB) Cluster on Windows Server 2022. This project automates the deployment of a scalable web infrastructure featuring a central Domain Controller and load-balanced IIS nodes.


System Architecture infrastructure consists of three main nodes and a Virtual IP (VIP) that acts as the entry point for all web traffic.


Node Function IP Address:

DC-SRV01 Domain Controller (AD DS/DNS)192.168.2.201

Windows Server WEB-SRV01 Cluster Node 1(IIS/NLB)192.168.2.202

Windows Server WEB-SRV02 Cluster Node 2 (IIS/NLB)192.168.2.203

Windows Server Cluster VIPLoad Balanced Endpoint**192.168.2.50**VIP



Deployment Workflow:

Phase 1: Identity & DNS (DC-SRV01)

The script configures the project. test forest and sets up DNS records pointing to the Cluster VIP.

Action: Execute scripts/dc-setup.ps1

Feature: Installs AD DS, DNS, and configures forwarders.



Phase 2: Web Server Preparation:

Standardizing IIS and NLB features across both web nodes.

Action: Execute scripts/web01-setup.ps1 & scripts/web02-setup.ps1

Feature: Installs Web-Server (IIS) and NLB features with static IP assignments.



Phase 3: Cluster Orchestration:

Grouping the nodes into a single logical unit.

Mode: Multicast

Port Rules: Port 80 (HTTP) with Single Affinity for session persistence.

Post-Deployment Verification:

To verify that the load balancer is functional, access the cluster via the VIP or Domain Name:

URL: http://192.168.2.50

DNS: http://project.test

Above: Proof of successful traffic routing to the active cluster node.



Implementation Notes:

DNS Resolution: All nodes point to 192.168.2.201 for primary DNS.

Security: Ensure Windows Firewall allows Port 80 and NLB traffic.

Scalability: Additional nodes can be added using the Add-NlbClusterNode cmdlet found in the scripts.
