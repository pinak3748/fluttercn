# fluttercn Playground

A testing environment for developing and showcasing fluttercn components.

## Overview

The playground is where we develop and test new components before they're added to the CLI. Each component goes through development and testing here before being made available through the CLI.

## Structure

- `lib/widgets/` - Component implementations
- `lib/presentations/` - Showcase pages demonstrating different use cases for each component

## Adding a New Component

1. Create your widget in `lib/widgets/`
2. Create a showcase page in `lib/presentations/` to demonstrate various use cases
3. Add navigation to your showcase in the dashboard
4. Test thoroughly before creating a PR

## Available Components

- Card
- Button
- Badge
- Avatar
- Checkbox
- Tooltip

## Development Workflow

1. Create your widget in `lib/widgets/`
2. Create a showcase page in `lib/presentations/` to demonstrate various use cases
3. Add navigation to your showcase in the dashboard
4. Test thoroughly on different screen sizes and scenarios
5. Follow the contribution guidelines in the root [CONTRIBUTING.md](../CONTRIBUTING.md)

## Running the Playground

```bash
flutter pub get
flutter run
```

## Testing

Ensure all components are tested for:
- Different screen sizes
- Light and dark themes
- Accessibility
- Edge cases
