import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/button.dart';

/// Preview widget showing bottom sheet with header variations
class BottomSheetHeaderPreview extends StatelessWidget {
  const BottomSheetHeaderPreview({super.key});

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
              Button(
                onPressed: () {
                  showAppBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BottomSheetHeader(
                          title: BottomSheetTitle('With Title Only'),
                        ),
                        BottomSheetContent(
                          child: Text(
                            'This bottom sheet has only a title in the header.',
                            style: TextStyle(color: AppTheme.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Title Only'),
              ),
              AppTheme.gapLg,
              Button(
                onPressed: () {
                  showAppBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BottomSheetHeader(
                          title: BottomSheetTitle('Complete Header'),
                          description: BottomSheetDescription(
                            'This header includes both a title and a description to provide more context.',
                          ),
                        ),
                        BottomSheetContent(
                          child: Text(
                            'The header above has both title and description for better clarity.',
                            style: TextStyle(color: AppTheme.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                variant: ButtonVariant.secondary,
                child: const Text('With Title & Description'),
              ),
              AppTheme.gapLg,
              Button(
                onPressed: () {
                  showAppBottomSheet(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BottomSheetHeader(
                          title: BottomSheetTitle('With Close Button'),
                          description: BottomSheetDescription(
                            'This header includes a close button for easy dismissal.',
                          ),
                          showCloseButton: true,
                        ),
                        BottomSheetContent(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'You can close this sheet by:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                              AppTheme.gapSm,
                              Text(
                                '• Tapping the close button (X) in the header',
                                style: TextStyle(color: AppTheme.textSecondary),
                              ),
                              Text(
                                '• Dragging the sheet down',
                                style: TextStyle(color: AppTheme.textSecondary),
                              ),
                              Text(
                                '• Tapping outside the sheet',
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
                child: const Text('With Close Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
