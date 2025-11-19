import 'package:flutter/material.dart' hide Card;

import '../../../config/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';

/// Preview widget for the "Card with Footer" documentation section.
class CardBasicPreview extends StatelessWidget {
  const CardBasicPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Card(
            header: const CardHeader(
              title: CardTitle('Complete Card'),
              description: CardDescription('With all sections'),
            ),
            content: CardContent(
              child: Text(
                'Use the content slot for your main information or body copy.',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            ),
            footer: CardFooter(
              child: Row(
                children: [
                  Button(onPressed: () {}, child: const Text('Primary Action')),
                  AppTheme.gapHorizontalSm,
                  Button(
                    variant: ButtonVariant.ghost,
                    onPressed: () {},
                    child: const Text('Secondary'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
