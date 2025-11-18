import 'package:flutter/material.dart';

import '../../../widgets/tooltip.dart';
import '../../../widgets/button.dart';
import '../../../config/theme.dart';

class TooltipContentShowcase extends StatelessWidget {
  const TooltipContentShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tooltip Content'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tooltip Content',
                style: AppTheme.displaySmall.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: AppTheme.fontWeightBold,
                ),
              ),
              AppTheme.gapVerticalMd,
              Text(
                'Simple text or rich content',
                style: AppTheme.bodyLarge.copyWith(
                  color: AppTheme.textTertiary,
                ),
                textAlign: TextAlign.center,
              ),
              AppTheme.gapVertical4xl,
              _buildExample(
                'Simple Text',
                'Basic tooltip with a message',
                CNTooltip(
                  message: 'This is a simple tooltip',
                  child: Button(
                    variant: ButtonVariant.outline,
                    icon: const Icon(Icons.info),
                    onPressed: () {},
                    child: const Text('Info'),
                  ),
                ),
              ),
              AppTheme.gapVertical2xl,
              _buildExample(
                'Rich Content',
                'Tooltip with custom widget content',
                CNTooltip(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.lightbulb, size: 16, color: Colors.white),
                          SizedBox(width: 8),
                          Text('Pro Tip', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('You can use rich content\nin tooltips for more context'),
                    ],
                  ),
                  child: Button(
                    variant: ButtonVariant.outline,
                    icon: const Icon(Icons.help),
                    onPressed: () {},
                    child: const Text('Help'),
                  ),
                ),
              ),
              AppTheme.gapVertical2xl,
              _buildExample(
                'Without Arrow',
                'Tooltip with no arrow pointer',
                CNTooltip(
                  message: 'Tooltip without arrow',
                  showArrow: false,
                  child: Button(
                    variant: ButtonVariant.outline,
                    onPressed: () {},
                    child: const Text('No Arrow'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExample(String title, String description, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: AppTheme.borderRadiusLg,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTheme.titleMedium.copyWith(
              color: AppTheme.textPrimary,
              fontWeight: AppTheme.fontWeightSemiBold,
            ),
          ),
          AppTheme.gapVerticalXs,
          Text(
            description,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.textTertiary,
            ),
          ),
          AppTheme.gapVerticalMd,
          content,
        ],
      ),
    );
  }
}
