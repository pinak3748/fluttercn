import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarCustomFallbackShowcase extends StatelessWidget {
  const AvatarCustomFallbackShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Fallback'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Custom Fallback Widget',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Use custom widgets when images fail to load',
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
                  Avatar(
                    size: AvatarSize.xl2,
                    fallbackWidget: Container(
                      color: AppTheme.info,
                      child: Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: AppTheme.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Avatar(
                    size: AvatarSize.xl2,
                    fallbackWidget: Container(
                      color: AppTheme.warning,
                      child: Center(
                        child: Icon(
                          Icons.star,
                          color: AppTheme.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Avatar(
                    size: AvatarSize.xl2,
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
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Avatar(
                    size: AvatarSize.xl2,
                    fallbackWidget: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.success, AppTheme.warning],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.music_note,
                          color: AppTheme.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Avatar(
                    size: AvatarSize.xl2,
                    shape: BoxShape.rectangle,
                    fallbackWidget: Container(
                      color: AppTheme.error,
                      child: Center(
                        child: Icon(
                          Icons.psychology,
                          color: AppTheme.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  Avatar(
                    size: AvatarSize.xl2,
                    shape: BoxShape.rectangle,
                    borderRadius: 16,
                    fallbackWidget: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.error, AppTheme.info],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.palette,
                          color: AppTheme.white,
                          size: 40,
                        ),
                      ),
                    ),
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
