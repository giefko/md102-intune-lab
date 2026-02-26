# scripts/client.ps1
$ErrorActionPreference = "Stop"

$DcIp = "192.168.77.10"
$DomainName = "lab.local"

Write-Host "Setting DNS to DC ($DcIp)..." -ForegroundColor Cyan

$adapters = Get-DnsClientServerAddress -AddressFamily IPv4 |
  Where-Object { $_.InterfaceAlias -notmatch "Loopback" }

foreach ($a in $adapters) {
  Set-DnsClientServerAddress -InterfaceAlias $a.InterfaceAlias -ServerAddresses $DcIp
}

Write-Host "Waiting for DC to respond..." -ForegroundColor Cyan
for ($i=0; $i -lt 60; $i++) {
  if (Test-Connection -ComputerName $DcIp -Count 1 -Quiet) { break }
  Start-Sleep -Seconds 5
}

# If already joined, do nothing
$cs = Get-CimInstance Win32_ComputerSystem
if ($cs.PartOfDomain) {
  Write-Host "Client already joined to domain: $($cs.Domain). Skipping." -ForegroundColor Green
  exit 0
}

Write-Host "Joining domain $DomainName (you will be prompted for credentials)..." -ForegroundColor Yellow
Write-Host "Tip: after DC promotion, use domain admin like: LAB\Administrator" -ForegroundColor Yellow

$cred = Get-Credential -Message "Enter Domain Admin creds (e.g. LAB\Administrator)"
Add-Computer -DomainName $DomainName -Credential $cred -Force -Restart