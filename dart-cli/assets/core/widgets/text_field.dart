import 'package:flutter/material.dart';

import '../config/theme.dart';

/// TextField sizes
enum TextFieldSize { sm, md, lg }

/// A customizable text field component similar to shadcn/ui Input
///
/// Supports single-line and multi-line text input with labels, icons, and validation.
///
/// Example:
/// ```dart
/// // Basic text field
/// TextField(
///   controller: controller,
///   placeholder: 'Enter your name',
/// )
///
/// // Text field with label
/// TextField(
///   controller: controller,
///   label: 'Full name',
///   placeholder: 'John Doe',
/// )
///
/// // Password field
/// TextField(
///   controller: controller,
///   label: 'Password',
///   obscureText: true,
/// )
///
/// // Text field with icon
/// TextField(
///   controller: controller,
///   label: 'Email',
///   prefixIcon: Icons.email,
/// )
/// ```
class TextField extends StatefulWidget {
  const TextField({
    super.key,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onSubmitted,
    this.placeholder,
    this.label,
    this.description,
    this.size = TextFieldSize.md,
    this.disabled = false,
    this.readOnly = false,
    this.error = false,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.width,
  });

  /// Controller for the text field
  final TextEditingController? controller;

  /// Initial value of the text field
  final String? initialValue;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Callback when user submits (Enter key)
  final ValueChanged<String>? onSubmitted;

  /// Placeholder text when empty
  final String? placeholder;

  /// Optional label text
  final String? label;

  /// Optional description text below label
  final String? description;

  /// Text field size
  final TextFieldSize size;

  /// Whether the text field is disabled
  final bool disabled;

  /// Whether the text field is read-only
  final bool readOnly;

  /// Whether to show error state
  final bool error;

  /// Optional error message
  final String? errorText;

  /// Optional prefix icon
  final IconData? prefixIcon;

  /// Optional suffix icon
  final IconData? suffixIcon;

  /// Whether to obscure text (for passwords)
  final bool obscureText;

  /// Maximum number of lines (1 for single-line)
  final int? maxLines;

  /// Minimum number of lines (for multi-line)
  final int? minLines;

  /// Maximum character length
  final int? maxLength;

  /// Keyboard type
  final TextInputType? keyboardType;

  /// Text input action button
  final TextInputAction? textInputAction;

  /// Whether to auto-focus on mount
  final bool autofocus;

  /// Optional width constraint for the text field
  final double? width;

  @override
  State<TextField> createState() => _CNTextFieldState();
}

