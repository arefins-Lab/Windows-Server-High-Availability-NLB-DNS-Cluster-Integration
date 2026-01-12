Step 5: Status & Verification

# 1. View the status of all nodes in the cluster
Get-NlbClusterNode

# 2. Display the current state of the NLB Cluster
Get-NlbCluster

# 3. Test connectivity to the Cluster VIP
Test-Connection -ComputerName 192.168.2.50 -Count 4