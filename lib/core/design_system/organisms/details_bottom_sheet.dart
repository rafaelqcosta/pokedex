import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';
import 'package:pokedex/core/design_system/tokens/shadows/app_box_shadows.dart';

class PokemonBottomSheet extends StatelessWidget {
  final Widget child;
  final bool showHandle;
  final double initialHeight;
  final Color? backgroundColor;

  const PokemonBottomSheet({
    super.key,
    required this.child,
    this.showHandle = true,
    this.initialHeight = 0.7,
    this.backgroundColor,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    bool showHandle = true,
    double initialHeight = 0.7,
    bool isScrollControlled = true,
    final Color? backgroundColor,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,

      builder: (_) => FractionallySizedBox(
        heightFactor: initialHeight,
        child: PokemonBottomSheet(
          showHandle: showHandle,
          initialHeight: initialHeight,
          backgroundColor: backgroundColor,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          child: ClipPath(
            clipper: DiagonalTopClipper(),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor ?? AppColors.white,
                boxShadow: appBoxShadows,
              ),
            ),
          ),
        ),
        Positioned(
          left: 5,
          bottom: MediaQuery.of(context).size.height * 0.45,
          child: AppImage.png(PngImgs.pokeball),
        ),

        child,
      ],
    );
  }
}

class DiagonalTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double diagonalHeight = 70;
    const double radius = 28;

    final path = Path();

    path.moveTo(0, size.height);
    path.lineTo(0, radius + diagonalHeight);

    // curva esquerda
    path.quadraticBezierTo(
      radius * 0.2,
      diagonalHeight + radius * 0.1,
      radius * 1.1,
      diagonalHeight,
    );

    path.lineTo(size.width - radius * 1.2, 0);

    // curva direita
    path.arcToPoint(
      Offset(size.width, radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );

    path.lineTo(size.width, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