class _CNTextFieldState extends State<TextField>
    with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late AnimationController _animationController;
  bool _isFocused = false;
  bool _isHovered = false;
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
    _obscureText = widget.obscureText;

    _animationController = AnimationController(
      duration: AppTheme.durationFast,
      vsync: this,
    );

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: _getLabelFontSize(),
              fontWeight: AppTheme.fontWeightMedium,
              color: widget.disabled
                  ? AppTheme.textDisabled
                  : widget.error
                      ? AppTheme.error
                      : AppTheme.textPrimary,
            ),
          ),
          SizedBox(height: AppTheme.spaceXs),
        ],
        if (widget.description != null) ...[
          Text(
            widget.description!,
            style: TextStyle(
              fontSize: _getDescriptionFontSize(),
              color: widget.disabled
                  ? AppTheme.textDisabled
                  : AppTheme.textTertiary,
            ),
          ),
          SizedBox(height: AppTheme.spaceXs),
        ],
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: widget.disabled
              ? SystemMouseCursors.basic
              : SystemMouseCursors.text,
          child: AnimatedContainer(
            duration: AppTheme.durationNormal,
            width: widget.width,
            decoration: BoxDecoration(
              color: widget.disabled
                  ? AppTheme.surfaceVariant
                  : AppTheme.surface,
              borderRadius: BorderRadius.circular(_getBorderRadius()),
              border: Border.all(
                color: _getBorderColor(),
                width: _isFocused ? 2 : 1,
              ),
            ),
            child: Row(
              crossAxisAlignment: widget.maxLines == 1
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                if (widget.prefixIcon != null) ...[
                  Padding(
                    padding: EdgeInsets.only(
                      left: _getHorizontalPadding(),
                      top: widget.maxLines == 1 ? 0 : _getVerticalPadding(),
                    ),
                    child: Icon(
                      widget.prefixIcon,
                      size: _getIconSize(),
                      color: widget.disabled
                          ? AppTheme.textDisabled
                          : _isFocused
                              ? AppTheme.textPrimary
                              : AppTheme.textSecondary,
                    ),
                  ),
                  SizedBox(width: _getIconGap()),
                ],
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.prefixIcon == null
                          ? _getHorizontalPadding()
                          : 0,
                      vertical: _getVerticalPadding(),
                    ),
                    child: TextFormField(
                      controller: _controller,
                      focusNode: _focusNode,
                      enabled: !widget.disabled,
                      readOnly: widget.readOnly,
                      enableInteractiveSelection: !widget.readOnly,
                      obscureText: _obscureText,
                      maxLines: widget.obscureText ? 1 : widget.maxLines,
                      minLines: widget.minLines,
                      maxLength: widget.maxLength,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      autofocus: widget.autofocus,
                      style: TextStyle(
                        fontSize: _getFontSize(),
                        color: widget.disabled
                            ? AppTheme.textDisabled
                            : AppTheme.textPrimary,
                      ),
                      decoration: InputDecoration(
                        hintText: widget.placeholder,
                        hintStyle: TextStyle(
                          fontSize: _getFontSize(),
                          color: AppTheme.textTertiary,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        counterText: '',
                      ),
                      onChanged: widget.onChanged,
                      onFieldSubmitted: widget.onSubmitted,
                    ),
                  ),
                ),
                if (widget.obscureText) ...[
                  SizedBox(width: _getIconGap()),
                  GestureDetector(
                    onTap: widget.disabled ? null : _toggleObscureText,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: _getHorizontalPadding(),
                        top: widget.maxLines == 1 ? 0 : _getVerticalPadding(),
                      ),
                      child: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: _getIconSize(),
                        color: widget.disabled
                            ? AppTheme.textDisabled
                            : AppTheme.textSecondary,
                      ),
                    ),
                  ),
                ] else if (widget.suffixIcon != null) ...[
                  SizedBox(width: _getIconGap()),
                  Padding(
                    padding: EdgeInsets.only(
                      right: _getHorizontalPadding(),
                      top: widget.maxLines == 1 ? 0 : _getVerticalPadding(),
                    ),
                    child: Icon(
                      widget.suffixIcon,
                      size: _getIconSize(),
                      color: widget.disabled
                          ? AppTheme.textDisabled
                          : AppTheme.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        if (widget.errorText != null) ...[
          SizedBox(height: AppTheme.spaceXs),
          Text(
            widget.errorText!,
            style: TextStyle(
              fontSize: AppTheme.fontSizeXs,
              color: AppTheme.error,
            ),
          ),
        ],
      ],
    );
  }

  double _getBorderRadius() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return AppTheme.radiusSm;
      case TextFieldSize.md:
        return AppTheme.radiusMd;
      case TextFieldSize.lg:
        return AppTheme.radiusLg;
    }
  }

  double _getHorizontalPadding() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return AppTheme.spaceSm;
      case TextFieldSize.md:
        return AppTheme.spaceMd;
      case TextFieldSize.lg:
        return AppTheme.spaceLg;
    }
  }

  double _getVerticalPadding() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return AppTheme.spaceXs;
      case TextFieldSize.md:
        return AppTheme.spaceSm;
      case TextFieldSize.lg:
        return AppTheme.spaceMd;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return AppTheme.fontSizeSm;
      case TextFieldSize.md:
        return AppTheme.fontSizeMd;
      case TextFieldSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getLabelFontSize() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return AppTheme.fontSizeSm;
      case TextFieldSize.md:
        return AppTheme.fontSizeMd;
      case TextFieldSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getDescriptionFontSize() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return AppTheme.fontSizeXs;
      case TextFieldSize.md:
        return AppTheme.fontSizeSm;
      case TextFieldSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return 16;
      case TextFieldSize.md:
        return 18;
      case TextFieldSize.lg:
        return 20;
    }
  }

  double _getIconGap() {
    switch (widget.size) {
      case TextFieldSize.sm:
        return 6;
      case TextFieldSize.md:
        return 8;
      case TextFieldSize.lg:
        return 10;
    }
  }

  Color _getBorderColor() {
    if (widget.disabled) {
      return AppTheme.border;
    }

    if (widget.error) {
      return AppTheme.error;
    }

    if (_isFocused) {
      return AppTheme.borderFocus;
    }

    if (_isHovered) {
      return AppTheme.borderFocus;
    }

    return AppTheme.border;
  }
}
