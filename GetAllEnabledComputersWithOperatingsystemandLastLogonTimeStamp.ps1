$computers = Get-ADComputer -Filter {(Enabled -eq $True)} -Property * | Select Name,OperatingSystem,OperatingSystemVersion, LastLogonTimeStamp
foreach($computer in $computers){
    $computer.LastLogonTimeStamp = [datetime]::FromFileTime($computer.LastLogonTimeStamp).ToString('dd.MM.yyyy HH:mm:ss')
}
$computers| Export-Csv c:\temp\windowsversions.csv -NoTypeInformation -Delimiter ';'
