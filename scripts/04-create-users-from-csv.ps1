# =====================================================================
# Script Name : 04-create-users-from-csv.ps1
# Description : Create Active Directory users from CSV file
# Environment : Windows Server 2025
# Domain      : lab.local
# =====================================================================

Import-Module ActiveDirectory


# CSV file location
$CSVPath = Join-Path $PSScriptRoot "..\csv\users.csv"


# Import users
$Users = Import-Csv $CSVPath


foreach ($User in $Users) {

    $Username = $User.Username


    # Check if user already exists
    $ExistingUser = Get-ADUser `
        -Filter "SamAccountName -eq '$Username'" `
        -ErrorAction SilentlyContinue


    if ($ExistingUser) {

        Write-Host "[INFO] User '$Username' already exists." -ForegroundColor Yellow

    }

    else {

        # Build Department OU path
        $UserOU = "OU=$($User.Department),OU=Departments,DC=lab,DC=local"


        # Convert password
        $Password = ConvertTo-SecureString `
            $User.Password `
            -AsPlainText `
            -Force


        # Create user
        New-ADUser `
            -Name "$($User.FirstName) $($User.LastName)" `
            -GivenName $User.FirstName `
            -Surname $User.LastName `
            -SamAccountName $Username `
            -UserPrincipalName "$Username@lab.local" `
            -Department $User.Department `
            -Path $UserOU `
            -AccountPassword $Password `
            -Enabled $true `
            -ChangePasswordAtLogon $true


        Write-Host "[SUCCESS] User '$Username' created in $($User.Department)." -ForegroundColor Green

    }

}


Write-Host ""
Write-Host "User deployment completed successfully." -ForegroundColor Cyan