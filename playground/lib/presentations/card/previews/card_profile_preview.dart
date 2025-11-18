import 'package:flutter/material.dart' hide Card;

import '../../../config/theme.dart';
import '../../../widgets/button.dart';
import '../../../widgets/card.dart';

/// Preview widget for the "Profile Card" documentation example.
class CardProfilePreview extends StatelessWidget {
  const CardProfilePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Card(
            header: const CardHeader(
              title: CardTitle('John Doe'),
              description: CardDescription('Software Engineer'),
            ),
            content: CardContent(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Email: john@example.com'),
                  AppTheme.gapSm,
                  const Text('Location: San Francisco, CA'),
                  AppTheme.gapSm,
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text('Top-rated mentor'),
                    ],
                  ),
                ],
              ),
            ),
            footer: CardFooter(
              child: Button(
                onPressed: () {},
                child: const Text('View Profile'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
