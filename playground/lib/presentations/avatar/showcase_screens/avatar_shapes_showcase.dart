import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarShapesShowcase extends StatelessWidget {
  const AvatarShapesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Shapes'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Avatar Shapes',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Circular and rounded square shapes',
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
                children: const [
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl2,
                        fallbackName: 'Circle',
                        shape: BoxShape.circle,
                      ),
                      SizedBox(height: 16),
                      Text('Circle', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl2,
                        fallbackName: 'Square',
                        shape: BoxShape.rectangle,
                      ),
                      SizedBox(height: 16),
                      Text('Square', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl2,
                        fallbackName: 'Rounded',
                        shape: BoxShape.rectangle,
                        borderRadius: 8,
                      ),
                      SizedBox(height: 16),
                      Text('Rounded (8px)', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl2,
                        imageUrl: 'https://i.pravatar.cc/150?img=7',
                        fallbackName: 'Rounded',
                        shape: BoxShape.rectangle,
                        borderRadius: 16,
                      ),
                      SizedBox(height: 16),
                      Text('Rounded (16px)', style: TextStyle(fontSize: 16)),
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
