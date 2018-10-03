#Powershell script to get wifi key passwords
cd $env:TEMP > $null
mkdir wifi > $null
cd wifi > $null
netsh wlan export profile key=clear > $null
clear
dir *.xml |% {
$xml=[xml] (get-content $_)
Write-Host $xml.WLANProfile.SSIDConfig.SSID.name ":" $xml.WLANProfile.MSM.Security.sharedKey.keymaterial
} 
cd..
Remove-item wifi -Recurse

#write-host "Press any key to continue..."
#[void][System.Console]::ReadKey($true)