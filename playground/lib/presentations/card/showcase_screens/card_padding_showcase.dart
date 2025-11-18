import 'package:flutter/material.dart';

import '../../../widgets/card.dart';
import '../../../config/theme.dart';

class CardPaddingShowcase extends StatelessWidget {
  const CardPaddingShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Padding'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Custom Padding',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Customize spacing within cards',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            Text(
              'Card Padding (Single Child)',
              style: AppTheme.titleLarge.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightSemiBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'When using single child mode, you can customize the entire card padding',
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVerticalLg,
            CNCard(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Compact Padding (8px)',
                    style: AppTheme.titleMedium.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalXs,
                  Text(
                    'Minimal spacing for dense layouts',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            CNCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Default Padding (16px)',
                    style: AppTheme.titleMedium.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalXs,
                  Text(
                    'Standard spacing for most use cases',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical2xl,
            CNCard(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spacious Padding (32px)',
                    style: AppTheme.titleMedium.copyWith(
                      color: AppTheme.textPrimary,
                      fontWeight: AppTheme.fontWeightSemiBold,
                    ),
                  ),
                  AppTheme.gapVerticalXs,
                  Text(
                    'Extra breathing room for important content',
                    style: AppTheme.bodySmall.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            AppTheme.gapVertical4xl,
            Text(
              'Section Padding (Composable)',
              style: AppTheme.titleLarge.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightSemiBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Customize padding for individual sections when using composable structure',
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVerticalLg,
            CNCard(
              header: CardHeader(
                title: CardTitle('Custom Header Padding'),
                description: CardDescription('This header has compact padding'),
                padding: const EdgeInsets.all(12),
              ),
              content: CardContent(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'Content section with spacious padding for better readability.',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              footer: CardFooter(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Footer with compact padding',
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textTertiary,
                  ),
                ),
              ),
            ),
            AppTheme.gapVertical2xl,
            CNCard(
              header: CardHeader(
                title: CardTitle('Asymmetric Padding'),
                description: CardDescription('Different padding on each side'),
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
              ),
              content: CardContent(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Text(
                  'Content with horizontal emphasis',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              footer: CardFooter(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Custom footer layout',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            Container(
              padding: AppTheme.paddingLg,
              decoration: BoxDecoration(
                color: AppTheme.info.withValues(alpha: 0.1),
                border: Border.all(color: AppTheme.info.withValues(alpha: 0.3)),
                borderRadius: AppTheme.borderRadiusLg,
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: AppTheme.info, size: 20),
                  AppTheme.gapHorizontalMd,
                  Expanded(
                    child: Text(
                      'Padding affects visual hierarchy and content density. Choose values that match your design system.',
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textPrimary,
                      ),
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
}
