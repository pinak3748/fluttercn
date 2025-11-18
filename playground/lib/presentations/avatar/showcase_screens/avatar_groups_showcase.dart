import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarGroupsShowcase extends StatelessWidget {
  const AvatarGroupsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Groups'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Avatar Groups',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Display multiple avatars together with overlap',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              _buildGroupExample(
                'Small Team',
                const AvatarGroup(
                  size: AvatarSize.lg,
                  avatars: [
                    Avatar(fallbackName: 'John Doe'),
                    Avatar(
                        imageUrl: 'https://i.pravatar.cc/150?img=8',
                        fallbackName: 'Jane'),
                    Avatar(fallbackName: 'Alice'),
                    Avatar(fallbackName: 'Bob'),
                  ],
                ),
              ),
              AppTheme.gapVertical3xl,
              _buildGroupExample(
                'Large Team (with limit)',
                const AvatarGroup(
                  size: AvatarSize.md,
                  avatars: [
                    Avatar(fallbackName: 'User 1'),
                    Avatar(fallbackName: 'User 2'),
                    Avatar(fallbackName: 'User 3'),
                    Avatar(fallbackName: 'User 4'),
                    Avatar(fallbackName: 'User 5'),
                    Avatar(fallbackName: 'User 6'),
                    Avatar(fallbackName: 'User 7'),
                    Avatar(fallbackName: 'User 8'),
                  ],
                  max: 4,
                ),
              ),
              AppTheme.gapVertical3xl,
              _buildGroupExample(
                'Extra Large Size',
                const AvatarGroup(
                  size: AvatarSize.xl,
                  avatars: [
                    Avatar(
                        imageUrl: 'https://i.pravatar.cc/150?img=9',
                        fallbackName: 'A'),
                    Avatar(
                        imageUrl: 'https://i.pravatar.cc/150?img=10',
                        fallbackName: 'B'),
                    Avatar(fallbackName: 'C'),
                  ],
                ),
              ),
              AppTheme.gapVertical3xl,
              _buildGroupExample(
                'Small Size with Many Users',
                const AvatarGroup(
                  size: AvatarSize.sm,
                  avatars: [
                    Avatar(imageUrl: 'https://i.pravatar.cc/150?img=11', fallbackName: 'A'),
                    Avatar(fallbackName: 'B'),
                    Avatar(imageUrl: 'https://i.pravatar.cc/150?img=12', fallbackName: 'C'),
                    Avatar(fallbackName: 'D'),
                    Avatar(fallbackName: 'E'),
                    Avatar(fallbackName: 'F'),
                    Avatar(fallbackName: 'G'),
                    Avatar(fallbackName: 'H'),
                    Avatar(fallbackName: 'I'),
                    Avatar(fallbackName: 'J'),
                  ],
                  max: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupExample(String title, Widget group) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingXl,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: AppTheme.borderRadiusLg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.titleMedium.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: AppTheme.fontWeightSemiBold,
            ),
          ),
          AppTheme.gapVerticalLg,
          group,
        ],
      ),
    );
  }
}
