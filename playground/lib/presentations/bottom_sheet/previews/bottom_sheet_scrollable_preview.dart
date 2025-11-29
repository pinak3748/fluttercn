import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/button.dart';

/// Preview widget showing scrollable bottom sheet
class BottomSheetScrollablePreview extends StatelessWidget {
  const BottomSheetScrollablePreview({super.key});

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
                    size: BottomSheetSize.lg,
                    isScrollControlled: true,
                    builder: (context) => Column(
                      children: [
                        BottomSheetHeader(
                          title: BottomSheetTitle('Scrollable Content'),
                          description: BottomSheetDescription(
                            'This sheet contains long content that can be scrolled',
                          ),
                          showCloseButton: true,
                        ),
                        Expanded(
                          child: BottomSheetContent(
                            scrollable: true,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Terms and Conditions',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                AppTheme.gapLg,
                                Text(
                                  '1. Introduction',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                AppTheme.gapSm,
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                                AppTheme.gapLg,
                                Text(
                                  '2. User Responsibilities',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                AppTheme.gapSm,
                                Text(
                                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                                AppTheme.gapLg,
                                Text(
                                  '3. Privacy Policy',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                AppTheme.gapSm,
                                Text(
                                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                                AppTheme.gapLg,
                                Text(
                                  '4. Data Collection',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                AppTheme.gapSm,
                                Text(
                                  'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                                AppTheme.gapLg,
                                Text(
                                  '5. Termination',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                AppTheme.gapSm,
                                Text(
                                  'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                                AppTheme.gapLg,
                                Text(
                                  '6. Changes to Terms',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.textPrimary,
                                  ),
                                ),
                                AppTheme.gapSm,
                                Text(
                                  'Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        BottomSheetFooter(
                          child: Row(
                            children: [
                              Expanded(
                                child: Button(
                                  onPressed: () => Navigator.of(context).pop(),
                                  variant: ButtonVariant.outline,
                                  child: const Text('Decline'),
                                ),
                              ),
                              AppTheme.gapHorizontalMd,
                              Expanded(
                                child: Button(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Accept'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text('Show Scrollable Content'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
