---
applyTo: "**/timelaps/**/*.ts"
---
# NestJS Patterns and Best Practices

## Module Structure
- Follow the NestJS module pattern (Controller, Service, Module)
- Use dependency injection for services
- Define providers in the module's providers array
- Export services that need to be available to other modules

## Controllers
- Use @Controller() decorator with proper path prefix
- Define API endpoints with @Get(), @Post(), etc. decorators
- Use appropriate HTTP status codes
- Validate request data with DTOs and pipes

## Services
- Implement business logic in service classes
- Use @Injectable() decorator for services
- Keep services focused on a single responsibility
- Use private methods for internal functionality

## Exception Handling
- Use HttpException for API errors
- Create custom exception filters when needed
- Provide meaningful error messages
- Log errors with appropriate context

## File Handling
- Use async file operations
- Handle file permissions appropriately
- Implement proper error handling for file operations
- Use streams for large file operations

## API Design
- Follow RESTful principles
- Use proper HTTP methods (GET, POST, PUT, DELETE)
- Use DTOs for request/response validation
- Document API endpoints with comments
- Implement proper CORS handling
