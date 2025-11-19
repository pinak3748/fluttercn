import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/avatar.dart';

/// Preview widget showing the basic avatar use cases (network, asset, initials, custom)
class AvatarBasicPreview extends StatelessWidget {
  const AvatarBasicPreview({super.key});

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
                assetPath: 'assets/images/avatar_sample.png',
                fallbackName: 'Jane Smith',
                size: AvatarSize.xl,
              ),
              const Avatar(fallbackName: 'Alice Bob', size: AvatarSize.xl),
              Avatar(
                size: AvatarSize.xl,
                fallbackWidget: Container(
                  color: AppTheme.primary.withOpacity(0.1),
                  child: Center(
                    child: Icon(Icons.person_outline, color: AppTheme.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
