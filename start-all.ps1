$ErrorActionPreference = "Stop"

# Get the current directory of the script to ensure we can run from anywhere
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$timelapsRoot = $scriptPath

# Display project information
Write-Host "=== Timelapse Application Startup ===" -ForegroundColor Cyan
Write-Host "Starting all components from: $timelapsRoot" -ForegroundColor Gray

# Check for node and npm
try {
    $nodeVersion = node -v
    $npmVersion = npm -v
    Write-Host "Using Node.js $nodeVersion with npm $npmVersion" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Node.js or npm not found. Please install Node.js before running this script." -ForegroundColor Red
    exit 1
}

# Create necessary directories
$uploadsPath = Join-Path -Path $timelapsRoot -ChildPath "timelaps-service\uploads"
if (-not (Test-Path -Path $uploadsPath -PathType Container)) {
    New-Item -Path $uploadsPath -ItemType Directory | Out-Null
    Write-Host "Created uploads directory for storing images" -ForegroundColor Green
}

# Check if dependencies are installed
$servicePackageJson = Join-Path -Path $timelapsRoot -ChildPath "timelaps-service\node_modules"
$cameraPackageJson = Join-Path -Path $timelapsRoot -ChildPath "camera-frontend\node_modules"
$timelapsPackageJson = Join-Path -Path $timelapsRoot -ChildPath "timelaps-frontend\node_modules"

$missingDeps = $false

if (-not (Test-Path -Path $servicePackageJson)) {
    Write-Host "WARNING: Timelapse Service dependencies not installed" -ForegroundColor Yellow
    $missingDeps = $true
}

if (-not (Test-Path -Path $cameraPackageJson)) {
    Write-Host "WARNING: Camera Frontend dependencies not installed" -ForegroundColor Yellow
    $missingDeps = $true
}

if (-not (Test-Path -Path $timelapsPackageJson)) {
    Write-Host "WARNING: Timelapse Frontend dependencies not installed" -ForegroundColor Yellow
    $missingDeps = $true
}

if ($missingDeps) {
    Write-Host "Some dependencies are missing. Would you like to install them now? (Y/N)" -ForegroundColor Yellow
    $response = Read-Host
    if ($response -eq "Y" -or $response -eq "y") {
        Write-Host "Installing dependencies for all components..." -ForegroundColor Cyan
        
        # Install timelapse service dependencies
        Write-Host "Installing Timelapse Service dependencies..." -ForegroundColor Gray
        Set-Location -Path (Join-Path -Path $timelapsRoot -ChildPath "timelaps-service")
        npm install
        
        # Install camera frontend dependencies
        Write-Host "Installing Camera Frontend dependencies..." -ForegroundColor Gray
        Set-Location -Path (Join-Path -Path $timelapsRoot -ChildPath "camera-frontend")
        npm install
        
        # Install timelapse frontend dependencies
        Write-Host "Installing Timelapse Frontend dependencies..." -ForegroundColor Gray
        Set-Location -Path (Join-Path -Path $timelapsRoot -ChildPath "timelaps-frontend")
        npm install
        
        # Return to script directory
        Set-Location -Path $timelapsRoot
        Write-Host "All dependencies installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "WARNING: Continuing without installing dependencies. Services may not start correctly." -ForegroundColor Yellow
    }
}

# Start NestJS backend
Write-Host "Starting Timelapse Service..." -ForegroundColor Cyan
$serviceDir = Join-Path -Path $timelapsRoot -ChildPath "timelaps-service"
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command Set-Location '$serviceDir'; npm run start:dev" -WorkingDirectory $serviceDir
Write-Host "Timelapse Service starting on port 3000" -ForegroundColor Green

# Give the service a moment to start
Start-Sleep -Seconds 2

# Start Camera Frontend
Write-Host "Starting Camera Frontend..." -ForegroundColor Cyan
$cameraDir = Join-Path -Path $timelapsRoot -ChildPath "camera-frontend"
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command Set-Location '$cameraDir'; npm run dev" -WorkingDirectory $cameraDir
Write-Host "Camera Frontend starting on port 5173" -ForegroundColor Green

# Start Timelapse Frontend  
Write-Host "Starting Timelapse Frontend..." -ForegroundColor Cyan
$timelapsDir = Join-Path -Path $timelapsRoot -ChildPath "timelaps-frontend"
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command Set-Location '$timelapsDir'; npm run dev" -WorkingDirectory $timelapsDir
Write-Host "Timelapse Frontend starting on port 5174" -ForegroundColor Green

Write-Host "=== All applications started! ===" -ForegroundColor Cyan
Write-Host "Camera Frontend: http://localhost:5173" -ForegroundColor Green
Write-Host "Timelapse Frontend: http://localhost:5174" -ForegroundColor Green
Write-Host "Timelapse API: http://localhost:3000" -ForegroundColor Green
Write-Host ""
Write-Host "TIP: You can stop all services by closing the terminal windows." -ForegroundColor Gray
