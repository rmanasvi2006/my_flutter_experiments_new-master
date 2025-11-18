import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, outline, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final bool isFullWidth;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isFullWidth = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return ElevatedButton(
      onPressed: onPressed,
      style: _getButtonStyle(theme),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) 
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(icon, size: 20),
              ),
            Text(
              text,
              style: _getTextStyle(theme),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle(ThemeData theme) {
    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColor,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 2,
        );
      case ButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.secondary,
          foregroundColor: theme.colorScheme.onSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 2,
        );
      case ButtonVariant.outline:
        return OutlinedButton.styleFrom(
          side: BorderSide(color: theme.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      case ButtonVariant.text:
        return TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
    }
  }

  TextStyle? _getTextStyle(ThemeData theme) {
    return variant == ButtonVariant.text 
        ? theme.textTheme.labelLarge?.copyWith(
            color: theme.primaryColor,
            fontWeight: FontWeight.w600,
          )
        : theme.textTheme.labelLarge?.copyWith(
            color: variant == ButtonVariant.outline 
                ? theme.primaryColor 
                : theme.colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          );
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  final double elevation;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const CustomCard({
    Key? key,
    required this.child,
    this.elevation = 2.0,
    this.color,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      color: color ?? Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
