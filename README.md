# Timelapse Application

A full-stack application for creating and managing timelapses using webcam captures. This project consists of three main components:

1. **Camera Frontend**: A React application to capture webcam images
2. **Timelapse Frontend**: A React application to view and manage captured images
3. **Timelapse Service**: A NestJS backend service to store and process images

## Project Structure

- `camera-frontend/`: Webcam capture interface built with React, TypeScript, and Shadcn/UI
- `timelaps-frontend/`: Timelapse viewer interface built with React, TypeScript, and Shadcn/UI
- `timelaps-service/`: Backend API service built with NestJS
- `start-all.ps1`: PowerShell script to start all services

## Prerequisites

- [Node.js](https://nodejs.org/) (v22 or later)
- [npm](https://www.npmjs.com/) (v9 or later)
- [Git](https://git-scm.com/)
- A modern web browser with webcam support

## Initial Setup

After cloning the repository, follow these steps to set up all components:

### 1. Install Dependencies for All Components

The easiest way to set up all components is to use the included setup script:

```powershell
# Run the setup script directly
.\setup.ps1
```

This script will install dependencies for all components

If you prefer to install dependencies manually, you can run the following commands in PowerShell:

```powershell
# Install dependencies for Camera Frontend
cd ./camera-frontend
npm install
cd ..

# Install dependencies for Timelapse Frontend
cd ./timelaps-frontend
npm install
cd ..

# Install dependencies for Timelapse Service
cd ./timelaps-service
npm install
cd ..
```

### 2. Create Required Directories

Ensure the uploads directory exists for the timelapse service:

```powershell
# Create uploads directory if it doesn't exist
if (-not (Test-Path -Path "./timelaps-service/uploads" -PathType Container)) {
    New-Item -Path "./timelaps-service/uploads" -ItemType Directory
    Write-Host "Created uploads directory for storing timelapse images"
}
```

## Running the Application

### Option 1: Using the Start Script

The easiest way to run all components is to use the provided `start-all.ps1` script:

```powershell
./start-all.ps1
```

This will start:
- Camera Frontend on http://localhost:5173
- Timelapse Frontend on http://localhost:5174
- Timelapse Service on http://localhost:3000

### Option 2: Running Components Individually

If you prefer to run components separately:

#### Camera Frontend

```powershell
cd ./camera-frontend
npm run dev
```

#### Timelapse Frontend

```powershell
cd ./timelaps-frontend
npm run dev
```

#### Timelapse Service

```powershell
cd ./timelaps-service
npm run start:dev
```

## How to Use the Application

1. **Capture Images**:
   - Open the Camera Frontend (http://localhost:5173)
   - Allow camera access when prompted
   - Use the "Take Picture" button to capture individual images or "Start Automatic Capture" to capture images at set intervals

2. **View Timelapses**:
   - Open the Timelapse Frontend (http://localhost:5174)
   - Use the Gallery view to see all captured images
   - Use the Timeline view to view images sequentially and control playback
   - Use the Live view to see the most recent captured image

## Development

### Camera Frontend

The camera frontend is built with:
- React + TypeScript
- Vite as the build tool
- Shadcn/UI for components

Key files:
- `camera-frontend/src/App.tsx`: Main application component
- `camera-frontend/src/components/ui/`: Shadcn/UI components

### Timelapse Frontend

The timelapse frontend is built with:
- React + TypeScript
- Vite as the build tool
- Shadcn/UI for components

Key files:
- `timelaps-frontend/src/App.tsx`: Main application component
- `timelaps-frontend/src/components/ui/`: Shadcn/UI components

### Timelapse Service

The backend service is built with:
- NestJS + TypeScript
- File system for image storage

Key files:
- `timelaps-service/src/timelaps/timelaps.controller.ts`: API endpoints
- `timelaps-service/src/timelaps/timelaps.service.ts`: Business logic
- `timelaps-service/uploads/`: Storage location for images

## Troubleshooting

### Camera Access Issues

If you're having trouble with camera access:
- Ensure your browser has permission to access the camera
- Try using Chrome or Firefox for best compatibility
- Check that no other application is using the camera

### Connection Issues

If frontends can't connect to the backend:
- Ensure the timelapse service is running on port 3000
- Check for any CORS errors in the browser console
- Verify that firewalls aren't blocking local connections

### Image Storage Issues

If images aren't being saved:
- Check that the `uploads` directory exists in the timelapse service
- Ensure the application has write permissions to this directory
- Check the timelapse service logs for any file system errors

## License

[MIT License](LICENSE)
