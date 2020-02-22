param($projname, $buildip, $zonename, $zonename2, $buildagents, $buildagentip1, $buildagentip2, $buildagentip3, $buildagentip4, $buildagentip5)

Add-DnsServerResourceRecordA -Name $projname -ZoneName $zonename -AllowUpdateAny -IPv4Address $buildip

$i = 1
for(;$i -le $buildagents;$i++) {
  $tempip = Get-Variable -Name "buildagentip$i" -ValueOnly
  Add-DnsServerResourceRecordA -Name $projname"-0"$i -ZoneName $zonename2 -AllowUpdateAny -IPv4Address $testip
}

Write-Host "DNS Records successfully added"