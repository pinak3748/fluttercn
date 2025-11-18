import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarRealWorldShowcase extends StatelessWidget {
  const AvatarRealWorldShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-world Examples'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real-world Examples',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Common avatar use cases in applications',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            _buildExample(
              'User Profile',
              Row(
                children: [
                  const Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://i.pravatar.cc/150?img=11',
                    fallbackName: 'Sarah Johnson',
                    showBorder: true,
                    showStatus: true,
                  ),
                  AppTheme.gapHorizontalLg,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sarah Johnson',
                          style: AppTheme.titleLarge.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: AppTheme.fontWeightSemiBold,
                          )),
                      AppTheme.gapVerticalXs,
                      Text('Product Designer',
                          style: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.textTertiary,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Comment Section',
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Avatar(
                    size: AvatarSize.md,
                    fallbackName: 'Mike Chen',
                  ),
                  AppTheme.gapHorizontalMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Mike Chen',
                                style: AppTheme.labelLarge.copyWith(
                                  color: AppTheme.textPrimary,
                                  fontWeight: AppTheme.fontWeightSemiBold,
                                )),
                            AppTheme.gapHorizontalSm,
                            Text('2 hours ago',
                                style: AppTheme.labelSmall.copyWith(
                                  color: AppTheme.textTertiary,
                                )),
                          ],
                        ),
                        AppTheme.gapVerticalXs,
                        Text(
                          'This is a great component! Love the flexibility and customization options.',
                          style: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Team Members',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Team Members',
                          style: AppTheme.titleMedium.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: AppTheme.fontWeightSemiBold,
                          )),
                      AppTheme.gapVerticalXs,
                      Text('8 active members',
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.textTertiary,
                          )),
                    ],
                  ),
                  const AvatarGroup(
                    size: AvatarSize.sm,
                    avatars: [
                      Avatar(
                          imageUrl: 'https://i.pravatar.cc/150?img=12',
                          fallbackName: 'A'),
                      Avatar(fallbackName: 'B'),
                      Avatar(
                          imageUrl: 'https://i.pravatar.cc/150?img=13',
                          fallbackName: 'C'),
                      Avatar(fallbackName: 'D'),
                      Avatar(fallbackName: 'E'),
                      Avatar(fallbackName: 'F'),
                      Avatar(fallbackName: 'G'),
                      Avatar(fallbackName: 'H'),
                    ],
                    max: 5,
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'Chat List Item',
              Row(
                children: [
                  const Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://i.pravatar.cc/150?img=14',
                    fallbackName: 'Emma Watson',
                    showStatus: true,
                  ),
                  AppTheme.gapHorizontalMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Emma Watson',
                                style: AppTheme.titleMedium.copyWith(
                                  color: AppTheme.textPrimary,
                                  fontWeight: AppTheme.fontWeightSemiBold,
                                )),
                            Text('2:45 PM',
                                style: AppTheme.labelSmall.copyWith(
                                  color: AppTheme.textTertiary,
                                )),
                          ],
                        ),
                        AppTheme.gapVerticalXs,
                        Text(
                          'Hey! How are you doing today?',
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            _buildExample(
              'User Card',
              Container(
                padding: AppTheme.paddingLg,
                child: Column(
                  children: [
                    const Avatar(
                      size: AvatarSize.xl2,
                      imageUrl: 'https://i.pravatar.cc/150?img=15',
                      fallbackName: 'David Lee',
                      showBorder: true,
                      borderWidth: 3,
                    ),
                    AppTheme.gapVerticalLg,
                    Text('David Lee',
                        style: AppTheme.headlineSmall.copyWith(
                          color: AppTheme.textPrimary,
                          fontWeight: AppTheme.fontWeightBold,
                        )),
                    AppTheme.gapVerticalXs,
                    Text('Senior Developer',
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.textTertiary,
                        )),
                    AppTheme.gapVerticalSm,
                    Text('San Francisco, CA',
                        style: AppTheme.bodySmall.copyWith(
                          color: AppTheme.textTertiary,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExample(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
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
            style: AppTheme.labelMedium.copyWith(
              color: AppTheme.textTertiary,
              fontWeight: AppTheme.fontWeightMedium,
            ),
          ),
          AppTheme.gapVerticalMd,
          content,
        ],
      ),
    );
  }
}
