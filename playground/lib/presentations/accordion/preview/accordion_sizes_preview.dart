import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/accordion.dart';

/// Preview for the three accordion sizes.
class AccordionSizesPreview extends StatelessWidget {
  const AccordionSizesPreview({super.key});

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
                'Small',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeLg,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              Accordion(
                size: AccordionSize.sm,
                items: const [
                  AccordionItem(
                    title: 'Small accordion item 1',
                    content: Text('Content for the small accordion.'),
                  ),
                  AccordionItem(
                    title: 'Small accordion item 2',
                    content: Text('Another content item.'),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              Text(
                'Medium (Default)',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeLg,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              Accordion(
                size: AccordionSize.md,
                items: const [
                  AccordionItem(
                    title: 'Medium accordion item 1',
                    content: Text('Content for the medium accordion.'),
                  ),
                  AccordionItem(
                    title: 'Medium accordion item 2',
                    content: Text('Another content item.'),
                  ),
                ],
              ),
              AppTheme.gapVertical3xl,
              Text(
                'Large',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeLg,
                  fontWeight: AppTheme.fontWeightSemiBold,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapVerticalMd,
              Accordion(
                size: AccordionSize.lg,
                items: const [
                  AccordionItem(
                    title: 'Large accordion item 1',
                    content: Text('Content for the large accordion.'),
                  ),
                  AccordionItem(
                    title: 'Large accordion item 2',
                    content: Text('Another content item.'),
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
