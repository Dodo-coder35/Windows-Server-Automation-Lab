# =====================================================================
# Script Name : 02-create-security-groups.ps1
# Description : Create Active Directory Security Groups
# Environment : Windows Server 2025
# Domain      : lab.local
# =====================================================================

Import-Module ActiveDirectory

$DomainDN = "OU=Security Groups,DC=lab,DC=local"

$SecurityGroups = @(
    "IT-Admins",
    "HR-Users",
    "Finance-Users",
    "Management",
    "Helpdesk"
)

foreach ($Group in $SecurityGroups) {

    $ExistingGroup = Get-ADGroup `
        -Filter "Name -eq '$Group'" `
        -ErrorAction SilentlyContinue

    if ($ExistingGroup) {

        Write-Host "[INFO] Group '$Group' already exists." -ForegroundColor Yellow

    }
    else {

        New-ADGroup `
            -Name $Group `
            -SamAccountName $Group `
            -GroupScope Global `
            -GroupCategory Security `
            -Path $DomainDN

        Write-Host "[SUCCESS] Group '$Group' created." -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Security Groups deployment completed successfully." -ForegroundColor Cyan