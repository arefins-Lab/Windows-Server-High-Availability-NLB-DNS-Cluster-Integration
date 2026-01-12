Phase 2: Web Server 01 Setup (WEB-SRV01) 

# 1. Rename the server for identification
Rename-Computer -NewName "WEB-SRV01" -Force

# 2. Assign the correct static IP address (192.168.2.202) and point DNS to the DC
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.2.202 -PrefixLength 24 -DefaultGateway 192.168.2.1
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("192.168.2.201")

# 3. Install IIS Web Server Role
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# 4. Install Network Load Balancing (NLB) Feature
Install-WindowsFeature -Name NLB -IncludeManagementTools