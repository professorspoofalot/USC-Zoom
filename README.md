# USC-Zoom
PowerShell tools used by USC to interface with the Zoom API

## Getting Started
These tools will require an API key and API secret. You can generate the JWT key/secret from https://marketplace.zoom.us/develop/create, then click on 'Create' under JWT.

### Prerequisites
#### PowerShell

#### Remote Server Administration Tools
(Active Directory)[https://www.microsoft.com/en-au/download/details.aspx?id=45520]

```
Get-WindowsCapability -Name RSAT.ActiveDirectory* -Online | Add-WindowsCapability -Online
Import-Module ActiveDirectory
```

#### PSZoom
(PSZoom)[https://github.com/JosephMcEvoy/PSZoom]
```
Install-Module PSZoom
Import-Module PSZoom
```

## Scripts

### ADSync.ps1
Sync your Zoom users status with their Active Directory status