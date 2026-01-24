import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Alert variants
enum AlertVariant { default_, info, success, warning, error }

/// A customizable alert component similar to shadcn/ui Alert
///
/// Displays important messages with various styles and optional actions.
///
/// Example:
/// ```dart
/// // Basic alert
/// Alert(
///   title: 'Heads up!',
///   description: 'You can add components to your app using the cli.',
/// )
///
/// // Info alert with icon
/// Alert(
///   variant: AlertVariant.info,
///   icon: Icons.info_outline,
///   title: 'Information',
///   description: 'This is an informational message.',
/// )
///
/// // Dismissible alert
/// Alert(
///   variant: AlertVariant.success,
///   title: 'Success!',
///   description: 'Your changes have been saved.',
///   dismissible: true,
///   onDismiss: () => print('Alert dismissed'),
/// )
///
/// // Alert with action
/// Alert(
///   variant: AlertVariant.warning,
///   title: 'Warning',
///   description: 'Your session is about to expire.',
///   action: TextButton(
///     onPressed: () {},
///     child: Text('Extend'),
///   ),
/// )
/// ```
class Alert extends StatefulWidget {
  const Alert({
    super.key,
    this.title,
    this.description,
    this.variant = AlertVariant.default_,
    this.icon,
    this.action,
    this.dismissible = false,
    this.onDismiss,
    this.borderRadius,
  });

  /// Optional title text
  final String? title;

  /// Optional description text
  final String? description;

  /// Alert variant for styling
  final AlertVariant variant;

  /// Optional leading icon
  final IconData? icon;

  /// Optional action widget (button)
  final Widget? action;

  /// Whether the alert can be dismissed
  final bool dismissible;

  /// Callback when alert is dismissed
  final VoidCallback? onDismiss;

  /// Custom border radius
  final BorderRadius? borderRadius;

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isDismissed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppTheme.durationNormal,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDismiss() {
    _controller.forward().then((_) {
      setState(() => _isDismissed = true);
      widget.onDismiss?.call();
    });
  }

  Color _getBackgroundColor() {
    switch (widget.variant) {
      case AlertVariant.default_:
        return AppTheme.surface;
      case AlertVariant.info:
        return AppTheme.infoLight;
      case AlertVariant.success:
        return AppTheme.successLight;
      case AlertVariant.warning:
        return AppTheme.warningLight;
      case AlertVariant.error:
        return AppTheme.errorLight;
    }
  }

  Color _getBorderColor() {
    switch (widget.variant) {
      case AlertVariant.default_:
        return AppTheme.border;
      case AlertVariant.info:
        return AppTheme.info.withValues(alpha: 0.3);
      case AlertVariant.success:
        return AppTheme.success.withValues(alpha: 0.3);
      case AlertVariant.warning:
        return AppTheme.warning.withValues(alpha: 0.3);
      case AlertVariant.error:
        return AppTheme.error.withValues(alpha: 0.3);
    }
  }

  Color _getIconColor() {
    switch (widget.variant) {
      case AlertVariant.default_:
        return AppTheme.textPrimary;
      case AlertVariant.info:
        return AppTheme.info;
      case AlertVariant.success:
        return AppTheme.success;
      case AlertVariant.warning:
        return AppTheme.warning;
      case AlertVariant.error:
        return AppTheme.error;
    }
  }

  Color _getTitleColor() {
    switch (widget.variant) {
      case AlertVariant.default_:
        return AppTheme.textPrimary;
      case AlertVariant.info:
        return AppTheme.info;
      case AlertVariant.success:
        return AppTheme.success;
      case AlertVariant.warning:
        return AppTheme.warning;
      case AlertVariant.error:
        return AppTheme.error;
    }
  }

  Color _getDescriptionColor() {
    switch (widget.variant) {
      case AlertVariant.default_:
        return AppTheme.textSecondary;
      case AlertVariant.info:
      case AlertVariant.success:
      case AlertVariant.warning:
      case AlertVariant.error:
        return AppTheme.textPrimary.withValues(alpha: 0.8);
    }
  }

  IconData _getDefaultIcon() {
    switch (widget.variant) {
      case AlertVariant.default_:
        return Icons.info_outline;
      case AlertVariant.info:
        return Icons.info_outline;
      case AlertVariant.success:
        return Icons.check_circle_outline;
      case AlertVariant.warning:
        return Icons.warning_amber_outlined;
      case AlertVariant.error:
        return Icons.error_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isDismissed) {
      return const SizedBox.shrink();
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: Container(
        padding: AppTheme.paddingLg,
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: widget.borderRadius ?? AppTheme.borderRadiusLg,
          border: Border.all(
            color: _getBorderColor(),
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            if (widget.icon != null || widget.variant != AlertVariant.default_)
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 2),
                child: Icon(
                  widget.icon ?? _getDefaultIcon(),
                  size: 20,
                  color: _getIconColor(),
                ),
              ),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.title != null)
                    Text(
                      widget.title!,
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeMd,
                        fontWeight: AppTheme.fontWeightSemiBold,
                        color: _getTitleColor(),
                        height: 1.4,
                      ),
                    ),
                  if (widget.title != null && widget.description != null)
                    SizedBox(height: AppTheme.spaceXs),
                  if (widget.description != null)
                    Text(
                      widget.description!,
                      style: TextStyle(
                        fontSize: AppTheme.fontSizeSm,
                        color: _getDescriptionColor(),
                        height: 1.5,
                      ),
                    ),
                  if (widget.action != null) ...[
                    SizedBox(height: AppTheme.spaceMd),
                    widget.action!,
                  ],
                ],
              ),
            ),
            // Dismiss button
            if (widget.dismissible)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _handleDismiss,
                    child: Icon(
                      Icons.close,
                      size: 18,
                      color: AppTheme.textTertiary,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
