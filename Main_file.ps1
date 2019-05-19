
# Note: 
# 1. Kindly update the $user and $password in Credential_file. 
# 2. Keep the Credential_file, excel_output file, sendfile and this code "Main_file.ps1" in the same folder.
# 3. Output_file: CertificateInfo_yyyy-MM-dd
# 4. Log_file: output


$CurrentDir = $(get-location).Path
$OutputFile = $CurrentDir + "\output.txt"


.\Credential_file.ps1 > output.txt

Start-Sleep -s 1

if (Test-Path $OutputFile) 
{
	.\excel_output.ps1
}
else
{
write-host "Output file not found"
}