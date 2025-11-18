import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarInteractiveShowcase extends StatefulWidget {
  const AvatarInteractiveShowcase({super.key});

  @override
  State<AvatarInteractiveShowcase> createState() =>
      _AvatarInteractiveShowcaseState();
}

class _AvatarInteractiveShowcaseState extends State<AvatarInteractiveShowcase> {
  String _lastTapped = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Avatars'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Interactive Avatars',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Avatars with tap handlers for user interaction',
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
                    fallbackName: 'Click Me',
                    onTap: () => _handleTap('Avatar 1'),
                  ),
                  Avatar(
                    size: AvatarSize.xl2,
                    imageUrl: 'https://i.pravatar.cc/150?img=7',
                    fallbackName: 'Profile',
                    showStatus: true,
                    onTap: () => _handleTap('Profile Avatar'),
                  ),
                  Avatar(
                    size: AvatarSize.xl2,
                    fallbackName: 'Tap Here',
                    showBorder: true,
                    onTap: () => _handleTap('Avatar 3'),
                  ),
                  Avatar(
                    size: AvatarSize.xl2,
                    imageUrl: 'https://i.pravatar.cc/150?img=9',
                    fallbackName: 'Interactive',
                    showStatus: true,
                    showBorder: true,
                    onTap: () => _handleTap('Interactive Avatar'),
                  ),
                ],
              ),
              if (_lastTapped.isNotEmpty) ...[
                AppTheme.gapVertical3xl,
                Container(
                  padding: AppTheme.paddingLg,
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceVariant,
                    borderRadius: AppTheme.borderRadiusLg,
                  ),
                  child: Text(
                    'Last tapped: $_lastTapped',
                    style: AppTheme.bodyLarge.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightMedium,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _handleTap(String name) {
    setState(() {
      _lastTapped = name;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name tapped!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
