import 'package:flutter/material.dart';

import '../../../widgets/card.dart';
import '../../../config/theme.dart';

class CardInteractiveShowcase extends StatefulWidget {
  const CardInteractiveShowcase({super.key});

  @override
  State<CardInteractiveShowcase> createState() => _CardInteractiveShowcaseState();
}

class _CardInteractiveShowcaseState extends State<CardInteractiveShowcase> {
  String _lastTapped = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Cards'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interactive Cards',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Cards with tap handlers for user interaction',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            CNCard(
              onTap: () => _handleTap('Basic clickable card'),
              header: CardHeader(
                title: CardTitle('Clickable Card'),
                description: CardDescription(
                  'Tap this card to see the interaction.',
                ),
              ),
              content: CardContent(
                child: Text(
                  'The entire card responds to tap gestures with hover and press animations.',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              onTap: () => _handleTap('Profile card'),
              content: CardContent(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: AppTheme.primary,
                      child: Text(
                        'JD',
                        style: TextStyle(
                          color: AppTheme.white,
                          fontWeight: AppTheme.fontWeightSemiBold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    AppTheme.gapHorizontalLg,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'John Doe',
                            style: AppTheme.titleMedium.copyWith(
                              color: AppTheme.textPrimary,
                              fontWeight: AppTheme.fontWeightSemiBold,
                            ),
                          ),
                          AppTheme.gapVerticalXs,
                          Text(
                            'Software Developer',
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.textTertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: AppTheme.textTertiary),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              onTap: () => _handleTap('Settings card'),
              child: Row(
                children: [
                  Container(
                    padding: AppTheme.paddingMd,
                    decoration: BoxDecoration(
                      color: AppTheme.info.withValues(alpha: 0.1),
                      borderRadius: AppTheme.borderRadiusMd,
                    ),
                    child: Icon(Icons.settings, color: AppTheme.info, size: 24),
                  ),
                  AppTheme.gapHorizontalMd,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Settings',
                          style: AppTheme.titleMedium.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: AppTheme.fontWeightSemiBold,
                          ),
                        ),
                        AppTheme.gapVerticalXs,
                        Text(
                          'Manage your preferences',
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: AppTheme.textTertiary, size: 16),
                ],
              ),
            ),
            AppTheme.gapVertical3xl,
            Row(
              children: [
                Expanded(
                  child: CNCard(
                    onTap: () => _handleTap('Like'),
                    child: Column(
                      children: [
                        Icon(Icons.favorite_border, color: AppTheme.error, size: 32),
                        AppTheme.gapVerticalMd,
                        Text(
                          'Like',
                          style: AppTheme.titleSmall.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: AppTheme.fontWeightSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppTheme.gapHorizontalMd,
                Expanded(
                  child: CNCard(
                    onTap: () => _handleTap('Share'),
                    child: Column(
                      children: [
                        Icon(Icons.share, color: AppTheme.info, size: 32),
                        AppTheme.gapVerticalMd,
                        Text(
                          'Share',
                          style: AppTheme.titleSmall.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: AppTheme.fontWeightSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AppTheme.gapHorizontalMd,
                Expanded(
                  child: CNCard(
                    onTap: () => _handleTap('Save'),
                    child: Column(
                      children: [
                        Icon(Icons.bookmark_border, color: AppTheme.warning, size: 32),
                        AppTheme.gapVerticalMd,
                        Text(
                          'Save',
                          style: AppTheme.titleSmall.copyWith(
                            color: AppTheme.textPrimary,
                            fontWeight: AppTheme.fontWeightSemiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (_lastTapped.isNotEmpty) ...[ AppTheme.gapVertical3xl,
              Container(
                padding: AppTheme.paddingLg,
                decoration: BoxDecoration(
                  color: AppTheme.surfaceVariant,
                  borderRadius: AppTheme.borderRadiusLg,
                ),
                child: Row(
                  children: [
                    Icon(Icons.touch_app, color: AppTheme.primary, size: 20),
                    AppTheme.gapHorizontalMd,
                    Expanded(
                      child: Text(
                        'Last tapped: $_lastTapped',
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.textPrimary,
                          fontWeight: AppTheme.fontWeightMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
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
