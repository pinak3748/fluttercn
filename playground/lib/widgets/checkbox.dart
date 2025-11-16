import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Checkbox sizes
enum CheckboxSize { sm, md, lg }

/// A customizable checkbox component similar to shadcn/ui Checkbox
///
/// Supports checked, unchecked, and indeterminate states with labels.
///
/// Example:
/// ```dart
/// // Basic checkbox
/// CNCheckbox(
///   value: true,
///   onChanged: (value) => print(value),
/// )
///
/// // Checkbox with label
/// CNCheckbox(
///   value: false,
///   label: 'Accept terms and conditions',
///   onChanged: (value) {},
/// )
///
/// // Indeterminate checkbox
/// CNCheckbox(
///   value: null,
///   tristate: true,
///   onChanged: (value) {},
/// )
/// ```
class CNCheckbox extends StatefulWidget {
  const CNCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
    this.size = CheckboxSize.md,
    this.disabled = false,
    this.error = false,
    this.errorText,
    this.tristate = false,
  });

  /// Current value of the checkbox (true, false, or null for indeterminate)
  final bool? value;

  /// Callback when checkbox state changes
  final ValueChanged<bool?>? onChanged;

  /// Optional label text
  final String? label;

  /// Optional description text below label
  final String? description;

  /// Checkbox size
  final CheckboxSize size;

  /// Whether the checkbox is disabled
  final bool disabled;

  /// Whether to show error state
  final bool error;

  /// Optional error message
  final String? errorText;

  /// Whether to allow indeterminate state (null value)
  final bool tristate;

  @override
  State<CNCheckbox> createState() => _CNCheckboxState();
}

