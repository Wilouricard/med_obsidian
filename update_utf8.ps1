# This small launcher reloads update.ps1 in UTF-8
$psFile = "C:\Users\Wilson\Documents\quartz\update.ps1"
$utf8 = Get-Content -Path $psFile -Raw -Encoding UTF8
Invoke-Expression $utf8
