$PicturesPath="\\fileserver\share\folder\"

#Get Users. We're filtering for users with a samaccountname length of 3 because all
#relevant users are setup this way
$Users=Get-Aduser -Properties * -Filter 'enabled -eq $true'|where-object {$_.samAccountName.Length -eq 3}

foreach($User in $Users){
    $Picture="$($PicturesPath)$($User.SamAccountName).jpg"

    #Check if there is a picture of the colleague in the picture Share
    if(Test-Path $Picture){
        $photo = [byte[]](Get-Content $Picture -Encoding byte)
        Set-ADUser $User.SamAccountName -Replace @{thumbnailPhoto=$photo}
    }
}
    
