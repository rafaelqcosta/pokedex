import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

class AppSnackbarManager {
  static OverlayEntry? _currentSnackbar;

  static void show({
    required BuildContext context,
    required Widget icon,
    required String message,
    Color borderColor = AppColors.yellow,
    Duration duration = const Duration(seconds: 3),
  }) {
    _currentSnackbar?.remove();

    final overlay = Overlay.of(context);

    final entry = OverlayEntry(
      builder: (_) => Positioned(
        top: MediaQuery.of(context).padding.top + kToolbarHeight + 40,
        right: 18,
        child: AnimatedOpacity(
          opacity: 1,
          duration: const Duration(milliseconds: 200),
          child: AppSnackbar(icon: icon, message: message, borderColor: borderColor),
        ),
      ),
    );

    overlay.insert(entry);
    _currentSnackbar = entry;

    Future.delayed(duration, () {
      entry.remove();
      _currentSnackbar = null;
    });
  }
}
