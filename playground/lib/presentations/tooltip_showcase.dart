import 'package:flutter/material.dart';

import '../widgets/tooltip.dart';
import '../widgets/button.dart';
import '../widgets/badge.dart';
import '../config/theme.dart';

class TooltipShowcase extends StatefulWidget {
  const TooltipShowcase({super.key});

  @override
  State<TooltipShowcase> createState() => _TooltipShowcaseState();
}

class _TooltipShowcaseState extends State<TooltipShowcase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tooltip Components')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              'Basic Tooltips',
              'Hover over the icons to see tooltips',
              Center(
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    CNTooltip(
                      message: 'Edit',
                      child: Icon(
                        Icons.edit,
                        size: 32,
                        color: AppTheme.primary,
                      ),
                    ),
                    CNTooltip(
                      message: 'Delete',
                      child: Icon(
                        Icons.delete,
                        size: 32,
                        color: AppTheme.error,
                      ),
                    ),
                    CNTooltip(
                      message: 'Settings',
                      child: Icon(
                        Icons.settings,
                        size: 32,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    CNTooltip(
                      message: 'Share',
                      child: Icon(Icons.share, size: 32, color: AppTheme.info),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Tooltip Positions',
              'Tooltips can appear in different positions',
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CNTooltip(
                      message: 'Top tooltip',
                      position: TooltipPosition.top,
                      child: Container(
                        padding: AppTheme.paddingMd,
                        decoration: BoxDecoration(
                          color: AppTheme.secondary,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusMd,
                          ),
                        ),
                        child: Text('Hover - Top'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CNTooltip(
                          message: 'Left tooltip',
                          position: TooltipPosition.left,
                          child: Container(
                            padding: AppTheme.paddingMd,
                            decoration: BoxDecoration(
                              color: AppTheme.secondary,
                              borderRadius: BorderRadius.circular(
                                AppTheme.radiusMd,
                              ),
                            ),
                            child: const Text('Hover - Left'),
                          ),
                        ),
                        const SizedBox(width: 48),
                        CNTooltip(
                          message: 'Right tooltip',
                          position: TooltipPosition.right,
                          child: Container(
                            padding: AppTheme.paddingMd,
                            decoration: BoxDecoration(
                              color: AppTheme.secondary,
                              borderRadius: BorderRadius.circular(
                                AppTheme.radiusMd,
                              ),
                            ),
                            child: const Text('Hover - Right'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CNTooltip(
                      message: 'Bottom tooltip',
                      position: TooltipPosition.bottom,
                      child: Container(
                        padding: AppTheme.paddingMd,
                        decoration: BoxDecoration(
                          color: AppTheme.secondary,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusMd,
                          ),
                        ),
                        child: const Text('Hover - Bottom'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Trigger Modes',
              'Different ways to trigger tooltips',
              Center(
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    CNTooltip(
                      message: 'Hover to see this tooltip',
                      trigger: TooltipTrigger.hover,
                      child: Button(
                        variant: ButtonVariant.outline,
                        onPressed: () {},
                        child: const Text('Hover Me'),
                      ),
                    ),
                    CNTooltip(
                      message: 'Tap to see this tooltip',
                      trigger: TooltipTrigger.tap,
                      child: Button(
                        variant: ButtonVariant.secondary,
                        onPressed: () {},
                        child: const Text('Tap Me'),
                      ),
                    ),
                    CNTooltip(
                      message: 'Long press to see this tooltip',
                      trigger: TooltipTrigger.longPress,
                      child: Button(
                        variant: ButtonVariant.destructive,
                        onPressed: () {},
                        child: const Text('Long Press Me'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Tooltips with Rich Content',
              'Tooltips can contain complex widgets',
              Center(
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    CNTooltip(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Profile',
                            style: TextStyle(
                              fontWeight: AppTheme.fontWeightSemiBold,
                              color: AppTheme.textOnPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'John Doe',
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeXs,
                              color: AppTheme.textOnPrimary.withValues(
                                alpha: 0.8,
                              ),
                            ),
                          ),
                          Text(
                            'john@example.com',
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeXs,
                              color: AppTheme.textOnPrimary.withValues(
                                alpha: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      position: TooltipPosition.right,
                      child: const Icon(Icons.account_circle, size: 40),
                    ),
                    CNTooltip(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.info, size: 16, color: AppTheme.textOnPrimary),
                              const SizedBox(width: 6),
                              Text(
                                'Information',
                                style: TextStyle(
                                  fontWeight: AppTheme.fontWeightSemiBold,
                                  color: AppTheme.textOnPrimary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'This is a detailed explanation\nwith multiple lines of text.',
                            style: TextStyle(
                              fontSize: AppTheme.fontSizeXs,
                              color: AppTheme.textOnPrimary,
                            ),
                          ),
                        ],
                      ),
                      maxWidth: 250,
                      child: const Icon(Icons.help_outline, size: 32),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Tooltips without Arrows',
              'Clean tooltips without pointer arrows',
              Center(
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    CNTooltip(
                      message: 'No arrow top',
                      showArrow: false,
                      position: TooltipPosition.top,
                      child: Container(
                        padding: AppTheme.paddingSm,
                        decoration: BoxDecoration(
                          color: AppTheme.info,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusSm,
                          ),
                        ),
                        child: Icon(Icons.lightbulb, color: AppTheme.textOnPrimary),
                      ),
                    ),
                    CNTooltip(
                      message: 'No arrow bottom',
                      showArrow: false,
                      position: TooltipPosition.bottom,
                      child: Container(
                        padding: AppTheme.paddingSm,
                        decoration: BoxDecoration(
                          color: AppTheme.success,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusSm,
                          ),
                        ),
                        child: Icon(Icons.check_circle, color: AppTheme.textOnPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Custom Styling',
              'Tooltips with custom colors',
              Center(
                child: Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    CNTooltip(
                      message: 'Success tooltip',
                      backgroundColor: AppTheme.success,
                      child: Container(
                        padding: AppTheme.paddingSm,
                        decoration: BoxDecoration(
                          color: AppTheme.successLight,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusSm,
                          ),
                        ),
                        child: Icon(Icons.check, color: AppTheme.success),
                      ),
                    ),
                    CNTooltip(
                      message: 'Warning tooltip',
                      backgroundColor: AppTheme.warning,
                      child: Container(
                        padding: AppTheme.paddingSm,
                        decoration: BoxDecoration(
                          color: AppTheme.warningLight,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusSm,
                          ),
                        ),
                        child: Icon(Icons.warning, color: AppTheme.warning),
                      ),
                    ),
                    CNTooltip(
                      message: 'Error tooltip',
                      backgroundColor: AppTheme.error,
                      child: Container(
                        padding: AppTheme.paddingSm,
                        decoration: BoxDecoration(
                          color: AppTheme.errorLight,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusSm,
                          ),
                        ),
                        child: Icon(Icons.error, color: AppTheme.error),
                      ),
                    ),
                    CNTooltip(
                      message: 'Info tooltip',
                      backgroundColor: AppTheme.info,
                      child: Container(
                        padding: AppTheme.paddingSm,
                        decoration: BoxDecoration(
                          color: AppTheme.infoLight,
                          borderRadius: BorderRadius.circular(
                            AppTheme.radiusSm,
                          ),
                        ),
                        child: Icon(Icons.info, color: AppTheme.info),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppTheme.gapVertical3xl,
            _buildSection(
              'Real-world Examples',
              'Common tooltip use cases in applications',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExample(
                    'Action Buttons',
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CNTooltip(
                          message: 'Save changes',
                          child: Button(
                            variant: ButtonVariant.primary,
                            size: ButtonSize.icon,
                            onPressed: () {},
                            child: const Icon(Icons.save),
                          ),
                        ),
                        const SizedBox(width: 8),
                        CNTooltip(
                          message: 'Undo last action',
                          child: Button(
                            variant: ButtonVariant.ghost,
                            size: ButtonSize.icon,
                            onPressed: () {},
                            child: const Icon(Icons.undo),
                          ),
                        ),
                        const SizedBox(width: 8),
                        CNTooltip(
                          message: 'Redo last action',
                          child: Button(
                            variant: ButtonVariant.ghost,
                            size: ButtonSize.icon,
                            onPressed: () {},
                            child: const Icon(Icons.redo),
                          ),
                        ),
                        const SizedBox(width: 8),
                        CNTooltip(
                          message: 'Print document',
                          child: Button(
                            variant: ButtonVariant.outline,
                            size: ButtonSize.icon,
                            onPressed: () {},
                            child: const Icon(Icons.print),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'Notification Badge',
                    Center(
                      child: CNTooltip(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '5 new notifications',
                              style: TextStyle(
                                fontWeight: AppTheme.fontWeightSemiBold,
                                color: AppTheme.textOnPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '• New message from Sarah\n• Comment on your post\n• 3 new followers',
                              style: TextStyle(
                                fontSize: AppTheme.fontSizeXs,
                                color: AppTheme.textOnPrimary,
                              ),
                            ),
                          ],
                        ),
                        position: TooltipPosition.bottom,
                        maxWidth: 200,
                        trigger: TooltipTrigger.tap,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(
                              Icons.notifications,
                              size: 32,
                              color: AppTheme.textPrimary,
                            ),
                            const Positioned(
                              top: -4,
                              right: -4,
                              child: CountBadge(
                                count: 5,
                                variant: BadgeVariant.destructive,
                                size: BadgeSize.sm,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'Help Icons',
                    Wrap(
                      spacing: 24,
                      runSpacing: 16,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Username', style: AppTheme.labelMedium),
                            const SizedBox(width: 4),
                            CNTooltip(
                              message: 'Your unique username for login',
                              position: TooltipPosition.right,
                              child: Icon(
                                Icons.help_outline,
                                size: 16,
                                color: AppTheme.textTertiary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Email', style: AppTheme.labelMedium),
                            const SizedBox(width: 4),
                            CNTooltip(
                              message: 'We\'ll send a verification email',
                              position: TooltipPosition.right,
                              child: Icon(
                                Icons.help_outline,
                                size: 16,
                                color: AppTheme.textTertiary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AppTheme.gapVerticalLg,
                  _buildExample(
                    'Status Indicators',
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CNTooltip(
                          message: 'All systems operational',
                          backgroundColor: AppTheme.success,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppTheme.successLight,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.check, color: AppTheme.success),
                          ),
                        ),
                        const SizedBox(width: 16),
                        CNTooltip(
                          message: 'Maintenance in progress',
                          backgroundColor: AppTheme.warning,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppTheme.warningLight,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.build, color: AppTheme.warning),
                          ),
                        ),
                        const SizedBox(width: 16),
                        CNTooltip(
                          message: 'Service unavailable',
                          backgroundColor: AppTheme.error,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppTheme.errorLight,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.close, color: AppTheme.error),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.headlineSmall.copyWith(
            color: AppTheme.textPrimary,
            fontWeight: AppTheme.fontWeightSemiBold,
          ),
        ),
        AppTheme.gapVerticalSm,
        Text(
          description,
          style: AppTheme.bodyMedium.copyWith(color: AppTheme.textTertiary),
        ),
        AppTheme.gapVerticalLg,
        content,
      ],
    );
  }

  Widget _buildExample(String title, Widget content) {
    return Container(
      width: double.infinity,
      padding: AppTheme.paddingLg,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.border),
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.labelMedium.copyWith(
              color: AppTheme.textTertiary,
              fontWeight: AppTheme.fontWeightMedium,
            ),
          ),
          AppTheme.gapVerticalMd,
          content,
        ],
      ),
    );
  }
}
