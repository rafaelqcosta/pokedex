import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/tokens/colors/app_colors.dart';
import 'package:pokedex/core/design_system/tokens/shadows/app_box_shadows.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsets padding;
  final List<BoxShadow>? shadows;
  final VoidCallback? onTap;
  final double? height;

  const AppCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderRadius = 24,
    this.padding = const EdgeInsets.all(16),
    this.shadows,
    this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadiusValue = BorderRadius.circular(borderRadius);

    final boxShadows = shadows ?? appBoxShadows;

    final card = Container(
      margin: const EdgeInsets.all(4),
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: borderRadiusValue,
        boxShadow: boxShadows,
      ),
      child: child,
    );

    return onTap != null ? GestureDetector(onTap: onTap, child: card) : card;
  }
}
