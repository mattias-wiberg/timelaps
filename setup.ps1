# setup.ps1 - Script to initialize all components of the Timelapse Application
$ErrorActionPreference = "Stop"

# Get the current directory of the script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host "Setting up Timelapse Application components from: $scriptPath" -ForegroundColor Cyan

# Create uploads directory if it doesn't exist
$uploadsPath = Join-Path $scriptPath "timelaps-service\uploads"
if (-not (Test-Path $uploadsPath -PathType Container)) {
    New-Item -Path $uploadsPath -ItemType Directory | Out-Null
    Write-Host "Created uploads directory for storing images" -ForegroundColor Green
}
else {
    Write-Host "Uploads directory already exists" -ForegroundColor Green
}

# Install dependencies for timelapse service
Write-Host "Installing Timelapse Service dependencies..." -ForegroundColor Cyan
Set-Location (Join-Path $scriptPath "timelaps-service")
npm install

# Install dependencies for camera frontend
Write-Host "Installing Camera Frontend dependencies..." -ForegroundColor Cyan
Set-Location (Join-Path $scriptPath "camera-frontend")
npm install

# Install dependencies for timelapse frontend
Write-Host "Installing Timelapse Frontend dependencies..." -ForegroundColor Cyan
Set-Location (Join-Path $scriptPath "timelaps-frontend")
npm install

# Return to root and install root dependencies
Write-Host "Installing root project dependencies..." -ForegroundColor Cyan
Set-Location $scriptPath
npm install

Write-Host "Setup completed successfully!" -ForegroundColor Green
Write-Host "You can now start the application using: npm start" -ForegroundColor Yellow
