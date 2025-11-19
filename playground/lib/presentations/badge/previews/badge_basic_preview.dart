import 'package:flutter/material.dart' hide Badge;

import '../../../config/theme.dart';
import '../../../widgets/badge.dart';

/// Preview for the basic badge usage.
class BadgeBasicPreview extends StatelessWidget {
  const BadgeBasicPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Container(
          padding: AppTheme.padding2xl,
          alignment: Alignment.center,
          child: const Badge(label: 'New'),
        ),
      ),
    );
  }
}
