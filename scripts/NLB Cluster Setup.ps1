Step 4: NLB Cluster Configuration (Run from any node)

# 1. Create a new NLB Cluster with the Virtual IP (192.168.2.50)
New-NlbCluster -InterfaceName "Ethernet" -ClusterPrimaryIP 192.168.2.50 -ClusterName "PROJECT-CLUSTER" -SubnetMask 255.255.255.0 -Mode Multicast

# 2. Add the second node (WEB-SRV02) to the existing cluster
Add-NlbClusterNode -InterfaceName "Ethernet" -NewNodeName "WEB-SRV02" -NewNodeInterface "Ethernet"

# 3. Set the Port Rule for HTTP (Port 80) to ensure traffic is balanced
Get-NlbClusterPortRule | Set-NlbClusterPortRule -Protocol Tcp -StartPort 80 -EndP