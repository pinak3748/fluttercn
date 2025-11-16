import 'package:flutter/material.dart';

import '../widgets/avatar.dart';
import '../config/theme.dart';

class AvatarShowcase extends StatefulWidget {
  const AvatarShowcase({super.key});

  @override
  State<AvatarShowcase> createState() => _AvatarShowcaseState();
}

class _AvatarShowcaseState extends State<AvatarShowcase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Components')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Avatar Sizes',
              'Avatars come in multiple sizes from xs to 2xl',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Column(
                    children: [
                      const Avatar(
                        size: AvatarSize.xs,
                        fallbackName: 'John Doe',
                      ),
                      AppTheme.gapVerticalSm,
                      Text('XS', style: AppTheme.labelSmall),
                    ],
                  ),
                  Column(
                    children: [
                      const Avatar(
                        size: AvatarSize.sm,
                        fallbackName: 'Jane Smith',
                      ),
                      AppTheme.gapVerticalSm,
                      Text('SM', style: AppTheme.labelSmall),
                    ],
                  ),
                  Column(
                    children: [
                      const Avatar(
                        size: AvatarSize.md,
                        fallbackName: 'Alice Bob',
                      ),
                      AppTheme.gapVerticalSm,
                      Text('MD', style: AppTheme.labelSmall),
                    ],
                  ),
                  Column(
                    children: [
                      const Avatar(
                        size: AvatarSize.lg,
                        fallbackName: 'Charlie Davis',
                      ),
                      AppTheme.gapVerticalSm,
                      Text('LG', style: AppTheme.labelSmall),
                    ],
                  ),
                  Column(
                    children: [
                      const Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'Emma Wilson',
                      ),
                      AppTheme.gapVerticalSm,
                      Text('XL', style: AppTheme.labelSmall),
                    ],
                  ),
                  Column(
                    children: [
                      const Avatar(
                        size: AvatarSize.xl2,
                        fallbackName: 'Frank Miller',
                      ),
                      AppTheme.gapVerticalSm,
                      Text('2XL', style: AppTheme.labelSmall),
                    ],
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Avatar with Initials',
              'Fallback to user initials when no image is provided',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'John Doe',
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Jane Smith',
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Alice',
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Bob Johnson',
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Avatar with Network Images',
              'Load images from the internet with error handling',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://i.pravatar.cc/150?img=1',
                    fallbackName: 'User 1',
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://i.pravatar.cc/150?img=2',
                    fallbackName: 'User 2',
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://i.pravatar.cc/150?img=3',
                    fallbackName: 'User 3',
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://i.pravatar.cc/150?img=4',
                    fallbackName: 'User 4',
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Avatar with Error Handling',
              'Gracefully handle broken image URLs with fallback',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://invalid-url.com/broken.jpg',
                    fallbackName: 'John Doe',
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://example.com/404.png',
                    fallbackName: 'Jane Smith',
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Avatar Shapes',
              'Circular and rounded square shapes',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Circle',
                    shape: BoxShape.circle,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Square',
                    shape: BoxShape.rectangle,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Rounded',
                    shape: BoxShape.rectangle,
                    borderRadius: 8,
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Avatar with Border',
              'Add decorative borders around avatars',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'John Doe',
                    showBorder: true,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    fallbackName: 'Jane Smith',
                    showBorder: true,
                    borderWidth: 3,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Alice',
                    showBorder: true,
                    shape: BoxShape.rectangle,
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Avatar with Status Indicator',
              'Show online/offline status or custom indicators',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  const Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Online',
                    showStatus: true,
                  ),
                  const Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://i.pravatar.cc/150?img=6',
                    fallbackName: 'Active',
                    showStatus: true,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Away',
                    showStatus: true,
                    statusColor: AppTheme.warning,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Busy',
                    showStatus: true,
                    statusColor: AppTheme.error,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Offline',
                    showStatus: true,
                    statusColor: AppTheme.textDisabled,
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Status Indicator Positions',
              'Position the status indicator in different corners',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: const [
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'TR',
                    showStatus: true,
                    statusPosition: StatusPosition.topRight,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'TL',
                    showStatus: true,
                    statusPosition: StatusPosition.topLeft,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'BR',
                    showStatus: true,
                    statusPosition: StatusPosition.bottomRight,
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'BL',
                    showStatus: true,
                    statusPosition: StatusPosition.bottomLeft,
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Interactive Avatars',
              'Avatars with tap handlers for user interaction',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackName: 'Click Me',
                    onTap: () => _showSnackBar('Avatar tapped!'),
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    imageUrl: 'https://i.pravatar.cc/150?img=7',
                    fallbackName: 'Profile',
                    showStatus: true,
                    onTap: () => _showSnackBar('Profile avatar tapped!'),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Avatar Groups',
              'Display multiple avatars together with overlap',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AvatarGroup(
                    avatars: [
                      Avatar(fallbackName: 'John Doe'),
                      Avatar(
                          imageUrl: 'https://i.pravatar.cc/150?img=8',
                          fallbackName: 'Jane'),
                      Avatar(fallbackName: 'Alice'),
                      Avatar(fallbackName: 'Bob'),
                    ],
                  ),
                  AppTheme.gapVerticalLg,
                  const AvatarGroup(
                    size: AvatarSize.sm,
                    avatars: [
                      Avatar(fallbackName: 'User 1'),
                      Avatar(fallbackName: 'User 2'),
                      Avatar(fallbackName: 'User 3'),
                      Avatar(fallbackName: 'User 4'),
                      Avatar(fallbackName: 'User 5'),
                      Avatar(fallbackName: 'User 6'),
                    ],
                    max: 4,
                  ),
                  AppTheme.gapVerticalLg,
                  const AvatarGroup(
                    size: AvatarSize.lg,
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
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Custom Fallback Widget',
              'Use custom widgets when images fail to load',
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackWidget: Container(
                      color: AppTheme.info,
                      child: Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: AppTheme.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackWidget: Container(
                      color: AppTheme.warning,
                      child: Center(
                        child: Icon(
                          Icons.star,
                          color: AppTheme.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Avatar(
                    size: AvatarSize.lg,
                    fallbackWidget: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.primary, AppTheme.info],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: AppTheme.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Real-world Examples',
              'Common avatar use cases in applications',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExample(
                    'User Profile',
                    Row(
                      children: [
                        const Avatar(
                          size: AvatarSize.lg,
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
                                style: AppTheme.titleMedium.copyWith(
                                  color: AppTheme.textPrimary,
                                  fontWeight: AppTheme.fontWeightSemiBold,
                                )),
                            AppTheme.gapVerticalXs,
                            Text('Product Designer',
                                style: AppTheme.bodySmall.copyWith(
                                  color: AppTheme.textTertiary,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
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
                                      style: AppTheme.labelMedium.copyWith(
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
                                style: AppTheme.bodySmall.copyWith(
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.headlineSmall.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: AppTheme.fontWeightSemiBold,
          ),
        ),
        AppTheme.gapVerticalSm,
        Text(
          description,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textTertiary,
          ),
        ),
        AppTheme.gapVerticalLg,
        content,
      ],
    );
  }

  Widget _buildExample(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
