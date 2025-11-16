import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Button variants similar to shadcn/ui
enum ButtonVariant { primary, secondary, destructive, outline, ghost, link }

/// Button sizes
enum ButtonSize { sm, md, lg, icon }

/// A customizable button component similar to shadcn/ui Button
class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.md,
    this.disabled = false,
    this.loading = false,
    this.fullWidth = false,
    this.icon,
    this.iconPosition = IconPosition.leading,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool disabled;
  final bool loading;
  final bool fullWidth;
  final Widget? icon;
  final IconPosition iconPosition;

  @override
  State<Button> createState() => _ButtonState();
}

enum IconPosition { leading, trailing }

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppTheme.durationFast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: AppTheme.curveEaseInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (!_isDisabled) {
      setState(() => _isPressed = true);
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (!_isDisabled) {
      setState(() => _isPressed = false);
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (!_isDisabled) {
      setState(() => _isPressed = false);
      _animationController.reverse();
    }
  }

  bool get _isDisabled => widget.disabled || widget.loading;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            cursor: _isDisabled
                ? SystemMouseCursors.basic
                : SystemMouseCursors.click,
            child: AnimatedContainer(
              duration: AppTheme.durationNormal,
              width: widget.fullWidth ? double.infinity : null,
              height: _getHeight(),
              padding: _getPadding(),
              decoration: BoxDecoration(
                color: _getBackgroundColor(),
                border: _getBorder(),
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                boxShadow:
                    widget.variant == ButtonVariant.primary && !_isDisabled
                    ? AppTheme.shadowSm
                    : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _isDisabled ? null : widget.onPressed,
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  onTapCancel: _onTapCancel,
                  borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                  splashColor: _getSplashColor(),
                  highlightColor: _getHighlightColor(),
                  child: _buildContent(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    if (widget.loading) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _getIconSize(),
            height: _getIconSize(),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(_getForegroundColor()),
            ),
          ),
          AppTheme.gapHorizontalSm,
          DefaultTextStyle(
            style: TextStyle(
              color: _getForegroundColor(),
              fontSize: _getFontSize(),
              fontWeight: AppTheme.fontWeightMedium,
            ),
            child: widget.child,
          ),
        ],
      );
    }

    if (widget.icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.iconPosition == IconPosition.leading
            ? [
                IconTheme(
                  data: IconThemeData(
                    color: _getForegroundColor(),
                    size: _getIconSize(),
                  ),
                  child: widget.icon!,
                ),
                AppTheme.gapHorizontalSm,
                DefaultTextStyle(
                  style: TextStyle(
                    color: _getForegroundColor(),
                    fontSize: _getFontSize(),
                    fontWeight: AppTheme.fontWeightMedium,
                  ),
                  child: widget.child,
                ),
              ]
            : [
                DefaultTextStyle(
                  style: TextStyle(
                    color: _getForegroundColor(),
                    fontSize: _getFontSize(),
                    fontWeight: AppTheme.fontWeightMedium,
                  ),
                  child: widget.child,
                ),
                AppTheme.gapHorizontalSm,
                IconTheme(
                  data: IconThemeData(
                    color: _getForegroundColor(),
                    size: _getIconSize(),
                  ),
                  child: widget.icon!,
                ),
              ],
      );
    }

    return Center(
      child: DefaultTextStyle(
        style: TextStyle(
          color: _getForegroundColor(),
          fontSize: _getFontSize(),
          fontWeight: AppTheme.fontWeightMedium,
        ),
        child: widget.child,
      ),
    );
  }

  double _getHeight() {
    switch (widget.size) {
      case ButtonSize.sm:
        return 32;
      case ButtonSize.md:
        return 40;
      case ButtonSize.lg:
        return 48;
      case ButtonSize.icon:
        return 40;
    }
  }

  EdgeInsets _getPadding() {
    switch (widget.size) {
      case ButtonSize.sm:
        return AppTheme.paddingHorizontalMd;
      case ButtonSize.md:
        return AppTheme.paddingHorizontalLg;
      case ButtonSize.lg:
        return AppTheme.paddingHorizontalXl;
      case ButtonSize.icon:
        return AppTheme.paddingSm;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case ButtonSize.sm:
        return AppTheme.fontSizeSm;
      case ButtonSize.md:
        return AppTheme.fontSizeMd;
      case ButtonSize.lg:
        return AppTheme.fontSizeLg;
      case ButtonSize.icon:
        return AppTheme.fontSizeMd;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case ButtonSize.sm:
        return AppTheme.fontSizeSm;
      case ButtonSize.md:
        return AppTheme.fontSizeMd;
      case ButtonSize.lg:
        return AppTheme.fontSizeLg;
      case ButtonSize.icon:
        return AppTheme.fontSizeMd;
    }
  }

  Color _getBackgroundColor() {
    if (_isDisabled) {
      return AppTheme.surfaceVariant;
    }

    switch (widget.variant) {
      case ButtonVariant.primary:
        return AppTheme.primary;
      case ButtonVariant.secondary:
        return AppTheme.secondary;
      case ButtonVariant.destructive:
        return AppTheme.error;
      case ButtonVariant.outline:
        return Colors.transparent;
      case ButtonVariant.ghost:
        return _isPressed ? AppTheme.secondary : Colors.transparent;
      case ButtonVariant.link:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor() {
    if (_isDisabled) {
      return AppTheme.textDisabled;
    }

    switch (widget.variant) {
      case ButtonVariant.primary:
        return AppTheme.textOnPrimary;
      case ButtonVariant.secondary:
        return AppTheme.textOnSecondary;
      case ButtonVariant.destructive:
        return AppTheme.white;
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
        return AppTheme.textPrimary;
      case ButtonVariant.link:
        return AppTheme.primary;
    }
  }

  Border? _getBorder() {
    if (widget.variant == ButtonVariant.outline) {
      return Border.all(color: AppTheme.border, width: 1);
    }
    return null;
  }

  Color _getSplashColor() {
    switch (widget.variant) {
      case ButtonVariant.primary:
        return AppTheme.textOnPrimary.withValues(alpha: 0.1);
      case ButtonVariant.secondary:
        return AppTheme.textOnSecondary.withValues(alpha: 0.1);
      case ButtonVariant.destructive:
        return AppTheme.white.withValues(alpha: 0.1);
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return AppTheme.secondary.withValues(alpha: 0.1);
    }
  }

  Color _getHighlightColor() {
    switch (widget.variant) {
      case ButtonVariant.primary:
        return AppTheme.textOnPrimary.withValues(alpha: 0.05);
      case ButtonVariant.secondary:
        return AppTheme.textOnSecondary.withValues(alpha: 0.05);
      case ButtonVariant.destructive:
        return AppTheme.white.withValues(alpha: 0.05);
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return AppTheme.secondary.withValues(alpha: 0.05);
    }
  }
}
