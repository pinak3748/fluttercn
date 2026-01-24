import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/accordion.dart';

/// Preview for a basic single-expansion accordion.
class AccordionBasicPreview extends StatelessWidget {
  const AccordionBasicPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Accordion(
            items: const [
              AccordionItem(
                title: 'Is it accessible?',
                content: Text(
                  'Yes. It adheres to the WAI-ARIA design pattern and supports keyboard navigation.',
                ),
              ),
              AccordionItem(
                title: 'Is it styled?',
                content: Text(
                  'Yes. It comes with default styles that match the other components\' aesthetic.',
                ),
              ),
              AccordionItem(
                title: 'Is it animated?',
                content: Text(
                  'Yes. It\'s animated by default, but you can disable it if you prefer.',
                ),
              ),
              AccordionItem(
                title: 'Can I customize it?',
                content: Text(
                  'Absolutely! You can customize colors, sizes, icons, and more to match your design system.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
