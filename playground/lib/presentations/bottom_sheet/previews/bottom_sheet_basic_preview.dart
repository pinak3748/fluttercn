import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/button.dart';

/// Preview widget showing basic bottom sheet
class BottomSheetBasicPreview extends StatelessWidget {
  const BottomSheetBasicPreview({super.key});

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
                    builder: (context) => BottomSheetContent(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Simple Bottom Sheet',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          AppTheme.gapMd,
                          Text(
                            'This is a basic bottom sheet with minimal content. It demonstrates the simplest use case of the bottom sheet component.',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                          AppTheme.gap2xl,
                          Button(
                            onPressed: () => Navigator.of(context).pop(),
                            fullWidth: true,
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text('Show Basic Bottom Sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
