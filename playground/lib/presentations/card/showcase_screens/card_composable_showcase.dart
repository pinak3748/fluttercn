import 'package:flutter/material.dart';

import '../../../widgets/card.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class CardComposableShowcase extends StatelessWidget {
  const CardComposableShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Composable Cards'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Composable Structure',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Build cards with header, content, and footer sections',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            CNCard(
              header: CardHeader(
                title: CardTitle('Complete Card'),
                description: CardDescription(
                  'This card has all three sections: header, content, and footer.',
                ),
              ),
              content: CardContent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This is the main content area of the card.',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                    AppTheme.gapVerticalMd,
                    Text(
                      'You can put any widgets here, like text, images, or forms.',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              footer: CardFooter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      variant: ButtonVariant.outline,
                      size: ButtonSize.sm,
                      onPressed: () => _showMessage(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    AppTheme.gapHorizontalMd,
                    Button(
                      size: ButtonSize.sm,
                      onPressed: () => _showMessage(context, 'Save'),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              header: CardHeader(
                title: CardTitle('Header and Content Only'),
                description: CardDescription(
                  'This card doesn\'t have a footer section.',
                ),
              ),
              content: CardContent(
                child: Text(
                  'Perfect for displaying information without actions.',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              content: CardContent(
                child: Text(
                  'This card has content and footer but no header.',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              footer: CardFooter(
                child: Row(
                  children: [
                    Button(
                      size: ButtonSize.sm,
                      onPressed: () => _showMessage(context, 'Action'),
                      child: const Text('Action'),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              header: CardHeader(
                child: Row(
                  children: [
                    Icon(Icons.star, color: AppTheme.warning, size: 20),
                    AppTheme.gapHorizontalMd,
                    Text(
                      'Custom Header Content',
                      style: AppTheme.titleMedium.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                  ],
                ),
              ),
              content: CardContent(
                child: Text(
                  'You can use custom widgets in the header instead of title/description.',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              header: CardHeader(
                title: CardTitle('Multiple Actions'),
                description: CardDescription(
                  'Cards can have multiple action buttons in the footer.',
                ),
              ),
              content: CardContent(
                child: Text(
                  'This is useful for forms, dialogs, or any card that requires user input.',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              footer: CardFooter(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Button(
                      variant: ButtonVariant.ghost,
                      size: ButtonSize.sm,
                      onPressed: () => _showMessage(context, 'Delete'),
                      child: const Text('Delete'),
                    ),
                    Button(
                      variant: ButtonVariant.outline,
                      size: ButtonSize.sm,
                      onPressed: () => _showMessage(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    Button(
                      size: ButtonSize.sm,
                      onPressed: () => _showMessage(context, 'Save'),
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$action pressed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
