import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onTap;
  final double radius;
  final EdgeInsets padding;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.radius = 12,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(radius);

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        highlightColor: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        child: Padding(padding: padding, child: icon),
      ),
    );
  }
}
