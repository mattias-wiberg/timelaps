# Developer Guide

This document provides detailed information for developers working on the Timelapse Application.

## Environment Setup

### Recommended Development Environment

- **Code Editor**: Visual Studio Code with these extensions:
  - ESLint
  - Prettier
  - TypeScript and JavaScript Language Features
  - GitHub Copilot (with instruction files enabled)

- **Node.js Version**: v22 or later (compatible with all components)

- **Development OS**: Windows, macOS, or Linux (scripts may need adjustment for non-Windows systems)

### Setting Up Git Hooks (Optional)

If you want to enforce code quality, you can set up Git hooks:

```powershell
# Install husky for Git hooks
npm install -g husky

# Navigate to project root and initialize husky
cd ./
npm install --save-dev husky lint-staged
npx husky install
```

## Project Architecture

### Overview

The application follows a microservices-like architecture with:

- Frontend services:
  - Camera Frontend (React + TypeScript)
  - Timelapse Frontend (React + TypeScript)

- Backend services:
  - Timelapse Service (NestJS)

### Data Flow

1. Camera Frontend captures images and sends them to the Timelapse Service
2. Timelapse Service stores images and exposes APIs to access them
3. Timelapse Frontend consumes APIs from the Timelapse Service to display images

## Component Details

### Camera Frontend

#### Key Technologies
- React 19+
- TypeScript
- Vite
- Shadcn/UI

#### Component Structure
- `App.tsx`: Main application component
- `components/ui/`: Shadcn/UI components

#### Development Commands
```powershell
# Start development server
npm run dev

# Build for production
npm run build

# Run type checking
npm run typecheck
```

### Timelapse Frontend

#### Key Technologies
- React 19+
- TypeScript
- Vite
- Shadcn/UI

#### Component Structure
- `App.tsx`: Main application component
- `components/ui/`: Shadcn/UI components

#### Development Commands
```powershell
# Start development server
npm run dev

# Build for production
npm run build

# Run type checking
npm run typecheck
```

### Timelapse Service

#### Key Technologies
- NestJS
- TypeScript
- Express
- File system operations

#### Component Structure
- `src/timelaps/timelaps.controller.ts`: API endpoints
- `src/timelaps/timelaps.service.ts`: Business logic
- `src/timelaps/timelaps.module.ts`: Module definition

#### Development Commands
```powershell
# Start development server
npm run start:dev

# Build for production
npm run build

# Run tests
npm run test
```

## API Documentation

### Timelapse Service API Endpoints

#### `POST /timelapse/upload`
- **Description**: Upload a new image to the timelapse collection
- **Request Body**:
  ```json
  {
    "image": "base64-encoded-image-data",
    "timestamp": "ISO-8601-timestamp"
  }
  ```
- **Response**: 
  ```json
  {
    "filename": "image_123456789.jpg",
    "path": "/uploads/image_123456789.jpg"
  }
  ```

#### `GET /timelapse/images`
- **Description**: Get all timelapse images
- **Response**: Array of image metadata
  ```json
  [
    {
      "filename": "image_123456789.jpg",
      "path": "/uploads/image_123456789.jpg",
      "timestamp": 1623456789000
    }
  ]
  ```

#### `GET /timelapse/images/:filename`
- **Description**: Get a specific image by filename
- **Response**: The image file

#### `GET /timelapse/latest`
- **Description**: Get the most recent image
- **Response**: Image metadata
  ```json
  {
    "filename": "image_123456789.jpg",
    "path": "/uploads/image_123456789.jpg",
    "timestamp": 1623456789000
  }
  ```

## Common Development Tasks

### Adding a New Shadcn/UI Component

1. Navigate to the frontend directory:
   ```powershell
   cd ./camera-frontend  # or timelaps-frontend
   ```

2. Add the component using the Shadcn CLI:
   ```powershell
   npx shadcn-ui@latest add [component-name]
   ```

3. The component will be available in `src/components/ui/`

### Modifying the Backend API

1. Define any new DTOs in the controller file

2. Implement the business logic in the service file

3. Expose the new endpoint in the controller:
   ```typescript
   @Get('new-endpoint')
   async newEndpoint() {
     return this.timelapsService.newMethod();
   }
   ```

### Building for Production

To build all components for production:

```powershell
# Build Camera Frontend
cd ./camera-frontend
npm run build
cd ..

# Build Timelapse Frontend
cd ./timelaps-frontend
npm run build
cd ..

# Build Timelapse Service
cd ./timelaps-service
npm run build
cd ..
```

## Instruction Files

This project uses GitHub Copilot instruction files to enforce coding standards and patterns. These files are located in:

- `.github/copilot-instructions.md`: Per-repository instructions
- `.github/instructions/`: Specialized instructions for different aspects of the codebase

To enable these instructions in VS Code:
1. Open VS Code settings
2. Search for "github.copilot.chat.codeGeneration.useInstructionFiles"
3. Enable the setting
