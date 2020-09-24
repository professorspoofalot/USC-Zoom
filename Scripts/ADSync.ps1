# Import Modules
Install-Module PSZoom
Import-Module PSZoom
Import-Module ActiveDirectory

# API key and secret (https://marketplace.zoom.us/user/build)
$Global:ZoomApiKey    = 'API_Key_Goes_Here'
$Global:ZoomApiSecret = 'API_Secret_Goes_Here'

 # Get all Active Directory users
 Write-Progress -Activity "Gathering users from AD"
 $ADUsers = Get-ADUser -Filter * -Properties mail -ResultSetSize $null | Sort-Object mail
 
 # Get all Zoom users
 Write-Progress -Activity "Gathering users from Zoom"
 $ZoomUsers = (Get-ZoomUsers -Status active -AllPages) + (Get-ZoomUsers -Status inactive -AllPages)
 
 # Set counter
 $i = 1
 
 # Sync AD account with Zoom
 ForEach ($ADUser in $ADUsers) {
 
     # Set easy to read variables
     $Email = $ADUser.Mail
     $IsADEnabled = $ADUser.Enabled
     $IsZoomUser = $ZoomUsers.email.Contains($Email)
 
     # Write status to progress bar
     Write-Progress -Activity "Syncing users with AD" -Status "$i of $($ADUsers.Count)" -PercentComplete ($i / $($ADUsers.Count) * 100)
     
     # Activate Zoom user
     If ($IsADEnabled -and $IsZoomUser) {
         Update-ZoomUserStatus -UserId $Email -Action activate # -ApiKey $ZoomApiKey -ApiSecret $ZoomApiSecret
     }
     
     # Deactivate Zoom user
     If ((-not $IsADEnabled) -and $IsZoomUser) {
         Update-ZoomUserStatus -UserId $Email -Action deactivate # -ApiKey $ZoomApiKey -ApiSecret $ZoomApiSecret
     }
 
     # Increase counter
     $i++
 } 
 