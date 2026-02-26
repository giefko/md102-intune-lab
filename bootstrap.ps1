<#
bootstrap.ps1
Creates the initial folder/file structure for the MD-102 lab repository.

Run:
  cd C:\repos\md102-intune-lab
  .\bootstrap.ps1
#>

[CmdletBinding()]
param(
  [string]$RepoRoot = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

function Ensure-Dir([string]$Path) {
  if (-not (Test-Path $Path)) {
    New-Item -ItemType Directory -Path $Path | Out-Null
  }
}

function Ensure-File([string]$Path, [string]$Content = "") {
  if (-not (Test-Path $Path)) {
    New-Item -ItemType File -Path $Path | Out-Null
    if ($Content) { Set-Content -Path $Path -Value $Content -Encoding UTF8 }
  }
}

Write-Host "RepoRoot: $RepoRoot" -ForegroundColor Cyan

# Folders
$folders = @(
  "scripts",
  "scripts\modules",
  "docs",
  "diagrams",
  "intune",
  "conditional-access"
)

foreach ($f in $folders) {
  Ensure-Dir (Join-Path $RepoRoot $f)
}

# Root files
Ensure-File (Join-Path $RepoRoot "README.md") @"
# MD-102 Intune & Endpoint Administration Lab

This repository contains a hands-on lab environment for MD-102 preparation:
- Hybrid identity (AD DS + Entra ID)
- Microsoft Intune enrollment & compliance
- Conditional Access scenarios
- App deployment and Autopilot documentation

## Quick Start
1. Run: `.\make.ps1 up`
2. Then: `.\make.ps1 provision`
3. Generate topology: `.\make.ps1 diagram`
"@

Ensure-File (Join-Path $RepoRoot ".gitignore") @"
.vagrant/
*.log
*.tmp
*.bak
Thumbs.db
.DS_Store
"@

# Placeholder docs
Ensure-File (Join-Path $RepoRoot "docs\01-build-lab.md") "# Build the lab (Vagrant + VirtualBox)"
Ensure-File (Join-Path $RepoRoot "docs\02-domain-join.md") "# Domain join & verification steps"
Ensure-File (Join-Path $RepoRoot "docs\03-intune-enrollment.md") "# Intune enrollment lab steps"
Ensure-File (Join-Path $RepoRoot "docs\04-compliance-ca.md") "# Compliance + Conditional Access scenarios"

# Placeholder Intune docs
Ensure-File (Join-Path $RepoRoot "intune\compliance-policies.md") "# Compliance Policy Lab"
Ensure-File (Join-Path $RepoRoot "intune\app-deployment.md") "# Win32 App Deployment Lab"
Ensure-File (Join-Path $RepoRoot "intune\autopilot-setup.md") "# Autopilot Setup Notes"

# Conditional Access docs
Ensure-File (Join-Path $RepoRoot "conditional-access\require-mfa.md") "# Conditional Access: Require MFA"
Ensure-File (Join-Path $RepoRoot "conditional-access\block-noncompliant.md") "# Conditional Access: Block non-compliant devices"

# Script placeholders (you will paste real content later)
Ensure-File (Join-Path $RepoRoot "scripts\Run-Lab.ps1") "# Placeholder: Run-Lab.ps1"
Ensure-File (Join-Path $RepoRoot "scripts\Invoke-All.ps1") "# Placeholder: Invoke-All.ps1"
Ensure-File (Join-Path $RepoRoot "make.ps1") "# Placeholder: make.ps1"
Ensure-File (Join-Path $RepoRoot "Vagrantfile") "# Placeholder: Vagrantfile"

Write-Host "`nDone. Created initial structure." -ForegroundColor Green
Write-Host "Next:" -ForegroundColor Yellow
Write-Host "  1) Paste real make.ps1 + Vagrantfile + scripts content"
Write-Host "  2) git add . && git commit -m 'Bootstrap repo structure' && git push"