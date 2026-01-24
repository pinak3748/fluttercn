import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Slider sizes
enum CNSliderSize { sm, md, lg }

/// A customizable slider component similar to shadcn/ui Slider
///
/// Supports continuous and stepped values with smooth animations.
///
/// Example:
/// ```dart
/// // Basic slider
/// CNSlider(
///   value: 50,
///   onChanged: (value) => print(value),
/// )
///
/// // Slider with label
/// CNSlider(
///   value: 30,
///   label: 'Volume',
///   onChanged: (value) {},
/// )
///
/// // Slider with range
/// CNSlider(
///   value: 50,
///   min: 0,
///   max: 100,
///   label: 'Brightness',
///   description: 'Adjust screen brightness',
///   onChanged: (value) {},
/// )
///
/// // Stepped slider
/// CNSlider(
///   value: 50,
///   min: 0,
///   max: 100,
///   divisions: 10,
///   showValue: true,
///   onChanged: (value) {},
/// )
/// ```
class CNSlider extends StatefulWidget {
  const CNSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0.0,
    this.max = 100.0,
    this.divisions,
    this.label,
    this.description,
    this.size = CNSliderSize.md,
    this.disabled = false,
    this.showValue = false,
    this.activeColor,
    this.onChangeStart,
    this.onChangeEnd,
  });

  /// Current value of the slider
  final double value;

  /// Callback when slider value changes
  final ValueChanged<double>? onChanged;

  /// Minimum value
  final double min;

  /// Maximum value
  final double max;

  /// Number of divisions for stepped slider (null for continuous)
  final int? divisions;

  /// Optional label text
  final String? label;

  /// Optional description text below label
  final String? description;

  /// Slider size
  final CNSliderSize size;

  /// Whether the slider is disabled
  final bool disabled;

  /// Whether to show the current value
  final bool showValue;

  /// Optional active track color
  final Color? activeColor;

  /// Callback when drag starts
  final ValueChanged<double>? onChangeStart;

  /// Callback when drag ends
  final ValueChanged<double>? onChangeEnd;

  @override
  State<CNSlider> createState() => _CNSliderState();
}

