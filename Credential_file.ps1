

$Id = '613007'
$pswd = 'Nj9829509226!'

$CurrentDir = $(get-location).Path
$SendFile = $CurrentDir + "\sendfile.ps1"


Copy-item -Path $SendFile -Destination \\10.242.232.14\c$\Users\$Id\Desktop\receive.ps1

winrs /r:10.242.232.14 /u:$Id /p:$pswd powershell.exe -nologo -noprofile -command C:\Users\$Id\Desktop\receive.ps1