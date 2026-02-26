# scripts/dc01.ps1
$ErrorActionPreference = "Stop"

$DomainName = "lab.local"
$SafeModePass = ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force

Write-Host "Installing AD DS role..." -ForegroundColor Cyan
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools | Out-Null

# Check if already a Domain Controller
$alreadyDC = Test-Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters"

if (-not $alreadyDC) {
  Write-Host "Promoting to Domain Controller for $DomainName (will reboot)..." -ForegroundColor Yellow

  Install-ADDSForest `
    -DomainName $DomainName `
    -SafeModeAdministratorPassword $SafeModePass `
    -Force

  # NOTE: This triggers a reboot automatically.
} else {
  Write-Host "DC already configured. Skipping promotion." -ForegroundColor Green
}