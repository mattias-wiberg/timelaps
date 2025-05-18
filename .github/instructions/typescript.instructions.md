---
applyTo: "**/*.ts,**/*.tsx"
---
# TypeScript Best Practices

## Type Definitions
- Define interfaces for all data structures
- Use type aliases for complex types
- Avoid using `any` type
- Use proper return types for functions
- Use generics where appropriate

## React Component Types
- Define prop interfaces for React components
- Use React.FC<Props> for functional components
- Type event handlers properly
- Define state types explicitly

## API Interaction
- Define interfaces for API request and response data
- Use proper typing for async operations
- Type fetch responses appropriately
- Handle errors with proper types

## Best Practices
- Use optional chaining (`?.`) for nullable values
- Use nullish coalescing (`??`) for default values
- Enable strict TypeScript configuration
- Use readonly properties for immutable data
- Prefer interfaces for public APIs and type aliases for complex types
