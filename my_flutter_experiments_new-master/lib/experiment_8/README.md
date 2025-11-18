# Experiment 8: Flutter Animations

## Overview
This experiment demonstrates various animation techniques in Flutter, including implicit and explicit animations, and how to create smooth, engaging UI transitions.

## Features
- Implicit animations (AnimatedContainer, AnimatedOpacity, etc.)
- Explicit animations using AnimationController
- Tween animations
- Hero animations
- Staggered animations
- Custom animations with CustomPainter
- Performance optimization for animations

## Files
- `animations_screen.dart` - Main screen demonstrating different animation types
- `implicit_animations.dart` - Examples of implicit animations
- `explicit_animations.dart` - Examples of explicit animations
- `hero_animation_screen.dart` - Hero animation example
- `custom_animation_widget.dart` - Custom animation widget example

## How to Use
1. Import the animation widgets into your app
2. Use the provided animation examples as references
3. Customize animations to fit your app's design

## Example Usage
```dart
// Example of an implicit animation
AnimatedContainer(
  duration: Duration(seconds: 1),
  width: _selected ? 200.0 : 100.0,
  height: _selected ? 100.0 : 200.0,
  color: _selected ? Colors.red : Colors.blue,
  curve: Curves.easeInOut,
)

// Example of an explicit animation
AnimationController(
  duration: const Duration(seconds: 2),
  vsync: this,
)..repeat(reverse: true);
```

## Animation Types
1. **Implicit Animations**: Automatically animate between property changes
2. **Explicit Animations**: Manually control the animation flow
3. **Hero Animations**: For seamless transitions between screens
4. **Staggered Animations**: Sequence of animations in a specific order
5. **Custom Animations**: Create your own animations using CustomPainter

## Dependencies
- `flutter_animate`: For additional animation effects
- `simple_animations`: For more complex animation sequences
- `lottie`: For Lottie animations

## Best Practices
- Use `const` constructors when possible for better performance
- Dispose animation controllers in `dispose()` method
- Use `Tween` for smooth transitions between values
- Consider using `AnimatedBuilder` for complex animations
- Test animations on different devices for performance

## Screenshots
[Add screenshots of different animation examples]
