# Import Modules
Install-Module PSZoom
Import-Module PSZoom
Import-Module ActiveDirectory

# API key and secret
$Global:ZoomApiKey    = 'API_Key_Goes_Here'
$Global:ZoomApiSecret = 'API_Secret_Goes_Here'

 # Get all Active Directory users
 Write-Progress -Activity "Gathering users from AD"
 $ADUsers = Get-ADUser -Filter * -Properties mail -ResultSetSize $null | Sort-Object mail
 
 # Get all Zoom users
 Write-Progress -Activity "Gathering users from Zoom"
 $ZoomUsers = (Get-ZoomUsers -Status active -AllPages) + (Get-ZoomUsers -Status inactive -AllPages)
 
# Deactivate Zoom users who are disabled in Active Directory
$ActiveZoomUsers = (Get-ZoomUsers -Status active -AllPages)
$ActiveZoomUsers.email | ForEach-Object {
    Get-ADUser -Filter {mail -eq $_ -and enabled -eq $false} -Properties mail} | ForEach-Object {
        Write-Host "Deactivate $($_.mail)"
        Update-ZoomUserStatus -UserId $($_.mail) -Action deactivate
}

# Activate Zoom users who are enabled in Active Directory
$InactiveZoomUsers = (Get-ZoomUsers -Status inactive -AllPages)
$InactiveZoomUsers.email | ForEach-Object {
    Get-ADUser -Filter {mail -eq $_ -and enabled -eq $true} -Properties mail} | ForEach-Object {
        Write-Host "Enable $($_.mail)"
        Update-ZoomUserStatus -UserId $($_.mail) -Action activate
}
 