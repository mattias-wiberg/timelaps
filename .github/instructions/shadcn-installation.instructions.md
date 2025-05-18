---
applyTo: "**/DEVELOPER.md"
---
# Shadcn UI Installation Guide

## Installing Components
- Use `npx shadcn@latest add <component-name>` to add new components
- Do NOT use `npx shadcn-ui@latest` as it may cause installation issues
- Always run the installation command from the root of the frontend project

## Component Addition Process
1. Navigate to the frontend project directory: `cd path/to/frontend`
2. Run the install command: `npx shadcn@latest add <component-name>`
3. Import the component from `@/components/ui/<component-name>`

## Handling Installation Issues
- If encountering React 19 peer dependency issues, use the `--legacy-peer-deps` flag
- For multiple components, add them in a single command: `npx shadcn@latest add button card tabs`
- Make sure to restart any running development servers after adding components

## Component Customization
- After installation, components can be found in `src/components/ui/`
- Customize styles in the component file while maintaining Shadcn UI patterns
- Update the `tailwind.config.js` file for global theme changes