class _CNSliderState extends State<CNSlider> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: AppTheme.durationFast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _handleDragStart() {
    if (!widget.disabled) {
      setState(() => _isDragging = true);
      _scaleController.forward();
      widget.onChangeStart?.call(widget.value);
    }
  }

  void _handleDragEnd() {
    if (!widget.disabled) {
      setState(() => _isDragging = false);
      _scaleController.reverse();
      widget.onChangeEnd?.call(widget.value);
    }
  }

  double _getTrackHeight() {
    switch (widget.size) {
      case CNSliderSize.sm:
        return 4;
      case CNSliderSize.md:
        return 6;
      case CNSliderSize.lg:
        return 8;
    }
  }

  double _getThumbSize() {
    switch (widget.size) {
      case CNSliderSize.sm:
        return 14;
      case CNSliderSize.md:
        return 18;
      case CNSliderSize.lg:
        return 22;
    }
  }

  double _getLabelFontSize() {
    switch (widget.size) {
      case CNSliderSize.sm:
        return AppTheme.fontSizeSm;
      case CNSliderSize.md:
        return AppTheme.fontSizeMd;
      case CNSliderSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getDescriptionFontSize() {
    switch (widget.size) {
      case CNSliderSize.sm:
        return AppTheme.fontSizeXs;
      case CNSliderSize.md:
        return AppTheme.fontSizeSm;
      case CNSliderSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  double _getValueFontSize() {
    switch (widget.size) {
      case CNSliderSize.sm:
        return AppTheme.fontSizeXs;
      case CNSliderSize.md:
        return AppTheme.fontSizeSm;
      case CNSliderSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  Color _getActiveColor() {
    if (widget.disabled) {
      return AppTheme.textDisabled;
    }
    return widget.activeColor ?? AppTheme.primary;
  }

  Color _getInactiveColor() {
    if (widget.disabled) {
      return AppTheme.surfaceVariant;
    }
    return AppTheme.surfaceVariant;
  }

  Color _getThumbColor() {
    if (widget.disabled) {
      return AppTheme.textDisabled;
    }
    return AppTheme.white;
  }

  List<BoxShadow>? _getThumbShadow() {
    if (widget.disabled) {
      return null;
    }

    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.15),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: 1,
        offset: const Offset(0, 1),
      ),
    ];
  }

  String _formatValue(double value) {
    if (widget.divisions != null) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor:
          widget.disabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.label != null || widget.showValue) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.label != null)
                  Expanded(
                    child: Text(
                      widget.label!,
                      style: TextStyle(
                        fontSize: _getLabelFontSize(),
                        fontWeight: AppTheme.fontWeightMedium,
                        color: widget.disabled
                            ? AppTheme.textDisabled
                            : AppTheme.textPrimary,
                      ),
                    ),
                  ),
                if (widget.showValue)
                  Text(
                    _formatValue(widget.value),
                    style: TextStyle(
                      fontSize: _getValueFontSize(),
                      fontWeight: AppTheme.fontWeightMedium,
                      color: widget.disabled
                          ? AppTheme.textDisabled
                          : AppTheme.textSecondary,
                    ),
                  ),
              ],
            ),
            SizedBox(height: AppTheme.spaceSm),
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
            SizedBox(height: AppTheme.spaceSm),
          ],
          _buildSlider(),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    final trackHeight = _getTrackHeight();
    final thumbSize = _getThumbSize();

    return LayoutBuilder(
      builder: (context, constraints) {
        final trackWidth = constraints.maxWidth;
        final normalizedValue =
            (widget.value - widget.min) / (widget.max - widget.min);
        final clampedValue = normalizedValue.clamp(0.0, 1.0);

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragStart: (_) => _handleDragStart(),
          onHorizontalDragEnd: (_) => _handleDragEnd(),
          onHorizontalDragCancel: _handleDragEnd,
          onHorizontalDragUpdate: (details) {
            if (widget.disabled || widget.onChanged == null) return;

            final localPosition = details.localPosition.dx;
            final percentage = (localPosition / trackWidth).clamp(0.0, 1.0);
            var newValue = widget.min + (percentage * (widget.max - widget.min));

            if (widget.divisions != null) {
              final step = (widget.max - widget.min) / widget.divisions!;
              newValue = (newValue / step).round() * step;
            }

            newValue = newValue.clamp(widget.min, widget.max);
            widget.onChanged?.call(newValue);
          },
          onTapDown: (details) {
            if (widget.disabled || widget.onChanged == null) return;

            final localPosition = details.localPosition.dx;
            final percentage = (localPosition / trackWidth).clamp(0.0, 1.0);
            var newValue = widget.min + (percentage * (widget.max - widget.min));

            if (widget.divisions != null) {
              final step = (widget.max - widget.min) / widget.divisions!;
              newValue = (newValue / step).round() * step;
            }

            newValue = newValue.clamp(widget.min, widget.max);
            widget.onChanged?.call(newValue);
          },
          child: SizedBox(
            height: thumbSize + 8,
            child: Stack(
              alignment: Alignment.centerLeft,
              clipBehavior: Clip.none,
              children: [
                // Track background
                Container(
                  width: trackWidth,
                  height: trackHeight,
                  decoration: BoxDecoration(
                    color: _getInactiveColor(),
                    borderRadius: BorderRadius.circular(trackHeight / 2),
                  ),
                ),
                // Active track
                AnimatedContainer(
                  duration: _isDragging
                      ? Duration.zero
                      : const Duration(milliseconds: 100),
                  width: clampedValue * trackWidth,
                  height: trackHeight,
                  decoration: BoxDecoration(
                    color: _getActiveColor(),
                    borderRadius: BorderRadius.circular(trackHeight / 2),
                  ),
                ),
                // Thumb
                AnimatedPositioned(
                  duration: _isDragging
                      ? Duration.zero
                      : const Duration(milliseconds: 100),
                  left: clampedValue * (trackWidth - thumbSize),
                  child: AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: child,
                      );
                    },
                    child: Container(
                      width: thumbSize,
                      height: thumbSize,
                      decoration: BoxDecoration(
                        color: _getThumbColor(),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: _getActiveColor(),
                          width: 2,
                        ),
                        boxShadow: _getThumbShadow(),
                      ),
                    ),
                  ),
                ),
                // Hover/Focus ring
                if ((_isHovered || _isDragging) && !widget.disabled)
                  AnimatedPositioned(
                    duration: _isDragging
                        ? Duration.zero
                        : const Duration(milliseconds: 100),
                    left: clampedValue * (trackWidth - thumbSize) -
                        (thumbSize * 0.25),
                    child: AnimatedOpacity(
                      duration: AppTheme.durationFast,
                      opacity: _isHovered || _isDragging ? 0.15 : 0,
                      child: Container(
                        width: thumbSize * 1.5,
                        height: thumbSize * 1.5,
                        decoration: BoxDecoration(
                          color: _getActiveColor(),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
