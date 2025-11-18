import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/avatar.dart';

/// Preview widget highlighting onTap interactions
class AvatarInteractivePreview extends StatelessWidget {
  const AvatarInteractivePreview({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Wrap(
            spacing: AppTheme.spaceLg,
            runSpacing: AppTheme.spaceLg,
            alignment: WrapAlignment.center,
            children: [
              Avatar(
                fallbackName: 'Navigate',
                showStatus: true,
                statusColor: AppTheme.success,
                onTap: () => _showSnackBar(context, 'Navigate to details'),
              ),
              Avatar(
                fallbackName: 'Settings',
                shape: BoxShape.rectangle,
                borderRadius: 12,
                onTap: () => _showSnackBar(context, 'Open settings sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
