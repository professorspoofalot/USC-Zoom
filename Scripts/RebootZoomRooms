# Install Active Directory module
Get-WindowsCapability -Name RSAT.ActiveDirectory* -Online | Add-WindowsCapability -Online
Import-Module ActiveDirectory

# Get all Zoom Room computers
$ZoomRoomComputers = Get-ADComputer -SearchBase "OU=Zoom Rooms,OU=Shared,OU=Workstations,DC=usc,DC=internal" -Filter *

# Loop through each computer
ForEach ($ComputerName in $ZoomRoomComputers.Name) {
    
    # Test computer is online
    If (Test-Connection -ComputerName $ComputerName -Count 1 -Quiet) {
        
        # Restart computer
        Restart-Computer -ComputerName $ComputerName -Force -Verbose -WhatIf
    }
}
