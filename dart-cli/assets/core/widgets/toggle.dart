import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Toggle sizes
enum ToggleSize { sm, md, lg }

/// A customizable toggle switch component similar to shadcn/ui Switch
///
/// Supports on/off states with smooth animations and labels.
///
/// Example:
/// ```dart
/// // Basic toggle
/// Toggle(
///   value: true,
///   onChanged: (value) => print(value),
/// )
///
/// // Toggle with label
/// Toggle(
///   value: false,
///   label: 'Enable notifications',
///   onChanged: (value) {},
/// )
///
/// // Toggle with description
/// Toggle(
///   value: true,
///   label: 'Dark mode',
///   description: 'Switch to dark theme',
///   onChanged: (value) {},
/// )
///
/// // Toggle with custom active color
/// Toggle(
///   value: true,
///   label: 'Custom color',
///   activeColor: Colors.blue,
///   onChanged: (value) {},
/// )
/// ```
class Toggle extends StatefulWidget {
  const Toggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.description,
    this.size = ToggleSize.md,
    this.disabled = false,
    this.error = false,
    this.errorText,
    this.activeColor,
  });

  /// Current value of the toggle (true = on, false = off)
  final bool value;

  /// Callback when toggle state changes
  final ValueChanged<bool>? onChanged;

  /// Optional label text
  final String? label;

  /// Optional description text below label
  final String? description;

  /// Toggle size
  final ToggleSize size;

  /// Whether the toggle is disabled
  final bool disabled;

  /// Whether to show error state
  final bool error;

  /// Optional error message
  final String? errorText;

  /// Optional active color for the toggle track when value is true.
  /// Defaults to AppTheme.success if not provided.
  final Color? activeColor;

  @override
  State<Toggle> createState() => _CNToggleState();
}

class _CNToggleState extends State<Toggle> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _thumbAnimation;
  bool _isHovered = false;
  bool _isAnimatingForward = true; // Track animation direction

  @override
  void initState() {
    super.initState();
    // Faster animation for thumb movement
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: AppTheme.durationFast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
    _thumbAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Set initial position based on value
    if (widget.value) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(Toggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _isAnimatingForward = widget.value; // true = forward, false = reverse
      if (widget.value) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.disabled) {
      _scaleController.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (!widget.disabled) {
      _scaleController.reverse();
      widget.onChanged?.call(!widget.value);
    }
  }

  void _handleTapCancel() {
    if (!widget.disabled) {
      _scaleController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.disabled
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
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
                      _buildToggle(),
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
                      padding: EdgeInsets.only(
                        left: _getToggleWidth() + _getGapSize(),
                      ),
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

  Widget _buildToggle() {
    final trackWidth = _getToggleWidth();
    final trackHeight = _getToggleHeight();
    final thumbSize = _getThumbSize();
    final thumbPadding = _getThumbPadding();

    return AnimatedBuilder(
      animation: _thumbAnimation,
      builder: (context, child) {
        final thumbPosition =
            _thumbAnimation.value * (trackWidth - thumbSize - thumbPadding * 2);

        // Color animation delayed - only starts changing after thumb passes middle (0.5)
        // When going false->true: thumb 0.0-0.5 stays inactive, 0.5-1.0 transitions to active
        // When going true->false: thumb 1.0-0.5 stays active, 0.5-0.0 transitions to inactive
        final thumbValue = _thumbAnimation.value;
        final colorProgress;
        if (_isAnimatingForward) {
          // Forward: false -> true
          colorProgress = thumbValue < 0.5
              ? 0.0 // First half: inactive
              : ((thumbValue - 0.5) * 2.0); // Second half: 0.0 -> 1.0
        } else {
          // Reverse: true -> false
          colorProgress = thumbValue > 0.5
              ? 1.0 // First half: still active
              : (1.0 - (0.5 - thumbValue) * 2.0); // Second half: 1.0 -> 0.0
        }

        return Container(
          width: trackWidth,
          height: trackHeight,
          decoration: BoxDecoration(
            color: _getTrackColor(colorProgress),
            borderRadius: BorderRadius.circular(trackHeight / 2),
          ),
          child: Stack(
            children: [
              Positioned(
                left: thumbPadding + thumbPosition,
                top: thumbPadding,
                child: Container(
                  width: thumbSize,
                  height: thumbSize,
                  decoration: BoxDecoration(
                    color: _getThumbColor(),
                    shape: BoxShape.circle,
                    boxShadow: _getThumbShadow(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double _getToggleWidth() {
    switch (widget.size) {
      case ToggleSize.sm:
        return 36;
      case ToggleSize.md:
        return 44;
      case ToggleSize.lg:
        return 52;
    }
  }

  double _getToggleHeight() {
    switch (widget.size) {
      case ToggleSize.sm:
        return 20;
      case ToggleSize.md:
        return 24;
      case ToggleSize.lg:
        return 28;
    }
  }

  double _getThumbSize() {
    switch (widget.size) {
      case ToggleSize.sm:
        return 14;
      case ToggleSize.md:
        return 18;
      case ToggleSize.lg:
        return 22;
    }
  }

  double _getThumbPadding() {
    switch (widget.size) {
      case ToggleSize.sm:
        return 3;
      case ToggleSize.md:
        return 3;
      case ToggleSize.lg:
        return 3;
    }
  }

  double _getGapSize() {
    switch (widget.size) {
      case ToggleSize.sm:
        return 8;
      case ToggleSize.md:
        return 12;
      case ToggleSize.lg:
        return 14;
    }
  }

  double _getLabelFontSize() {
    switch (widget.size) {
      case ToggleSize.sm:
        return AppTheme.fontSizeSm;
      case ToggleSize.md:
        return AppTheme.fontSizeMd;
      case ToggleSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getDescriptionFontSize() {
    switch (widget.size) {
      case ToggleSize.sm:
        return AppTheme.fontSizeXs;
      case ToggleSize.md:
        return AppTheme.fontSizeSm;
      case ToggleSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  Color _getTrackColor([double? colorProgress]) {
    if (widget.disabled) {
      return widget.value ? AppTheme.surfaceVariant : AppTheme.surfaceVariant;
    }

    if (widget.error) {
      return widget.value ? AppTheme.error : AppTheme.surfaceVariant;
    }

    // During animation, interpolate between inactive and active colors
    if (colorProgress != null) {
      if (colorProgress <= 0.0) {
        // First half of animation or before midpoint: inactive color
        return AppTheme.surfaceVariant;
      } else if (colorProgress >= 1.0) {
        // After animation completes: active color
        final activeColor = widget.activeColor ?? AppTheme.success;
        return activeColor;
      } else {
        // Second half of animation: interpolate between inactive and active
        final activeColor = widget.activeColor ?? AppTheme.success;
        return Color.lerp(
              AppTheme.surfaceVariant,
              activeColor,
              colorProgress,
            ) ??
            AppTheme.surfaceVariant;
      }
    }

    if (_isHovered && !widget.value) {
      return AppTheme.border;
    }

    if (widget.value) {
      return widget.activeColor ?? AppTheme.success;
    }

    return AppTheme.surfaceVariant;
  }

  Color _getThumbColor() {
    if (widget.disabled) {
      return AppTheme.textDisabled;
    }

    if (widget.error && widget.value) {
      return AppTheme.white;
    }

    return AppTheme.white;
  }

  List<BoxShadow>? _getThumbShadow() {
    if (widget.disabled) {
      return null;
    }

    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        blurRadius: 2,
        offset: const Offset(0, 1),
      ),
    ];
  }
}
