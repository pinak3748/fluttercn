import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/accordion.dart';

/// Preview for accordion with multiple expansion enabled.
class AccordionMultiplePreview extends StatelessWidget {
  const AccordionMultiplePreview({super.key});

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
                'Multiple items can be expanded simultaneously',
                style: TextStyle(
                  fontSize: AppTheme.fontSizeMd,
                  color: AppTheme.textSecondary,
                ),
              ),
              AppTheme.gapVertical2xl,
              Accordion(
                allowMultiple: true,
                initialExpandedIndexes: const [0],
                items: const [
                  AccordionItem(
                    title: 'Getting Started',
                    content: Text(
                      'Welcome to our platform! This section covers the basics of getting started, including account setup, initial configuration, and first steps.',
                    ),
                  ),
                  AccordionItem(
                    title: 'Account Settings',
                    content: Text(
                      'Manage your account preferences, security settings, notification preferences, and connected integrations from the settings panel.',
                    ),
                  ),
                  AccordionItem(
                    title: 'Billing & Payments',
                    content: Text(
                      'View your billing history, manage payment methods, download invoices, and update your subscription plan at any time.',
                    ),
                  ),
                  AccordionItem(
                    title: 'Support & Help',
                    content: Text(
                      'Need assistance? Contact our support team via email, chat, or browse our comprehensive knowledge base for answers.',
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
