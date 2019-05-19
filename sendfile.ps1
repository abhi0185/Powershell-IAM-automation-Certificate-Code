
$cert_list = D:\'Program Files (x86)'\ibm\gsk7\bin\gsk7capicmd -cert -list -db 'D:\Program Files (x86)\Tivoli\PDWeb\www-webseal-uat-external\certs\pdsrv.kdb' -stashed


if($cert_list.Length -ne 0)
{
	for($i=2;$i -lt $cert_list.Length;$i++)
	{
		$cert1 = $cert_list[$i] -split '!	'
		#$cert1[1]

		$a = D:\'Program Files (x86)'\ibm\gsk7\bin\gsk7capicmd -cert -details -label $cert1[1] -db 'D:\Program Files (x86)\Tivoli\PDWeb\www-webseal-uat-external\certs\pdsrv.kdb' -stashed
		$a
		Write-host "################################################"
	}
}