import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/accordion.dart';

/// Preview for accordion with custom styling.
class AccordionCustomPreview extends StatelessWidget {
  const AccordionCustomPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Custom Icon Colors',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeLg,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              Accordion(
                collapsedIconColor: AppTheme.textTertiary,
                expandedIconColor: AppTheme.success,
                items: const [
                  AccordionItem(
                    title: 'Success themed accordion',
                    content: Text(
                      'The expanded icon turns green to indicate success state.',
                    ),
                  ),
                  AccordionItem(
                    title: 'Another item',
                    content: Text(
                      'Notice how the icon color changes when expanded.',
                    ),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              Text(
                'Custom Divider Color',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeLg,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              Accordion(
                dividerColor: AppTheme.info.withValues(alpha: 0.3),
                expandedIconColor: AppTheme.info,
                items: const [
                  AccordionItem(
                    title: 'Info themed dividers',
                    content: Text(
                      'The dividers use a blue tint to match the info color scheme.',
                    ),
                  ),
                  AccordionItem(
                    title: 'Consistent theming',
                    content: Text(
                      'Both the dividers and icons follow the same color theme.',
                    ),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              Text(
                'Rich Content',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeLg,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              Accordion(
                allowMultiple: true,
                items: [
                  AccordionItem(
                    title: 'With Custom Widget Content',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('You can include any widget as content:'),
                        AppTheme.gapVerticalMd,
                        Container(
                          padding: AppTheme.paddingMd,
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceVariant,
                            borderRadius: AppTheme.borderRadiusMd,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.lightbulb_outline,
                                color: AppTheme.warning,
                                size: 20,
                              ),
                              SizedBox(width: AppTheme.spaceSm),
                              Expanded(
                                child: Text(
                                  'Pro tip: Use rich content to create informative accordions!',
                                  style: TextStyle(
                                    fontSize: AppTheme.fontSizeSm,
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
                  AccordionItem(
                    title: 'With Action Buttons',
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Include interactive elements in your accordion content.',
                        ),
                        AppTheme.gapVerticalMd,
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Learn More'),
                            ),
                            SizedBox(width: AppTheme.spaceSm),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Get Started'),
                            ),
                          ],
                        ),
                      ],
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
