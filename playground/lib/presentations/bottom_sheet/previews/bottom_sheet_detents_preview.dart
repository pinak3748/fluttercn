import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/button.dart';

/// Preview widget showing different bottom sheet sizes (detents)
class BottomSheetDetentsPreview extends StatelessWidget {
  const BottomSheetDetentsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bottom Sheet Sizes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              AppTheme.gapMd,
              Text(
                'Bottom sheets can be displayed at different heights to accommodate various content needs.',
                style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
                textAlign: TextAlign.center,
              ),
              AppTheme.gap3xl,
              Button(
                onPressed: () {
                  showAppBottomSheet(
                    context: context,
                    size: BottomSheetSize.sm,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BottomSheetHeader(
                          title: BottomSheetTitle('Small (30%)'),
                          description: BottomSheetDescription(
                            'Perfect for quick actions or simple confirmations',
                          ),
                        ),
                        BottomSheetContent(
                          child: Text(
                            'This bottom sheet takes up approximately 30% of the screen height.',
                            style: TextStyle(color: AppTheme.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                fullWidth: true,
                child: const Text('Small (30%)'),
              ),
              AppTheme.gapMd,
              Button(
                onPressed: () {
                  showAppBottomSheet(
                    context: context,
                    size: BottomSheetSize.md,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BottomSheetHeader(
                          title: BottomSheetTitle('Medium (50%)'),
                          description: BottomSheetDescription(
                            'Ideal for forms or content with moderate length',
                          ),
                        ),
                        BottomSheetContent(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'This is the default size for bottom sheets.',
                                style: TextStyle(color: AppTheme.textSecondary),
                              ),
                              AppTheme.gapMd,
                              Text(
                                'It takes up approximately 50% of the screen height, providing a good balance between content visibility and context.',
                                style: TextStyle(color: AppTheme.textSecondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                variant: ButtonVariant.secondary,
                fullWidth: true,
                child: const Text('Medium (50%) - Default'),
              ),
              AppTheme.gapMd,
              Button(
                onPressed: () {
                  showAppBottomSheet(
                    context: context,
                    size: BottomSheetSize.lg,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BottomSheetHeader(
                          title: BottomSheetTitle('Large (75%)'),
                          description: BottomSheetDescription(
                            'Great for detailed content or longer forms',
                          ),
                        ),
                        BottomSheetContent(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'This bottom sheet takes up approximately 75% of the screen height.',
                                style: TextStyle(color: AppTheme.textSecondary),
                              ),
                              AppTheme.gapMd,
                              Text(
                                'Use this size when you need to display more content while still maintaining some visual context of the screen behind.',
                                style: TextStyle(color: AppTheme.textSecondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                variant: ButtonVariant.outline,
                fullWidth: true,
                child: const Text('Large (75%)'),
              ),
              AppTheme.gapMd,
              Button(
                onPressed: () {
                  showAppBottomSheet(
                    context: context,
                    size: BottomSheetSize.full,
                    isScrollControlled: true,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BottomSheetHeader(
                          title: BottomSheetTitle('Full Height (95%)'),
                          description: BottomSheetDescription(
                            'Nearly full-screen for complex content or workflows',
                          ),
                          showCloseButton: true,
                        ),
                        Expanded(
                          child: BottomSheetContent(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'This bottom sheet takes up approximately 95% of the screen height.',
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                AppTheme.gapMd,
                                Text(
                                  'Full-height bottom sheets are perfect for:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                AppTheme.gapSm,
                                Text(
                                  '• Multi-step forms',
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                Text(
                                  '• Detailed content views',
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                Text(
                                  '• Complex workflows',
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                                Text(
                                  '• Settings or configuration panels',
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                variant: ButtonVariant.ghost,
                fullWidth: true,
                child: const Text('Full Height (95%)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
