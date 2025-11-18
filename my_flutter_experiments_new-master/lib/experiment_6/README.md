# Experiment 6: Custom Widgets and Theming

## Overview
This experiment demonstrates how to create custom widgets and apply consistent theming in Flutter.

## Features
- Custom button widget with different variants
- Custom card widget with elevation and rounded corners
- Theme customization (colors, typography, button themes)
- Dark/Light theme support

## Files
- `custom_widgets.dart`: Contains custom widget implementations
- `theme_config.dart`: Theme configuration and styling
- `custom_ui_screen.dart`: Demo screen showing the custom widgets in action

## How to Use
1. Import the custom widgets and theme configuration in your app
2. Use the custom widgets like any other Flutter widget
3. Apply the theme using `ThemeData` and `Theme` widget

## Example Usage
```dart
// Apply theme
MaterialApp(
  theme: AppTheme.lightTheme,
  darkTheme: AppTheme.darkTheme,
  themeMode: ThemeMode.system,
  home: const CustomUIScreen(),
);

// Use custom widgets
CustomButton(
  onPressed: () {},
  text: 'Click Me',
  variant: ButtonVariant.primary,
);
```
