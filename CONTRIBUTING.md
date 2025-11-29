# Contributing to fluttercn

Thank you for your interest in contributing to fluttercn! This document provides guidelines and instructions for contributing.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for all contributors.

## How to Contribute

### Reporting Bugs

Before creating a bug report, please check if the issue has already been reported. If it hasn't, create a new issue with:

- A clear, descriptive title
- Steps to reproduce the issue
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Environment details (Flutter version, CLI version, OS)

### Suggesting Features

We welcome feature suggestions! Please create an issue with:

- A clear description of the feature
- Use cases and examples
- Why this feature would be useful

### Contributing Code

#### Setting Up Development Environment

1. **Fork and clone the repository:**
   ```bash
   git clone https://github.com/pinak3748/fluttercn.git
   cd fluttercn
   ```

2. **Set up the Dart CLI:**
   ```bash
   cd dart-cli
   dart pub get
   # For local development, activate from path
   dart pub global activate --source path .
   ```

3. **Set up the playground:**
   ```bash
   cd ../playground
   flutter pub get
   ```

4. **Set up the documentation website (optional):**
   ```bash
   cd ../www
   npm install
   ```

#### Development Workflow

1. **Create a branch:**
   ```bash
   git checkout -b feature/component-name
   # or
   git checkout -b fix/issue-description
   ```

2. **Develop in the playground:**
   - Create your widget in `playground/lib/widgets/`
   - Create a showcase page in `playground/lib/presentations/`
   - Test thoroughly

3. **Add to CLI (if adding a new component):**
   - Update `dart-cli/assets/core/registery.json`
   - Add component files to `dart-cli/assets/core/widgets/`
   - Test the CLI command: `fluttercn add <component-name>`

4. **Update documentation:**
   - Update component documentation in `www/content/docs/`
   - Update README if needed

5. **Commit your changes:**
   ```bash
   git commit -m "feat: add new component"
   ```
   
   Use conventional commit messages:
   - `feat:` for new features
   - `fix:` for bug fixes
   - `docs:` for documentation changes
   - `style:` for formatting changes
   - `refactor:` for code refactoring
   - `test:` for adding tests
   - `chore:` for maintenance tasks

6. **Push and create a Pull Request:**
   ```bash
   git push origin feature/component-name
   ```

#### Adding a New Component

1. **Create the component in the playground:**
   - Add widget file to `playground/lib/widgets/`
   - Create showcase in `playground/lib/presentations/`
   - Test all variants and use cases

2. **Add to CLI registry:**
   - Copy widget file to `dart-cli/assets/core/widgets/`
   - Add entry to `dart-cli/assets/core/registery.json`:
     ```json
     "component-name": {
       "name": "component-name",
       "description": "Component description",
       "files": [...],
       "dependencies": [...],
       "usageExample": "..."
     }
     ```

3. **Update documentation:**
   - Add component page to `www/content/docs/components/`
   - Include examples and API reference

4. **Test the CLI:**
   ```bash
   cd dart-cli
   # Reactivate after changes
   dart pub global activate --source path .
   fluttercn add component-name
   ```

#### Code Style

- Follow Flutter/Dart style guidelines for Dart code
- Follow TypeScript/JavaScript style guidelines for CLI code
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions focused and small

#### Testing

- Test components in the playground before adding to CLI
- Test CLI commands with a fresh Flutter project
- Ensure components work on different screen sizes
- Test edge cases and error handling

## Pull Request Process

1. Ensure your code follows the project's style guidelines
2. Update documentation as needed
3. Add tests if applicable
4. Ensure all tests pass
5. Update CHANGELOG.md with your changes
6. Create a clear PR description explaining:
   - What changes were made
   - Why the changes were made
   - How to test the changes

## Component Guidelines

When creating new components:

- **Accessibility**: Ensure components are accessible
- **Customization**: Make components easily customizable
- **Documentation**: Include clear usage examples
- **Consistency**: Follow existing component patterns
- **Performance**: Optimize for performance
- **Responsive**: Ensure components work on all screen sizes

## Questions?

If you have questions, feel free to:
- Open a discussion on GitHub
- Create an issue with the `question` label
- Reach out to maintainers

Thank you for contributing to fluttercn! 🎉

