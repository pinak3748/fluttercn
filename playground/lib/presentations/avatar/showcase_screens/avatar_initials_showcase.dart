import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarInitialsShowcase extends StatelessWidget {
  const AvatarInitialsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Initials'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Avatar with Initials',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Fallback to user initials when no image is provided',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Wrap(
                spacing: 24,
                runSpacing: 24,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: const [
                  Avatar(
                    size: AvatarSize.xl,
                    fallbackName: 'John Doe',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    fallbackName: 'Jane Smith',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    fallbackName: 'Alice',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    fallbackName: 'Bob Johnson',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    fallbackName: 'Charlie',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    fallbackName: 'Diana Prince',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
