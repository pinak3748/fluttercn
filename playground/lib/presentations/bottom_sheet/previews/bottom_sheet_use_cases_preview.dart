import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/bottom_sheet.dart';
import '../../../widgets/button.dart';

/// Preview widget showing real-world bottom sheet use cases
class BottomSheetUseCasesPreview extends StatelessWidget {
  const BottomSheetUseCasesPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Padding(
        padding: AppTheme.padding2xl,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Real-World Examples',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
              ),
            ),
            AppTheme.gapMd,
            Text(
              'Common use cases for bottom sheets in real applications.',
              style: TextStyle(fontSize: 14, color: AppTheme.textSecondary),
            ),
            AppTheme.gap3xl,
            Button(
              onPressed: () => _showShareSheet(context),
              fullWidth: true,
              child: const Text('Share Sheet'),
            ),
            AppTheme.gapMd,
            Button(
              onPressed: () => _showActionsSheet(context),
              variant: ButtonVariant.secondary,
              fullWidth: true,
              child: const Text('Actions Menu'),
            ),
            AppTheme.gapMd,
            Button(
              onPressed: () => _showFilterSheet(context),
              variant: ButtonVariant.outline,
              fullWidth: true,
              child: const Text('Filter Options'),
            ),
            AppTheme.gapMd,
            Button(
              onPressed: () => _showNotificationsSheet(context),
              variant: ButtonVariant.ghost,
              fullWidth: true,
              child: const Text('Notifications'),
            ),
          ],
        ),
      ),
    );
  }

  void _showShareSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      size: BottomSheetSize.sm,
      isScrollControlled: true,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetHeader(
            title: BottomSheetTitle('Share'),
            description: BottomSheetDescription(
              'Share this content with others',
            ),
          ),
          Flexible(
            child: BottomSheetContent(
              scrollable: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ShareOption(
                    icon: Icons.copy,
                    label: 'Copy Link',
                    onTap: () {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Link copied to clipboard'),
                          backgroundColor: AppTheme.success,
                        ),
                      );
                    },
                  ),
                  AppTheme.gapSm,
                  _ShareOption(
                    icon: Icons.email,
                    label: 'Email',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  AppTheme.gapSm,
                  _ShareOption(
                    icon: Icons.message,
                    label: 'Message',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  AppTheme.gapSm,
                  _ShareOption(
                    icon: Icons.share,
                    label: 'More Options',
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showActionsSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      size: BottomSheetSize.sm,
      isScrollControlled: true,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: BottomSheetContent(
              scrollable: true,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _ActionItem(
                    icon: Icons.edit,
                    label: 'Edit',
                    color: AppTheme.textPrimary,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Divider(height: 1, color: AppTheme.border),
                  _ActionItem(
                    icon: Icons.content_copy,
                    label: 'Duplicate',
                    color: AppTheme.textPrimary,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Divider(height: 1, color: AppTheme.border),
                  _ActionItem(
                    icon: Icons.archive,
                    label: 'Archive',
                    color: AppTheme.textPrimary,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  Divider(height: 1, color: AppTheme.border),
                  _ActionItem(
                    icon: Icons.delete,
                    label: 'Delete',
                    color: AppTheme.error,
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      size: BottomSheetSize.md,
      isScrollControlled: true,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetHeader(
            title: BottomSheetTitle('Filter & Sort'),
            description: BottomSheetDescription('Customize your view'),
            showCloseButton: true,
          ),
          Flexible(
            child: BottomSheetContent(
              scrollable: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sort By',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  AppTheme.gapSm,
                  _FilterOption(label: 'Most Recent', isSelected: true),
                  _FilterOption(label: 'Most Popular', isSelected: false),
                  _FilterOption(label: 'Alphabetical', isSelected: false),
                  AppTheme.gapLg,
                  Text(
                    'Filter By Status',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  AppTheme.gapSm,
                  _FilterOption(label: 'All', isSelected: true),
                  _FilterOption(label: 'Active', isSelected: false),
                  _FilterOption(label: 'Completed', isSelected: false),
                  _FilterOption(label: 'Archived', isSelected: false),
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
                    child: const Text('Reset'),
                  ),
                ),
                AppTheme.gapHorizontalMd,
                Expanded(
                  child: Button(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Apply'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showNotificationsSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      size: BottomSheetSize.lg,
      isScrollControlled: true,
      builder: (context) => Column(
        children: [
          BottomSheetHeader(
            title: BottomSheetTitle('Notifications'),
            showCloseButton: true,
          ),
          Expanded(
            child: BottomSheetContent(
              scrollable: true,
              child: Column(
                children: [
                  _NotificationItem(
                    icon: Icons.favorite,
                    iconColor: AppTheme.error,
                    title: 'New like on your post',
                    subtitle: 'John liked your recent post',
                    time: '2m ago',
                    isRead: false,
                  ),
                  AppTheme.gapMd,
                  _NotificationItem(
                    icon: Icons.comment,
                    iconColor: AppTheme.info,
                    title: 'New comment',
                    subtitle: 'Sarah commented: "Great work!"',
                    time: '15m ago',
                    isRead: false,
                  ),
                  AppTheme.gapMd,
                  _NotificationItem(
                    icon: Icons.person_add,
                    iconColor: AppTheme.success,
                    title: 'New follower',
                    subtitle: 'Mike started following you',
                    time: '1h ago',
                    isRead: true,
                  ),
                  AppTheme.gapMd,
                  _NotificationItem(
                    icon: Icons.share,
                    iconColor: AppTheme.warning,
                    title: 'Your post was shared',
                    subtitle: 'Emma shared your post',
                    time: '3h ago',
                    isRead: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShareOption extends StatelessWidget {
  const _ShareOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: Container(
        padding: AppTheme.paddingMd,
        decoration: BoxDecoration(
          color: AppTheme.surfaceVariant,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              child: Icon(icon, size: 24, color: AppTheme.textPrimary),
            ),
            AppTheme.gapHorizontalMd,
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: AppTheme.paddingLg,
        child: Row(
          children: [
            Icon(icon, size: 24, color: color),
            AppTheme.gapHorizontalMd,
            Text(label, style: TextStyle(fontSize: 16, color: color)),
          ],
        ),
      ),
    );
  }
}

class _FilterOption extends StatelessWidget {
  const _FilterOption({required this.label, required this.isSelected});

  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.paddingMd,
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.surfaceVariant : Colors.transparent,
        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        border: Border.all(
          color: isSelected ? AppTheme.border : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isSelected
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            size: 20,
            color: isSelected ? AppTheme.primary : AppTheme.textTertiary,
          ),
          AppTheme.gapHorizontalSm,
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? AppTheme.textPrimary : AppTheme.textSecondary,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.isRead,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String time;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.paddingMd,
      decoration: BoxDecoration(
        color: isRead
            ? Colors.transparent
            : AppTheme.surfaceVariant.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(
          color: isRead ? Colors.transparent : AppTheme.border,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          AppTheme.gapHorizontalMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isRead ? FontWeight.w400 : FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13, color: AppTheme.textSecondary),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: AppTheme.textTertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