class _CNCheckboxState extends State<CNCheckbox> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppTheme.durationFast,
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

  void _handleTap() {
    if (widget.disabled || widget.onChanged == null) return;

    bool? newValue;
    if (widget.tristate) {
      // Cycle through: false -> true -> null -> false
      if (widget.value == false) {
        newValue = true;
      } else if (widget.value == true) {
        newValue = null;
      } else {
        newValue = false;
      }
    } else {
      newValue = !(widget.value ?? false);
    }

    widget.onChanged?.call(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.disabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _handleTap,
        onTapDown: (_) {
          if (!widget.disabled) _animationController.forward();
        },
        onTapUp: (_) {
          if (!widget.disabled) _animationController.reverse();
        },
        onTapCancel: () {
          if (!widget.disabled) _animationController.reverse();
        },
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildCheckbox(),
                      if (widget.label != null) ...[
                        SizedBox(width: _getGapSize()),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                              if (widget.description != null) ...[
                                const SizedBox(height: 2),
                                Text(
                                  widget.description!,
                                  style: TextStyle(
                                    fontSize: _getDescriptionFontSize(),
                                    color: widget.disabled
                                        ? AppTheme.textDisabled
                                        : AppTheme.textTertiary,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (widget.errorText != null) ...[
                    SizedBox(height: AppTheme.spaceXs),
                    Padding(
                      padding: EdgeInsets.only(left: _getCheckboxSize() + _getGapSize()),
                      child: Text(
                        widget.errorText!,
                        style: TextStyle(
                          fontSize: AppTheme.fontSizeXs,
                          color: AppTheme.error,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    final size = _getCheckboxSize();
    final isChecked = widget.value == true;
    final isIndeterminate = widget.value == null && widget.tristate;

    return AnimatedContainer(
      duration: AppTheme.durationNormal,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        border: Border.all(
          color: _getBorderColor(),
          width: _getBorderWidth(),
        ),
        borderRadius: BorderRadius.circular(_getBorderRadius()),
      ),
      child: isChecked || isIndeterminate
          ? Icon(
              isIndeterminate ? Icons.remove : Icons.check,
              size: _getIconSize(),
              color: _getIconColor(),
            )
          : null,
    );
  }

  double _getCheckboxSize() {
    switch (widget.size) {
      case CheckboxSize.sm:
        return 16;
      case CheckboxSize.md:
        return 20;
      case CheckboxSize.lg:
        return 24;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case CheckboxSize.sm:
        return 12;
      case CheckboxSize.md:
        return 14;
      case CheckboxSize.lg:
        return 16;
    }
  }

  double _getBorderRadius() {
    switch (widget.size) {
      case CheckboxSize.sm:
        return AppTheme.radiusXs;
      case CheckboxSize.md:
        return AppTheme.radiusSm;
      case CheckboxSize.lg:
        return AppTheme.radiusMd;
    }
  }

  double _getBorderWidth() {
    return widget.value == true || (widget.value == null && widget.tristate) ? 0 : 2;
  }

  double _getGapSize() {
    switch (widget.size) {
      case CheckboxSize.sm:
        return 6;
      case CheckboxSize.md:
        return 8;
      case CheckboxSize.lg:
        return 10;
    }
  }

  double _getLabelFontSize() {
    switch (widget.size) {
      case CheckboxSize.sm:
        return AppTheme.fontSizeSm;
      case CheckboxSize.md:
        return AppTheme.fontSizeMd;
      case CheckboxSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getDescriptionFontSize() {
    switch (widget.size) {
      case CheckboxSize.sm:
        return AppTheme.fontSizeXs;
      case CheckboxSize.md:
        return AppTheme.fontSizeSm;
      case CheckboxSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  Color _getBackgroundColor() {
    if (widget.disabled) {
      return widget.value == true || (widget.value == null && widget.tristate)
          ? AppTheme.surfaceVariant
          : Colors.transparent;
    }

    if (widget.error) {
      return widget.value == true || (widget.value == null && widget.tristate)
          ? AppTheme.error
          : Colors.transparent;
    }

    return widget.value == true || (widget.value == null && widget.tristate)
        ? AppTheme.primary
        : Colors.transparent;
  }

  Color _getBorderColor() {
    if (widget.disabled) {
      return AppTheme.textDisabled;
    }

    if (widget.error) {
      return AppTheme.error;
    }

    if (_isHovered) {
      return AppTheme.primary;
    }

    return AppTheme.border;
  }

  Color _getIconColor() {
    if (widget.disabled) {
      return AppTheme.textDisabled;
    }

    if (widget.error) {
      return AppTheme.white;
    }

    return AppTheme.textOnPrimary;
  }
}

/// Checkbox group for managing multiple checkboxes
///
/// Example:
/// ```dart
/// CheckboxGroup(
///   options: ['Option 1', 'Option 2', 'Option 3'],
///   selectedValues: ['Option 1'],
///   onChanged: (values) => print(values),
/// )
/// ```
class CheckboxGroup extends StatelessWidget {
  const CheckboxGroup({
    super.key,
    required this.options,
    required this.selectedValues,
    required this.onChanged,
    this.size = CheckboxSize.md,
    this.disabled = false,
    this.direction = Axis.vertical,
    this.spacing = 12,
  });

  /// List of checkbox options
  final List<String> options;

  /// Currently selected values
  final List<String> selectedValues;

  /// Callback when selection changes
  final ValueChanged<List<String>> onChanged;

  /// Checkbox size
  final CheckboxSize size;

  /// Whether all checkboxes are disabled
  final bool disabled;

  /// Layout direction (vertical or horizontal)
  final Axis direction;

  /// Spacing between checkboxes
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final children = options.map((option) {
      final isSelected = selectedValues.contains(option);
      return CNCheckbox(
        value: isSelected,
        label: option,
        size: size,
        disabled: disabled,
        onChanged: (value) {
          final newValues = List<String>.from(selectedValues);
          if (value == true) {
            newValues.add(option);
          } else {
            newValues.remove(option);
          }
          onChanged(newValues);
        },
      );
    }).toList();

    if (direction == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children
            .map((child) => Padding(
                  padding: EdgeInsets.only(bottom: spacing),
                  child: child,
                ))
            .toList(),
      );
    } else {
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: children,
      );
    }
  }
}
