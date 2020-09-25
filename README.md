# USC-Zoom
Tools used by USC to interface with the Zoom API

## Getting Started
These tools will require an API key and API secret. You can generate the JWT key/secret from https://marketplace.zoom.us/develop/create, then click on 'Create' under JWT.

### Prerequisites
#### PowerShell

#### Active Directory
```
Get-WindowsCapability -Name RSAT.ActiveDirectory* -Online | Add-WindowsCapability -Online
Import-Module ActiveDirectory
```

#### PSZoom
```
Install-Module PSZoom
Import-Module PSZoom
```

## Scripts

### ADSync.ps1
Sync your Zoom users status with their Active Directory status