

#disable rdp
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 1

#disable netbios
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" -Name "NetbiosOptions" -Value 2 -Type DWord

#disable llmnr
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Name "EnableMulticast" -Value 0 -Type DWord

#disable wpad
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name "EnableAutoProxyResultCache" -Value 0 -Type DWord

#require smb signing
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "RequireSecuritySignature" -Value 1 -Type DWord

#disable smb1 & smb2
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB1" -Value 0 -Type DWord
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SMB2" -Value 0 -Type DWord

#restart services
Restart-Service TermService -Force



#install firefox
Invoke-WebRequest -Uri "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" -OutFile "$env:administrator\Downloads\FirefoxSetup.exe"
Start-Process -FilePath "$env:administrator\Downloads\FirefoxSetup.exe" -ArgumentList "/S" -Wait

#install malwarebytes
Invoke-WebRequest -Uri "https://downloads.malwarebytes.com/file/mb4_offline" -OutFile "$env:administrator\Downloads\Malwarebytes.exe"
Start-Process -FilePath "$env:administrator\Downloads\Malwarebytes.exe" -ArgumentList "/S" -Wait
