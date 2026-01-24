import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/alert.dart';

/// Preview for basic alerts.
class AlertBasicPreview extends StatelessWidget {
  const AlertBasicPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Alert(
                title: 'Heads up!',
                description:
                    'You can add components to your app using the cli.',
              ),
              AppTheme.gapVertical2xl,
              const Alert(
                title: 'Note',
                description:
                    'This is a simple informational alert to notify users about something important.',
              ),
              AppTheme.gapVertical2xl,
              const Alert(
                description:
                    'You can also create alerts with only a description, without a title.',
              ),
              AppTheme.gapVertical2xl,
              const Alert(title: 'Title Only Alert'),
            ],
          ),
        ),
      ),
    );
  }
}
