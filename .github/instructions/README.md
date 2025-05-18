# Copilot Instruction Files

This directory contains instruction files for GitHub Copilot to generate code that follows the patterns and technologies used in this project.

## How These Instructions Work

When GitHub Copilot is enabled with instruction files, it uses these files to understand the project's coding standards, technologies, and patterns. This helps it generate more relevant and project-specific code suggestions.

## Available Instruction Files

### Main Repository Instructions

- `copilot-instructions.md` - Main instruction file for each repository that provides general guidance on the repository's purpose and coding standards.

### Specialized Instructions (in `.github/instructions/`)

- `shadcn-ui.instructions.md` - Guidelines for implementing Shadcn/UI components
- `typescript.instructions.md` - TypeScript best practices for the project
- `nestjs.instructions.md` - NestJS patterns and best practices for the backend service

## How to Enable Instruction Files

To use these instruction files with GitHub Copilot:

1. Enable the setting in VS Code:
   - Open VS Code settings (Ctrl+,)
   - Search for "github.copilot.chat.codeGeneration.useInstructionFiles"
   - Check the box to enable it

2. Now when you use GitHub Copilot Chat or inline completions, these instructions will be automatically applied.

## Adding New Instructions

If you need to add new instruction files:

1. Create a new Markdown file in the `.github/instructions/` directory
2. Use front matter to specify which files the instructions apply to:
   ```
   ---
   applyTo: "**/*.tsx"
   ---
   ```
3. Add your instructions using Markdown formatting

## References

For more information on Copilot instruction files, see:
- [VS Code Documentation on Copilot Customization](https://code.visualstudio.com/docs/copilot/copilot-customization#_instruction-files)
