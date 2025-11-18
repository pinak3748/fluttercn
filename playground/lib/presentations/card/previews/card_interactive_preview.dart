import 'package:flutter/material.dart' hide Card;

import '../../../config/theme.dart';
import '../../../widgets/card.dart';

/// Preview widget for the "Interactive Card" documentation section.
class CardInteractivePreview extends StatelessWidget {
  const CardInteractivePreview({super.key});

  void _handleTap(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Card tapped'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Card(
            onTap: () => _handleTap(context),
            header: const CardHeader(
              title: CardTitle('Clickable Card'),
              description: CardDescription('Tap to interact'),
            ),
            content: CardContent(
              child: Text(
                'Cards with an onTap callback get hover & press animations.',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
