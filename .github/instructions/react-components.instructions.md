---
applyTo: "**/src/components/**/*.tsx"
---
# React Component Guidelines with Shadcn/UI

## Component Structure
- Name components using PascalCase
- Organize imports with React imports first, then Shadcn/UI components, then local imports
- Define prop interfaces above the component
- Use destructuring for props
- Use named exports for components

## Shadcn/UI Integration
- Import Shadcn/UI components from `@/components/ui/`
- Use the `cn()` utility from `@/lib/utils` for class name merging
- Follow Shadcn/UI naming conventions
- Prefer Shadcn/UI variants over custom CSS

## Component Example
```tsx
import React from 'react'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardFooter, CardHeader, CardTitle } from '@/components/ui/card'
import { cn } from '@/lib/utils'

interface ExampleCardProps {
  title: string
  children: React.ReactNode
  className?: string
  onAction?: () => void
}

export function ExampleCard({ title, children, className, onAction }: ExampleCardProps) {
  return (
    <Card className={cn("w-full max-w-md", className)}>
      <CardHeader>
        <CardTitle>{title}</CardTitle>
      </CardHeader>
      <CardContent>
        {children}
      </CardContent>
      <CardFooter>
        <Button onClick={onAction}>Action</Button>
      </CardFooter>
    </Card>
  )
}
```

## Hooks Usage
- Keep custom hooks in separate files
- Prefix hook names with `use`
- Define proper types for hook parameters and return values
- Implement proper cleanup in useEffect hooks

## Component Organization
- Group related components in the same directory
- Create specialized sub-components when needed
- Prefer composition over complex conditional rendering
