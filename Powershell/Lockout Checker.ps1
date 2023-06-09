Import-Module C:\Scripts\SendEmail\MailModule.psm1
$MailAccount=Import-Clixml -Path C:\Scripts\SendEmail\outlook.xml
$MailPort = 587
$MailSMTPServer=smtp-mail.outlook.com
$MailFrom=$MailAccount.Username
$MailTo="testplucey@outlook.com"

$LogPath= "C:\users\Administrator\Desktop\Logs"
$LogFile ="Lockouts = $(Get-Date - Format "MM-dd-yyyy hh-mm).csv"

$LockedOutUsers=Search-ADAccount -LockedOut -Server thelab.local

$Export=[System.Collections.ArrayList]@()

foreach($LockedOutUser in $LockedOutUsers){
    $ADUser=Get-ADUser -Identity $LockedOutUser.SamAccountName -Server thelab.local -Properties *
    $Entry=New-Object -TypeName PSObject
    Add-Member -InputObject $Entry -MemberType NoteProperty -Name "Name" -Value "$($ADUser.GivenName) $($ADUser.Surname)"
    Add-Member -InputObject $Entry -MemberType NoteProperty -Name "UserName" -Value $ADUser.SamAccountName
    Add-Member -InputObject $Entry -MemberType NoteProperty -Name "LockoutTime" -Value $([datetime]::FromFileTime($ADUser.lockoutTime))
    Add-Member -InputObject $Entry -MemberType NoteProperty -Name "LastBadPasswordAttempt" -Value $ADUser.LastBadPasswordAttempt
    [void]$Export.Add($Entry)
}

if($Export){
    $Export | Export-Csv -Path "$LogPath\$LogFile" -Delimiter ',' -NoTypeInformation
}

if(Test-Path -Path "$LogPath\$LogFile"){
    $Subject="Account Lockouts"
    $Body="Here are the lockedout accounts"
    $Attachment="$LogPath\$LogFile"
    Send-MailKitMessage -From $MailFrom -To $MailTo -SMTPServer $MailSMTPServer -Port $MailPort -Credential $MailAccount -Subject $Subject -Body $Body -Attachments $Attachment
}