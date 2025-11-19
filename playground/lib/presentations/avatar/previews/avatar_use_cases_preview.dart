import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/avatar.dart';

/// Preview widget for the documentation examples (profile header + comment list)
class AvatarUseCasesPreview extends StatelessWidget {
  const AvatarUseCasesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final comments = [
      ('Alice Warren', 'Loved the latest update – avatars look fantastic!'),
      ('Brian Jones', 'Could we get a compact mode for dense lists?'),
      ('Caroline Webb', 'Status indicators are super helpful!'),
    ];

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: AppTheme.paddingXl,
                  child: Row(
                    children: [
                      Avatar(
                        assetPath: 'assets/images/avatar_sample.png',
                        fallbackName: 'Taylor Reed',
                        size: AvatarSize.xl,
                        showStatus: true,
                        statusColor: AppTheme.success,
                      ),
                      AppTheme.gapHorizontalLg,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Taylor Reed', style: AppTheme.titleLarge),
                          Text(
                            'taylor@fluttercn.dev',
                            style: AppTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: AppTheme.paddingXl,
                  child: Column(
                    children: comments
                        .map(
                          (comment) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Avatar(
                                  fallbackName: comment.$1,
                                  size: AvatarSize.sm,
                                ),
                                AppTheme.gapHorizontalMd,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.$1,
                                        style: AppTheme.titleSmall,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        comment.$2,
                                        style: AppTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
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
