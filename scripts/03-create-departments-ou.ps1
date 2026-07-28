# =====================================================================
# Script Name : 03-create-departments-ou.ps1
# Description : Create Department Organizational Units
# Environment : Windows Server 2025
# Domain      : lab.local
# =====================================================================

Import-Module ActiveDirectory

# Parent OU
$ParentOU = "OU=Departments,DC=lab,DC=local"

# Departments to create
$Departments = @(
    "IT",
    "HR",
    "Finance",
    "Management"
)

foreach ($Department in $Departments) {

    $ExistingOU = Get-ADOrganizationalUnit `
        -Filter "Name -eq '$Department'" `
        -SearchBase $ParentOU `
        -ErrorAction SilentlyContinue

    if ($ExistingOU) {

        Write-Host "[INFO] OU '$Department' already exists." -ForegroundColor Yellow

    }
    else {

        New-ADOrganizationalUnit `
            -Name $Department `
            -Path $ParentOU

        Write-Host "[SUCCESS] OU '$Department' created." -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Department OUs deployment completed successfully." -ForegroundColor Cyan