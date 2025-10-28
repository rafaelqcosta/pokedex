import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/imports.dart';

enum AppErrorType { failure, empty, building }

extension AppErrorTypeExtension on AppErrorType {
  IconData? get icon {
    switch (this) {
      case AppErrorType.failure:
        return Icons.sentiment_very_dissatisfied;
      case AppErrorType.empty:
        return Icons.search_off_outlined;
      case AppErrorType.building:
        return Icons.handyman;
    }
  }
}

class AppErrorMessage extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final AppErrorType? errorType;
  const AppErrorMessage({super.key, required this.message, this.onRetry, this.errorType});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (errorType != null) ...[
          Icon(errorType!.icon, size: 60, color: AppColors.red),
          const SizedBox(height: 12),
        ],
        AppText.regular(message, color: AppColors.gray3, textAlign: TextAlign.center),
        if (onRetry != null) ...[
          const SizedBox(height: 16),
          TextButton(
            onPressed: onRetry,
            child: AppText.bold('Tentar novamente', color: AppColors.green1),
          ),
        ],
      ],
    );
  }
}
