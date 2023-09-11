$filterDate= (Get-Date).AddYears(-1)
Get-ADComputer -Filter * -Properties * |Where-Object {$_.LastLogonDate -le $filterDate}|
Move-ADObject -TargetPath 'OU=Aussortiert,OU=Computers,OU=LOCK,DC=example,DC=org'