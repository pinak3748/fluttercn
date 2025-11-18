import 'package:flutter/material.dart';

import '../../../widgets/card.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class CardDividersShowcase extends StatelessWidget {
  const CardDividersShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Dividers'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Section Dividers',
              style: AppTheme.displaySmall.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Visual separation between card sections',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVertical4xl,
            Text(
              'Without Dividers (Default)',
              style: AppTheme.titleLarge.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightSemiBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Sections flow seamlessly without visual separation',
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVerticalLg,
            CNCard(
              header: CardHeader(
                title: CardTitle('Card Without Dividers'),
                description: CardDescription(
                  'The sections blend together naturally.',
                ),
              ),
              content: CardContent(
                child: Text(
                  'This is the content section. Notice there\'s no visual line separating it from the header or footer.',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              footer: CardFooter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      variant: ButtonVariant.outline,
                      size: ButtonSize.sm,
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                    AppTheme.gapHorizontalMd,
                    Button(
                      size: ButtonSize.sm,
                      onPressed: () {},
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical4xl,
            Text(
              'With Dividers',
              style: AppTheme.titleLarge.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: AppTheme.fontWeightSemiBold,
              ),
            ),
            AppTheme.gapVerticalMd,
            Text(
              'Clear visual separation between sections',
              style: AppTheme.bodyMedium.copyWith(
                color: AppTheme.textTertiary,
              ),
            ),
            AppTheme.gapVerticalLg,
            CNCard(
              showDividers: true,
              header: CardHeader(
                title: CardTitle('Card With Dividers'),
                description: CardDescription(
                  'Each section is clearly separated.',
                ),
              ),
              content: CardContent(
                child: Text(
                  'Dividers help distinguish between different parts of the card, improving scannability.',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
              footer: CardFooter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      variant: ButtonVariant.outline,
                      size: ButtonSize.sm,
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                    AppTheme.gapHorizontalMd,
                    Button(
                      size: ButtonSize.sm,
                      onPressed: () {},
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              showDividers: true,
              header: CardHeader(
                title: CardTitle('Form Card'),
                description: CardDescription(
                  'Dividers work well for form-like layouts',
                ),
              ),
              content: CardContent(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: AppTheme.labelSmall.copyWith(
                        color: AppTheme.textTertiary,
                        fontWeight: AppTheme.fontWeightMedium,
                      ),
                    ),
                    AppTheme.gapVerticalMd,
                    _buildSettingsRow('Enable notifications', true),
                    AppTheme.gapVerticalMd,
                    _buildSettingsRow('Dark mode', false),
                    AppTheme.gapVerticalMd,
                    _buildSettingsRow('Auto-save', true),
                  ],
                ),
              ),
              footer: CardFooter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      variant: ButtonVariant.ghost,
                      size: ButtonSize.sm,
                      onPressed: () {},
                      child: const Text('Reset'),
                    ),
                    Button(
                      size: ButtonSize.sm,
                      onPressed: () {},
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            CNCard(
              showDividers: true,
              header: CardHeader(
                title: CardTitle('Data Card'),
                description: CardDescription(
                  'Useful for displaying structured information',
                ),
              ),
              content: CardContent(
                child: Column(
                  children: [
                    _buildDataRow('Status', 'Active', AppTheme.success),
                    AppTheme.gapVerticalMd,
                    _buildDataRow('Members', '1,234', AppTheme.primary),
                    AppTheme.gapVerticalMd,
                    _buildDataRow('Created', 'Jan 15, 2024', AppTheme.textSecondary),
                  ],
                ),
              ),
              footer: CardFooter(
                child: Text(
                  'Last updated: 2 hours ago',
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.textTertiary,
                  ),
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            Container(
              padding: AppTheme.paddingLg,
              decoration: BoxDecoration(
                color: AppTheme.warning.withValues(alpha: 0.1),
                border: Border.all(color: AppTheme.warning.withValues(alpha: 0.3)),
                borderRadius: AppTheme.borderRadiusLg,
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: AppTheme.warning, size: 20),
                  AppTheme.gapHorizontalMd,
                  Expanded(
                    child: Text(
                      'Use dividers when you want clear visual hierarchy between sections. Skip them for a more unified look.',
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

  Widget _buildSettingsRow(String label, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textPrimary,
          ),
        ),
        Switch(
          value: value,
          onChanged: null,
          activeTrackColor: AppTheme.primary,
        ),
      ],
    );
  }

  Widget _buildDataRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTheme.bodyMedium.copyWith(
            color: AppTheme.textTertiary,
          ),
        ),
        Text(
          value,
          style: AppTheme.bodyMedium.copyWith(
            color: valueColor,
            fontWeight: AppTheme.fontWeightSemiBold,
          ),
        ),
      ],
    );
  }
}
