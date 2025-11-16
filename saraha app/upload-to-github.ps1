# PowerShell script to upload project to GitHub
# This script will guide you through the process

$ErrorActionPreference = "Stop"

Write-Host "=== Uploading Project to GitHub ===" -ForegroundColor Green
Write-Host ""

# Check if Git is installed
$gitPath = $null
$possiblePaths = @(
    "git",
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\bin\git.exe",
    "$env:LOCALAPPDATA\Programs\Git\bin\git.exe"
)

foreach ($path in $possiblePaths) {
    try {
        if ($path -eq "git") {
            $version = & git --version 2>&1
            if ($LASTEXITCODE -eq 0) {
                $gitPath = "git"
                break
            }
        } else {
            if (Test-Path $path) {
                $version = & $path --version 2>&1
                if ($LASTEXITCODE -eq 0) {
                    $gitPath = $path
                    break
                }
            }
        }
    } catch {
        continue
    }
}

if (-not $gitPath) {
    Write-Host "❌ Git is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Git first:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://git-scm.com/download/win" -ForegroundColor Cyan
    Write-Host "2. Install it with default settings" -ForegroundColor Cyan
    Write-Host "3. Restart PowerShell and run this script again" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Or use GitHub Desktop:" -ForegroundColor Yellow
    Write-Host "Download from: https://desktop.github.com/" -ForegroundColor Cyan
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "✅ Git found: $gitPath" -ForegroundColor Green
Write-Host ""

# Navigate to project directory
$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectPath
Write-Host "📁 Project directory: $projectPath" -ForegroundColor Cyan
Write-Host ""

# Initialize git if not already initialized
if (-not (Test-Path ".git")) {
    Write-Host "🔧 Initializing Git repository..." -ForegroundColor Yellow
    if ($gitPath -eq "git") {
        & git init
    } else {
        & $gitPath init
    }
    Write-Host "✅ Repository initialized" -ForegroundColor Green
} else {
    Write-Host "✅ Git repository already initialized" -ForegroundColor Green
}

# Add all files
Write-Host "📦 Adding files to staging..." -ForegroundColor Yellow
if ($gitPath -eq "git") {
    & git add .
} else {
    & $gitPath add .
}
Write-Host "✅ Files staged" -ForegroundColor Green

# Check if there are changes to commit
Write-Host "💾 Checking for changes..." -ForegroundColor Yellow
if ($gitPath -eq "git") {
    $status = & git status --porcelain
} else {
    $status = & $gitPath status --porcelain
}

if ($status) {
    Write-Host "💾 Committing changes..." -ForegroundColor Yellow
    if ($gitPath -eq "git") {
        & git commit -m "Initial commit: Anonymous Messaging Platform API"
    } else {
        & $gitPath commit -m "Initial commit: Anonymous Messaging Platform API"
    }
    Write-Host "✅ Changes committed" -ForegroundColor Green
} else {
    Write-Host "ℹ️  No changes to commit" -ForegroundColor Cyan
}

# Check if remote exists
Write-Host "🔗 Configuring remote repository..." -ForegroundColor Yellow
$repoUrl = "https://github.com/amrattia11/saraha.app.git"

if ($gitPath -eq "git") {
    $remotes = & git remote
} else {
    $remotes = & $gitPath remote
}

if ($remotes -notcontains "origin") {
    Write-Host "🔗 Adding remote repository..." -ForegroundColor Yellow
    if ($gitPath -eq "git") {
        & git remote add origin $repoUrl
    } else {
        & $gitPath remote add origin $repoUrl
    }
    Write-Host "✅ Remote added" -ForegroundColor Green
} else {
    Write-Host "✅ Remote repository already configured" -ForegroundColor Green
    if ($gitPath -eq "git") {
        & git remote set-url origin $repoUrl
    } else {
        & $gitPath remote set-url origin $repoUrl
    }
}

# Set branch to main
Write-Host "🌿 Setting branch to main..." -ForegroundColor Yellow
if ($gitPath -eq "git") {
    & git branch -M main
} else {
    & $gitPath branch -M main
}
Write-Host "✅ Branch set to main" -ForegroundColor Green

# Push to GitHub
Write-Host ""
Write-Host "🚀 Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "⚠️  You may be prompted for GitHub credentials" -ForegroundColor Yellow
Write-Host "   If asked for username, enter: amrattia11" -ForegroundColor Cyan
Write-Host "   If asked for password, use a Personal Access Token (not your password)" -ForegroundColor Cyan
Write-Host "   Create one at: https://github.com/settings/tokens" -ForegroundColor Cyan
Write-Host ""

if ($gitPath -eq "git") {
    & git push -u origin main
} else {
    & $gitPath push -u origin main
}

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Successfully uploaded to GitHub!" -ForegroundColor Green
    Write-Host "🔗 Repository: $repoUrl" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ Failed to push to GitHub" -ForegroundColor Red
    Write-Host "Common issues:" -ForegroundColor Yellow
    Write-Host "1. Authentication failed - use a Personal Access Token" -ForegroundColor Cyan
    Write-Host "2. Repository doesn't exist - create it on GitHub first" -ForegroundColor Cyan
    Write-Host "3. Network issues - check your internet connection" -ForegroundColor Cyan
    Write-Host ""
}

Read-Host "Press Enter to exit"

