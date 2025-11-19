import 'package:flutter/material.dart' hide Card;

import '../../../config/theme.dart';
import '../../../widgets/card.dart';

/// Preview widget for the "Card with Dividers" documentation section.
class CardDividersPreview extends StatelessWidget {
  const CardDividersPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Card(
            showDividers: true,
            header: const CardHeader(
              title: CardTitle('Sectioned Card'),
              description: CardDescription('With dividers'),
            ),
            content: CardContent(
              child: Text(
                'Dividers create clear separation for long-form content.',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            ),
            footer: const CardFooter(child: Text('Footer section')),
          ),
        ),
      ),
    );
  }
}
