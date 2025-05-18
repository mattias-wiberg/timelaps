$ErrorActionPreference = "Stop"

# Create necessary directories
if (-not (Test-Path -Path "c:\Users\matti\Development\Fullstack\timelaps\timelaps-service\uploads" -PathType Container)) {
    New-Item -Path "c:\Users\matti\Development\Fullstack\timelaps\timelaps-service\uploads" -ItemType Directory | Out-Null
    Write-Host "Created uploads directory"
}

# Start NestJS backend
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command cd c:\Users\matti\Development\Fullstack\timelaps\timelaps-service; npm run start:dev" -WorkingDirectory "c:\Users\matti\Development\Fullstack\timelaps\timelaps-service"
Write-Host "Started timelapse-service backend on port 3000"

# Start Camera Frontend
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command cd c:\Users\matti\Development\Fullstack\timelaps\camera-frontend; npm run dev" -WorkingDirectory "c:\Users\matti\Development\Fullstack\timelaps\camera-frontend"
Write-Host "Started camera-frontend (should be on port 5173)"

# Start Timelapse Frontend  
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit -Command cd c:\Users\matti\Development\Fullstack\timelaps\timelaps-frontend; npm run dev" -WorkingDirectory "c:\Users\matti\Development\Fullstack\timelaps\timelaps-frontend"
Write-Host "Started timelapse-frontend (should be on port 5174)"

Write-Host "All applications started!"
Write-Host "Camera Frontend: http://localhost:5173"
Write-Host "Timelapse Frontend: http://localhost:5174"
Write-Host "Timelapse API: http://localhost:3000"
