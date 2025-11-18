import 'package:flutter/material.dart';

import '../../../widgets/avatar.dart';
import '../../../config/theme.dart';

class AvatarSizesShowcase extends StatelessWidget {
  const AvatarSizesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Sizes'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Avatar Sizes',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Avatars come in multiple sizes from XS to 2XL',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              Wrap(
                spacing: 32,
                runSpacing: 32,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  _buildSizeExample('XS', AvatarSize.xs, 'John Doe'),
                  _buildSizeExample('SM', AvatarSize.sm, 'Jane Smith'),
                  _buildSizeExample('MD', AvatarSize.md, 'Alice Bob'),
                  _buildSizeExample('LG', AvatarSize.lg, 'Charlie Davis'),
                  _buildSizeExample('XL', AvatarSize.xl, 'Emma Wilson'),
                  _buildSizeExample('2XL', AvatarSize.xl2, 'Frank Miller'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeExample(String label, AvatarSize size, String name) {
    return Column(
      children: [
        Avatar(
          size: size,
          fallbackName: name,
        ),
        AppTheme.gapVerticalMd,
        Text(
          label,
          style: AppTheme.labelLarge.copyWith(
            color: AppTheme.textSecondary,
            fontWeight: AppTheme.fontWeightMedium,
          ),
        ),
      ],
    );
  }
}
