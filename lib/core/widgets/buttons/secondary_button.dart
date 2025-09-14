import 'package:flutter/material.dart';

/// A secondary, outlined button for less prominent actions.
class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;

  const SecondaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton.icon(
        icon: icon ?? const SizedBox.shrink(),
        label: Text(text),
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          textStyle: Theme.of(context).textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
