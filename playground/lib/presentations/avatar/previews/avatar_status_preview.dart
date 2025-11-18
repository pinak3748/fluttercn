import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/avatar.dart';

/// Preview widget showing the status indicator positions and colors
class AvatarStatusPreview extends StatelessWidget {
  const AvatarStatusPreview({super.key});

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
              _StatusExample(
                label: 'Online (bottom right)',
                avatar: Avatar(
                  fallbackName: 'Online',
                  showStatus: true,
                  statusColor: AppTheme.success,
                  statusPosition: StatusPosition.bottomRight,
                ),
              ),
              _StatusExample(
                label: 'Busy (bottom right)',
                avatar: Avatar(
                  fallbackName: 'Busy',
                  showStatus: true,
                  statusColor: AppTheme.error,
                  statusPosition: StatusPosition.bottomRight,
                ),
              ),
              _StatusExample(
                label: 'Away (top right)',
                avatar: Avatar(
                  fallbackName: 'Away',
                  showStatus: true,
                  statusColor: AppTheme.warning,
                  statusPosition: StatusPosition.topRight,
                ),
              ),
              _StatusExample(
                label: 'Focus (top left)',
                avatar: Avatar(
                  fallbackName: 'Focus',
                  showStatus: true,
                  statusColor: AppTheme.primary,
                  statusPosition: StatusPosition.topLeft,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusExample extends StatelessWidget {
  const _StatusExample({required this.label, required this.avatar});

  final String label;
  final Avatar avatar;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        avatar,
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}
