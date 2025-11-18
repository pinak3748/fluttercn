import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarStatusShowcase extends StatelessWidget {
  const AvatarStatusShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Indicator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Avatar with Status Indicator',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Show online/offline status or custom indicators',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Wrap(
                spacing: 32,
                runSpacing: 32,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  const Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'Online',
                        showStatus: true,
                      ),
                      SizedBox(height: 12),
                      Text('Online', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  const Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        imageUrl: 'https://i.pravatar.cc/150?img=6',
                        fallbackName: 'Active',
                        showStatus: true,
                      ),
                      SizedBox(height: 12),
                      Text('Active', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'Away',
                        showStatus: true,
                        statusColor: AppTheme.warning,
                      ),
                      const SizedBox(height: 12),
                      const Text('Away', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'Busy',
                        showStatus: true,
                        statusColor: AppTheme.error,
                      ),
                      const SizedBox(height: 12),
                      const Text('Busy', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'Offline',
                        showStatus: true,
                        statusColor: AppTheme.textDisabled,
                      ),
                      const SizedBox(height: 12),
                      const Text('Offline', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
              AppTheme.gapVertical4xl,
              Text(
                'Status Indicator Positions',
                style: AppTheme.headlineMedium.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightSemiBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Position the status indicator in different corners',
                style: AppTheme.bodyMedium.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical2xl,
              Wrap(
                spacing: 32,
                runSpacing: 32,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: const [
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'TR',
                        showStatus: true,
                        statusPosition: StatusPosition.topRight,
                      ),
                      SizedBox(height: 12),
                      Text('Top Right', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'TL',
                        showStatus: true,
                        statusPosition: StatusPosition.topLeft,
                      ),
                      SizedBox(height: 12),
                      Text('Top Left', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'BR',
                        showStatus: true,
                        statusPosition: StatusPosition.bottomRight,
                      ),
                      SizedBox(height: 12),
                      Text('Bottom Right', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'BL',
                        showStatus: true,
                        statusPosition: StatusPosition.bottomLeft,
                      ),
                      SizedBox(height: 12),
                      Text('Bottom Left', style: TextStyle(fontSize: 14)),
                    ],
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
