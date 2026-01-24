import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/accordion.dart';

/// Preview for accordion items with leading icons.
class AccordionWithIconPreview extends StatelessWidget {
  const AccordionWithIconPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: SingleChildScrollView(
          padding: AppTheme.padding2xl,
          child: Accordion(
            items: [
              AccordionItem(
                leading: Icon(
                  Icons.person_outline,
                  size: 20,
                  color: AppTheme.textSecondary,
                ),
                title: 'Profile Settings',
                content: const Text(
                  'Update your profile information, avatar, display name, and personal preferences.',
                ),
              ),
              AccordionItem(
                leading: Icon(
                  Icons.security_outlined,
                  size: 20,
                  color: AppTheme.textSecondary,
                ),
                title: 'Security',
                content: const Text(
                  'Manage your password, two-factor authentication, and review login activity.',
                ),
              ),
              AccordionItem(
                leading: Icon(
                  Icons.notifications_outlined,
                  size: 20,
                  color: AppTheme.textSecondary,
                ),
                title: 'Notifications',
                content: const Text(
                  'Configure email notifications, push notifications, and in-app alerts.',
                ),
              ),
              AccordionItem(
                leading: Icon(
                  Icons.palette_outlined,
                  size: 20,
                  color: AppTheme.textSecondary,
                ),
                title: 'Appearance',
                content: const Text(
                  'Choose your preferred theme, color scheme, and display options.',
                ),
              ),
              AccordionItem(
                leading: Icon(
                  Icons.language_outlined,
                  size: 20,
                  color: AppTheme.textSecondary,
                ),
                title: 'Language & Region',
                content: const Text(
                  'Set your preferred language, timezone, and regional formatting preferences.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
