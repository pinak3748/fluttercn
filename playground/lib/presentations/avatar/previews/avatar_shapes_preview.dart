import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/avatar.dart';

/// Preview widget showing circle and rectangular avatar shapes
class AvatarShapesPreview extends StatelessWidget {
  const AvatarShapesPreview({super.key});

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
            children: const [
              _ShapeExample(
                label: 'Circle (default)',
                avatar: Avatar(fallbackName: 'Circle'),
              ),
              _ShapeExample(
                label: 'Rounded rectangle',
                avatar: Avatar(
                  fallbackName: 'Rounded',
                  shape: BoxShape.rectangle,
                ),
              ),
              _ShapeExample(
                label: 'Custom radius 16',
                avatar: Avatar(
                  fallbackName: 'Custom',
                  shape: BoxShape.rectangle,
                  borderRadius: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShapeExample extends StatelessWidget {
  const _ShapeExample({required this.label, required this.avatar});

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
