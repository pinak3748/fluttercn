import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarNetworkImagesShowcase extends StatelessWidget {
  const AvatarNetworkImagesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network Images'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Avatar with Network Images',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Load images from the internet with loading states and error handling',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Wrap(
                spacing: 24,
                runSpacing: 32,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: const [
                  Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://i.pravatar.cc/150?img=1',
                    fallbackName: 'User 1',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://i.pravatar.cc/150?img=2',
                    fallbackName: 'User 2',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://i.pravatar.cc/150?img=3',
                    fallbackName: 'User 3',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://i.pravatar.cc/150?img=4',
                    fallbackName: 'User 4',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://i.pravatar.cc/150?img=5',
                    fallbackName: 'User 5',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://i.pravatar.cc/150?img=6',
                    fallbackName: 'User 6',
                  ),
                ],
              ),
              AppTheme.gapVertical4xl,
              Text(
                'Error Handling',
                style: AppTheme.headlineMedium.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightSemiBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Gracefully handle broken image URLs with fallback',
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical2xl,
              Wrap(
                spacing: 24,
                runSpacing: 24,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: const [
                  Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://invalid-url.com/broken.jpg',
                    fallbackName: 'John Doe',
                  ),
                  Avatar(
                    size: AvatarSize.xl,
                    imageUrl: 'https://example.com/404.png',
                    fallbackName: 'Jane Smith',
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
