import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarBorderShowcase extends StatelessWidget {
  const AvatarBorderShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Border'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Avatar with Border',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Add decorative borders around avatars',
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
                        size: AvatarSize.xl,
                        fallbackName: 'John Doe',
                        showBorder: true,
                      ),
                      SizedBox(height: 12),
                      Text('Default Border', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        imageUrl: 'https://i.pravatar.cc/150?img=5',
                        fallbackName: 'Jane Smith',
                        showBorder: true,
                        borderWidth: 3,
                      ),
                      SizedBox(height: 12),
                      Text('Thick Border', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        fallbackName: 'Alice',
                        showBorder: true,
                        shape: BoxShape.rectangle,
                      ),
                      SizedBox(height: 12),
                      Text('Square with Border', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Column(
                    children: [
                      Avatar(
                        size: AvatarSize.xl,
                        imageUrl: 'https://i.pravatar.cc/150?img=8',
                        fallbackName: 'Bob',
                        showBorder: true,
                        borderWidth: 4,
                      ),
                      SizedBox(height: 12),
                      Text('Extra Thick', style: TextStyle(fontSize: 14)),
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
