---
applyTo: "**/*.tsx"
---
# Shadcn/UI Implementation Guidelines

## Component Usage
- Always import Shadcn/UI components from the `@/components/ui` path
- Follow the Shadcn/UI documentation for proper component usage
- Use the available Shadcn/UI props before adding custom styling

## Styling Approach
- Use Tailwind classes for layout and positioning
- Use the `cn()` utility from `@/lib/utils` for conditional class names
- Don't override the base Shadcn/UI components with custom CSS
- Use Flexbox for component positioning

## Component Customization
- Customize components using the variant props provided by Shadcn/UI
- For custom variants, extend the component in a separate file
- Maintain accessibility features when customizing components

## Theme Usage
- Use the Shadcn/UI theming system for light/dark modes
- Reference theme variables using Tailwind classes
- Don't hardcode colors that are available in the theme

## Common Components
- Button: Use for all clickable actions
- Card: Use for containing related content
- Tabs: Use for switching between different views
- Input: Use for all text input fields
- Slider: Use for numeric range controls

## Best Practices
- Maintain responsive design with Tailwind's responsive utilities
- Keep component trees shallow for better performance
- Use Shadcn/UI form components for form validation
- Implement proper keyboard navigation for all interactive components
