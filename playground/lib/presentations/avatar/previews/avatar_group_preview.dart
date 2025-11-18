import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/avatar.dart';

/// Preview widget showing AvatarGroup usage
class AvatarGroupPreview extends StatelessWidget {
  const AvatarGroupPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final avatars = [
      const Avatar(
        assetPath: 'assets/images/avatar_sample.png',
        fallbackName: 'Jane Smith',
      ),
      const Avatar(
        assetPath: 'assets/images/avatar_sample.png',
        fallbackName: 'Jane Smith',
      ),
      const Avatar(
        assetPath: 'assets/images/avatar_sample.png',
        fallbackName: 'Jane Smith',
      ),
      const Avatar(
        assetPath: 'assets/images/avatar_sample.png',
        fallbackName: 'Jane Smith',
      ),
      const Avatar(fallbackName: 'Evan'),
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AvatarGroup(avatars: avatars, max: 3, size: AvatarSize.md),
              const SizedBox(height: 24),
              AvatarGroup(
                avatars: avatars,
                max: 5,
                size: AvatarSize.sm,
                spacing: -6,
                showBorder: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
