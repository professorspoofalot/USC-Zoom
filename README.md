# USC-Zoom
PowerShell tools used by USC to interface with the Zoom API

## Prerequisites
### [PowerShell](https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7)
### [Active Directory](https://www.microsoft.com/en-au/download/details.aspx?id=45520)
```
Get-WindowsCapability -Name RSAT.ActiveDirectory* -Online | Add-WindowsCapability -Online
Import-Module ActiveDirectory
```
### [Zoom Marketplace JWT App](https://marketplace.zoom.us/docs/guides/build/jwt-app)
You will need to create your own [JWT app](https://marketplace.zoom.us/docs/guides/build/jwt-app) in the Zoom Marketplace. Generate the JWT key/secret and copy it into these scripts.
```
# API key and secret
$Global:ZoomApiKey    = 'API_Key_Goes_Here'
$Global:ZoomApiSecret = 'API_Secret_Goes_Here'
```
### [PSZoom](https://github.com/JosephMcEvoy/PSZoom)
```
Install-Module PSZoom
Import-Module PSZoom
```

## Scripts

### ADSync.ps1
Sync your Zoom users status with their Active Directory status