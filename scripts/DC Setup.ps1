Phase 1: Domain Controller Setup (DC-SRV01)

# 1. Rename the server for identification
Rename-Computer -NewName "DC-SRV01" -Force

# 2. Assign a static IP address to the Domain Controller
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.2.201 -PrefixLength 24 -DefaultGateway 192.168.2.1

# 3. Install Active Directory Domain Services (AD DS) Role
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# 4. Install DNS Server Role and Management Tools
Install-WindowsFeature -Name DNS -IncludeManagementTools

# 5. Promote the server to a Domain Controller (New Forest: project.test)
# Note: System will prompt for Safe Mode password and reboot automatically
Install-ADDSForest -DomainName "project.test" -InstallDns:$true -Force:$true

# 6. Configure DNS Forwarders for external internet access
Set-DnsServerForwarder -IPAddress "8.8.8.8", "8.8.4.4"

# 7. Create a Host (A) record pointing 'project.test' to the Cluster VIP (192.168.2.50)
Add-DnsServerResourceRecordA -Name "@" -ZoneName "project.test" -IPv4Address "192.168.2.50"

# 8. Create an additional 'A' record for the 'project' hostname
Add-DnsServerResourceRecordA -Name "project" -ZoneName "project.test" -IPv4Address