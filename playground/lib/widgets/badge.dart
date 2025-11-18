import 'package:flutter/material.dart';

import '../config/theme.dart';
import 'button.dart' show IconPosition;

/// Badge variants similar to shadcn/ui
enum BadgeVariant {
  default_,
  secondary,
  destructive,
  outline,
  success,
  warning,
  info,
}

/// Badge sizes
enum BadgeSize { sm, md, lg }

/// A customizable badge component similar to shadcn/ui Badge
///
/// Badges are used to display small pieces of information like status,
/// notifications, tags, or labels.
///
/// Example:
/// ```dart
/// // Basic badge
/// Badge(label: 'New')
///
/// // Badge with variant
/// Badge(
///   label: 'Success',
///   variant: BadgeVariant.success,
/// )
///
/// // Badge with icon
/// Badge(
///   label: 'Verified',
///   icon: Icon(Icons.check, size: 12),
/// )
/// ```
class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.label,
    this.variant = BadgeVariant.default_,
    this.size = BadgeSize.md,
    this.icon,
    this.iconPosition = IconPosition.leading,
    this.showDot = false,
    this.onRemove,
    this.onTap,
  });

  /// Badge label text
  final String label;

  /// Badge variant (determines color scheme)
  final BadgeVariant variant;

  /// Badge size
  final BadgeSize size;

  /// Optional icon to display
  final Widget? icon;

  /// Icon position (leading or trailing)
  final IconPosition iconPosition;

  /// Whether to show a dot indicator instead of full background
  final bool showDot;

  /// Callback when remove button is tapped (shows X button if provided)
  final VoidCallback? onRemove;

  /// Callback when badge is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = _buildContent();

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_getBorderRadius()),
        child: content,
      );
    }

    return content;
  }

  Widget _buildContent() {
    return Container(
      padding: _getPadding(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        border: _getBorder(),
        borderRadius: BorderRadius.circular(_getBorderRadius()),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showDot) ...[
            Container(
              width: _getDotSize(),
              height: _getDotSize(),
              decoration: BoxDecoration(
                color: _getDotColor(),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: _getGapSize()),
          ],
          if (icon != null && iconPosition == IconPosition.leading) ...[
            IconTheme(
              data: IconThemeData(
                color: _getForegroundColor(),
                size: _getIconSize(),
              ),
              child: icon!,
            ),
            SizedBox(width: _getGapSize()),
          ],
          Text(
            label,
            style: TextStyle(
              color: _getForegroundColor(),
              fontSize: _getFontSize(),
              fontWeight: AppTheme.fontWeightMedium,
              height: 1,
            ),
          ),
          if (icon != null && iconPosition == IconPosition.trailing) ...[
            SizedBox(width: _getGapSize()),
            IconTheme(
              data: IconThemeData(
                color: _getForegroundColor(),
                size: _getIconSize(),
              ),
              child: icon!,
            ),
          ],
          if (onRemove != null) ...[
            SizedBox(width: _getGapSize()),
            GestureDetector(
              onTap: onRemove,
              child: Icon(
                Icons.close,
                size: _getIconSize(),
                color: _getForegroundColor(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  EdgeInsets _getPadding() {
    switch (size) {
      case BadgeSize.sm:
        return const EdgeInsets.symmetric(horizontal: 6, vertical: 2);
      case BadgeSize.md:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case BadgeSize.lg:
        return const EdgeInsets.symmetric(horizontal: 10, vertical: 6);
    }
  }

  double _getBorderRadius() {
    switch (size) {
      case BadgeSize.sm:
        return AppTheme.radiusSm;
      case BadgeSize.md:
        return AppTheme.radiusMd;
      case BadgeSize.lg:
        return AppTheme.radiusLg;
    }
  }

  double _getFontSize() {
    switch (size) {
      case BadgeSize.sm:
        return AppTheme.fontSizeXs;
      case BadgeSize.md:
        return AppTheme.fontSizeSm;
      case BadgeSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  double _getIconSize() {
    switch (size) {
      case BadgeSize.sm:
        return 10;
      case BadgeSize.md:
        return 12;
      case BadgeSize.lg:
        return 14;
    }
  }

  double _getDotSize() {
    switch (size) {
      case BadgeSize.sm:
        return 4;
      case BadgeSize.md:
        return 6;
      case BadgeSize.lg:
        return 8;
    }
  }

  double _getGapSize() {
    switch (size) {
      case BadgeSize.sm:
        return 4;
      case BadgeSize.md:
        return 4;
      case BadgeSize.lg:
        return 6;
    }
  }

  Color _getBackgroundColor() {
    if (showDot) {
      return Colors.transparent;
    }

    switch (variant) {
      case BadgeVariant.default_:
        return AppTheme.primary;
      case BadgeVariant.secondary:
        return AppTheme.secondary;
      case BadgeVariant.destructive:
        return AppTheme.error;
      case BadgeVariant.outline:
        return Colors.transparent;
      case BadgeVariant.success:
        return AppTheme.success;
      case BadgeVariant.warning:
        return AppTheme.warning;
      case BadgeVariant.info:
        return AppTheme.info;
    }
  }

  Color _getForegroundColor() {
    if (showDot) {
      return AppTheme.textPrimary;
    }

    switch (variant) {
      case BadgeVariant.default_:
        return AppTheme.textOnPrimary;
      case BadgeVariant.secondary:
        return AppTheme.textPrimary;
      case BadgeVariant.destructive:
        return AppTheme.white;
      case BadgeVariant.outline:
        return AppTheme.textPrimary;
      case BadgeVariant.success:
        return AppTheme.white;
      case BadgeVariant.warning:
        return AppTheme.white;
      case BadgeVariant.info:
        return AppTheme.white;
    }
  }

  Color _getDotColor() {
    switch (variant) {
      case BadgeVariant.default_:
        return AppTheme.primary;
      case BadgeVariant.secondary:
        return AppTheme.textTertiary;
      case BadgeVariant.destructive:
        return AppTheme.error;
      case BadgeVariant.outline:
        return AppTheme.textTertiary;
      case BadgeVariant.success:
        return AppTheme.success;
      case BadgeVariant.warning:
        return AppTheme.warning;
      case BadgeVariant.info:
        return AppTheme.info;
    }
  }

  Border? _getBorder() {
    if (variant == BadgeVariant.outline) {
      return Border.all(color: AppTheme.border, width: 1);
    }
    return null;
  }
}

/// Badge with a count number
///
/// Example:
/// ```dart
/// CountBadge(count: 5)
/// CountBadge(count: 99, max: 99)
/// ```
class CountBadge extends StatelessWidget {
  const CountBadge({
    super.key,
    required this.count,
    this.max,
    this.variant = BadgeVariant.default_,
    this.size = BadgeSize.sm,
    this.showZero = false,
  });

  /// The count to display
  final int count;

  /// Maximum count to display (shows max+ if exceeded)
  final int? max;

  /// Badge variant
  final BadgeVariant variant;

  /// Badge size
  final BadgeSize size;

  /// Whether to show the badge when count is 0
  final bool showZero;

  @override
  Widget build(BuildContext context) {
    if (count == 0 && !showZero) {
      return const SizedBox.shrink();
    }

    final displayCount = max != null && count > max!
        ? '$max+'
        : count.toString();

    return Badge(label: displayCount, variant: variant, size: size);
  }
}

/// Status badge with predefined colors and labels
///
/// Example:
/// ```dart
/// StatusBadge.online()
/// StatusBadge.offline()
/// StatusBadge.pending()
/// ```
class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.label,
    required this.variant,
    this.size = BadgeSize.sm,
    this.showDot = true,
  });

  const StatusBadge.online({super.key, this.size = BadgeSize.sm})
    : label = 'Online',
      variant = BadgeVariant.success,
      showDot = true;

  const StatusBadge.offline({super.key, this.size = BadgeSize.sm})
    : label = 'Offline',
      variant = BadgeVariant.secondary,
      showDot = true;

  const StatusBadge.pending({super.key, this.size = BadgeSize.sm})
    : label = 'Pending',
      variant = BadgeVariant.warning,
      showDot = true;

  const StatusBadge.active({super.key, this.size = BadgeSize.sm})
    : label = 'Active',
      variant = BadgeVariant.success,
      showDot = true;

  const StatusBadge.inactive({super.key, this.size = BadgeSize.sm})
    : label = 'Inactive',
      variant = BadgeVariant.secondary,
      showDot = true;

  const StatusBadge.error({super.key, this.size = BadgeSize.sm})
    : label = 'Error',
      variant = BadgeVariant.destructive,
      showDot = true;

  final String label;
  final BadgeVariant variant;
  final BadgeSize size;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    return Badge(label: label, variant: variant, size: size, showDot: showDot);
  }
}
