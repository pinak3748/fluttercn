import 'package:flutter/material.dart';

import '../theme/colors.dart';

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
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: _onTapDown,
            onTapUp: _onTapUp,
            onTapCancel: _onTapCancel,
            onTap: _isDisabled ? null : widget.onPressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: widget.fullWidth ? double.infinity : null,
              height: _getHeight(),
              padding: _getPadding(),
              decoration: BoxDecoration(
                color: _getBackgroundColor(isDark),
                border: _getBorder(isDark),
                borderRadius: BorderRadius.circular(6),
                boxShadow:
                    widget.variant == ButtonVariant.primary && !_isDisabled
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ]
                    : null,
              ),
              child: _buildContent(isDark),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(bool isDark) {
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
              valueColor: AlwaysStoppedAnimation<Color>(
                _getForegroundColor(isDark),
              ),
            ),
          ),
          const SizedBox(width: 8),
          DefaultTextStyle(
            style: TextStyle(
              color: _getForegroundColor(isDark),
              fontSize: _getFontSize(),
              fontWeight: FontWeight.w500,
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
                    color: _getForegroundColor(isDark),
                    size: _getIconSize(),
                  ),
                  child: widget.icon!,
                ),
                const SizedBox(width: 8),
                DefaultTextStyle(
                  style: TextStyle(
                    color: _getForegroundColor(isDark),
                    fontSize: _getFontSize(),
                    fontWeight: FontWeight.w500,
                  ),
                  child: widget.child,
                ),
              ]
            : [
                DefaultTextStyle(
                  style: TextStyle(
                    color: _getForegroundColor(isDark),
                    fontSize: _getFontSize(),
                    fontWeight: FontWeight.w500,
                  ),
                  child: widget.child,
                ),
                const SizedBox(width: 8),
                IconTheme(
                  data: IconThemeData(
                    color: _getForegroundColor(isDark),
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
          color: _getForegroundColor(isDark),
          fontSize: _getFontSize(),
          fontWeight: FontWeight.w500,
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
        return 44;
      case ButtonSize.icon:
        return 40;
    }
  }

  EdgeInsets _getPadding() {
    switch (widget.size) {
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: 12);
      case ButtonSize.md:
        return const EdgeInsets.symmetric(horizontal: 16);
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: 24);
      case ButtonSize.icon:
        return const EdgeInsets.all(8);
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case ButtonSize.sm:
        return 13;
      case ButtonSize.md:
        return 14;
      case ButtonSize.lg:
        return 16;
      case ButtonSize.icon:
        return 14;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case ButtonSize.sm:
        return 14;
      case ButtonSize.md:
        return 16;
      case ButtonSize.lg:
        return 18;
      case ButtonSize.icon:
        return 16;
    }
  }

  Color _getBackgroundColor(bool isDark) {
    if (_isDisabled) {
      return isDark ? AppColors.mutedDark : AppColors.muted;
    }

    switch (widget.variant) {
      case ButtonVariant.primary:
        return isDark ? AppColors.primaryDark : AppColors.primary;
      case ButtonVariant.secondary:
        return isDark ? AppColors.secondaryDark : AppColors.secondary;
      case ButtonVariant.destructive:
        return isDark ? AppColors.destructiveDark : AppColors.destructive;
      case ButtonVariant.outline:
        return Colors.transparent;
      case ButtonVariant.ghost:
        return _isPressed
            ? (isDark ? AppColors.accentDark : AppColors.accent)
            : Colors.transparent;
      case ButtonVariant.link:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor(bool isDark) {
    if (_isDisabled) {
      return isDark ? AppColors.mutedForegroundDark : AppColors.mutedForeground;
    }

    switch (widget.variant) {
      case ButtonVariant.primary:
        return isDark
            ? AppColors.primaryForegroundDark
            : AppColors.primaryForeground;
      case ButtonVariant.secondary:
        return isDark
            ? AppColors.secondaryForegroundDark
            : AppColors.secondaryForeground;
      case ButtonVariant.destructive:
        return isDark
            ? AppColors.destructiveForegroundDark
            : AppColors.destructiveForeground;
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
        return isDark ? AppColors.foregroundDark : AppColors.foreground;
      case ButtonVariant.link:
        return isDark ? AppColors.primaryDark : AppColors.primary;
    }
  }

  Border? _getBorder(bool isDark) {
    if (widget.variant == ButtonVariant.outline) {
      return Border.all(
        color: isDark ? AppColors.borderDark : AppColors.border,
        width: 1,
      );
    }
    return null;
  }
}
