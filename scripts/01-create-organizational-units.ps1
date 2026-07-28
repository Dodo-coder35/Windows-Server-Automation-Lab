# =====================================================================
# Script Name : 01-create-organizational-units.ps1
# Description : Create Active Directory Organizational Units
# Environment : Windows Server 2025
# Domain      : lab.local
# =====================================================================

Import-Module ActiveDirectory

# Active Directory domain path
$DomainDN = "DC=lab,DC=local"

# Organizational Units to create
$OrganizationalUnits = @(
    "Employees",
    "Departments",
    "Servers",
    "Workstations",
    "Security Groups",
    "Service Accounts"
)

foreach ($OU in $OrganizationalUnits) {

    # Check if OU already exists
    $ExistingOU = Get-ADOrganizationalUnit `
        -Filter "Name -eq '$OU'" `
        -ErrorAction SilentlyContinue

    if ($ExistingOU) {

        Write-Host "[INFO] OU '$OU' already exists." -ForegroundColor Yellow

    }
    else {

        New-ADOrganizationalUnit `
            -Name $OU `
            -Path $DomainDN `
            -ProtectedFromAccidentalDeletion $true

        Write-Host "[SUCCESS] OU '$OU' created." -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Organizational Units deployment completed successfully." -ForegroundColor Cyan
