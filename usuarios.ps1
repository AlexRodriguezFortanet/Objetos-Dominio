Import-Module ActiveDirectory
$Users = Import-Csv -Path "C:\Users\Administrador\Desktop\usuariosSistema.ods - usuarios-Subdominio1.csv"            
foreach ($User in $Users)            
{            
    $Displayname = $User.Name            
    $UserFirstname = $User.Surname1            
    $UserLastname = $User.Surname2                       
    $SAM = $User.account            
    $UPN = $User.account          
    $Description = $User.Dni         
    New-ADUser -Name $Displayname -DisplayName $Displayname -SamAccountName $SAM -UserPrincipalName $UPN -GivenName $UserFirstname -Surname $UserLastname -Description $Description -AccountPassword (ConvertTo-SecureString "Iso2022CS123" -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true –PasswordNeverExpires $false
          }