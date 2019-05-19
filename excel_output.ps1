$CurrentDir = $(get-location).Path
$OutputFile = $CurrentDir + "\output.txt"
$Data = Get-Content -Path $OutputFile

$FileName = "\CertificateInfo_" + (Get-Date -Format "yyyy-MM-dd") + ".csv"
$Full_Path = $CurrentDir + $FileName

if (Test-Path $Full_Path) 
{
  Remove-Item $Full_Path
}


$results =@()
$heading_array = @("Label        : ","Key Size     : ","Version      : ","Serial Number: ","Issuer       : ","Subject      : ","Valid From   : ","To           : ","Finger Print : ","Extensions   : ","Signature Algorithm: ","Trusted      : ")                                                               
$Details_for_csv = @()
$str = ""
for($i=0;$i -lt $Data.Length; $i++)
{

	while($Data[$i] -NotLike '*#*' -and $i -lt $Data.Length)
	{
	#write-host $Data[$i]
		$Details_for_csv = @()
		for ($j=0;$j -lt $heading_array.Length;$j++)
		{
			
			if($Data[$i] -Like '*'+$heading_array[$j]+'*')
				{
				
				$Details_for_csv+=$str
				$str = ""
				$Data[$i] = $Data[$i] -replace $heading_array[$j],''
				$str+= $Data[$i]
				
				
				#write-host $Data[$i]
				}
			else
				{
				$str+= $Data[$i]
				#write-host "abc"
				$j--
				}
				
			if($j -eq $heading_array.Length-1)
				{
				$Details_for_csv+=$str
				}
		$i++
		}
		
		$details = @{            
						"Label"			= $Details_for_csv[1]           # data stored from index 1 10 12(array length)--- array index 0 is empty
						"Key Size"			= $Details_for_csv[2]           
						"Version"			= $Details_for_csv[3]           
						"Serial Number"			= $Details_for_csv[4]           
						"Issuer"			= $Details_for_csv[5]           
						"Subject"			= $Details_for_csv[6]           
						"Valid From"			= $Details_for_csv[7]           
						"To"			= $Details_for_csv[8]           
						"Finger Print"			= $Details_for_csv[9]           
						"Extensions"			= $Details_for_csv[10]           
						"Signature Algorithm"			= $Details_for_csv[11]           
						"Trusted"			= $Details_for_csv[12]           
						 }
						$results+= New-Object PSObject -Property $details 
						$results | export-csv -Path $Full_Path -NoTypeInformation

	}
<#	if (Test-Path $OutputFile) 
	{
	Remove-Item $OutputFile
	}
#>

}




