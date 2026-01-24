import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/accordion.dart';

/// Preview for accordion with disabled items.
class AccordionDisabledPreview extends StatelessWidget {
  const AccordionDisabledPreview({super.key});

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
                'Some items cannot be expanded',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  color: AppTheme.textSecondary,
                ),
              ),
              AppTheme.gapVertical2xl,
              Accordion(
                items: const [
                  AccordionItem(
                    title: 'Available Feature',
                    content: Text(
                      'This feature is available and can be expanded to view more details.',
                    ),
                  ),
                  AccordionItem(
                    title: 'Premium Feature (Locked)',
                    content: Text(
                      'This content is locked for premium users only.',
                    ),
                    disabled: true,
                  ),
                  AccordionItem(
                    title: 'Another Available Feature',
                    content: Text(
                      'This is another feature that is available to all users.',
                    ),
                  ),
                  AccordionItem(
                    title: 'Coming Soon',
                    content: Text(
                      'This feature is coming soon and is currently disabled.',
                    ),
                    disabled: true,
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
