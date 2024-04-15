#Create AD Account
New-ADServiceAccount MSA_Server1 -DNSHostName "MSA_Server1" -PrincipalsAllowedToRetrieveManagedPassword Server1$

#On Server1 run this to add the account:
Install-ADServiceAccount -Identity MSA_Server1

#If it isn't working the Remote Active Directory Administration with Windows PowerShell is probably needed:
#https://learn.microsoft.com/en-us/previous-versions/technet-magazine/gg413289(v=msdn.10)?redirectedfrom=MSDN
#First open a Windows PowerShell session with elevated privileges. You can do this by right-clicking the shortcut and selecting Run As Administrator.

#Now use the following command to import the ServerManager module:
#Import-Module ServerManager

#Once you have done this, you can install individual features by name using the Add- Windowsfeature cmdlet. To display a list of the Command IDs for all of the roles and features available for installation, use this command:
#Get-WindowsFeature

#You can then use the following command to install the Active Directory Module for Windows PowerShell and ADAC features:
#Add-WindowsFeature RSAT-AD-PowerShell,RSAT-AD-AdminCenter


#If you changed servers and want to migrate a managed service account to your new server
#you have to changed the Principal(s) allowd to retrieve the Managed Passwort via
Set-ADServiceAccount -Identity msaaccountname$ -PrincipalsAllowedToRetrieveManagedPassword "CN=NewServer,OU=Server,DC=your,DC=domain"

#Afterwards add the account on NewServer via 
Install-ADServiceAccount -Identity msaaccountname$

#Delete User from Server if you want to migrate the user to a new Server
Uninstall-ADServiceAccount msaaccountname$
