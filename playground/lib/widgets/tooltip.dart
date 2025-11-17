import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Tooltip position relative to the child widget
enum TooltipPosition { top, bottom, left, right }

/// Tooltip trigger mode
enum TooltipTrigger { hover, tap, longPress }

/// A customizable tooltip component similar to shadcn/ui Tooltip
///
/// Displays rich content in a floating overlay when triggered.
///
/// Example:
/// ```dart
/// // Basic tooltip
/// CNTooltip(
///   message: 'This is a tooltip',
///   child: Icon(Icons.info),
/// )
///
/// // Rich content tooltip
/// CNTooltip(
///   content: Text('Complex content here'),
///   position: TooltipPosition.right,
///   child: Button(...),
/// )
///
/// // Custom trigger
/// CNTooltip(
///   message: 'Tap me',
///   trigger: TooltipTrigger.tap,
///   child: Container(...),
/// )
/// ```
class CNTooltip extends StatefulWidget {
  const CNTooltip({
    super.key,
    this.message,
    this.content,
    required this.child,
    this.position = TooltipPosition.top,
    this.trigger = TooltipTrigger.hover,
    this.showArrow = true,
    this.backgroundColor,
    this.textColor,
    this.maxWidth = 200,
    this.padding,
    this.waitDuration = const Duration(milliseconds: 500),
    this.showDuration = const Duration(seconds: 2),
  }) : assert(
          message != null || content != null,
          'Either message or content must be provided',
        );

  /// Simple text message (for basic tooltips)
  final String? message;

  /// Rich content widget (for complex tooltips)
  final Widget? content;

  /// The widget that triggers the tooltip
  final Widget child;

  /// Position of tooltip relative to child
  final TooltipPosition position;

  /// How the tooltip is triggered
  final TooltipTrigger trigger;

  /// Whether to show the arrow pointer
  final bool showArrow;

  /// Background color (defaults to theme primary)
  final Color? backgroundColor;

  /// Text color (defaults to white)
  final Color? textColor;

  /// Maximum width of tooltip
  final double maxWidth;

  /// Custom padding
  final EdgeInsets? padding;

  /// Delay before showing tooltip on hover
  final Duration waitDuration;

  /// Duration to show tooltip (for tap/longPress)
  final Duration showDuration;

  @override
  State<CNTooltip> createState() => _CNTooltipState();
}

class _CNTooltipState extends State<CNTooltip> with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isShowing = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppTheme.durationFast,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _hideTooltip();
    _animationController.dispose();
    super.dispose();
  }

  void _showTooltip() {
    if (_isShowing) return;
    _isShowing = true;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();

    // Auto-hide for tap/longPress triggers
    if (widget.trigger != TooltipTrigger.hover) {
      Future.delayed(widget.showDuration, () {
        _hideTooltip();
      });
    }
  }

  void _hideTooltip() {
    if (!_isShowing) return;
    _isShowing = false;

    _animationController.reverse().then((_) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => _TooltipOverlay(
        targetOffset: offset,
        targetSize: size,
        position: widget.position,
        showArrow: widget.showArrow,
        backgroundColor: widget.backgroundColor ?? AppTheme.primary,
        maxWidth: widget.maxWidth,
        animation: _fadeAnimation,
        padding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: widget.content ??
            Text(
              widget.message!,
              style: TextStyle(
                color: widget.textColor ?? AppTheme.textOnPrimary,
                fontSize: AppTheme.fontSizeSm,
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget child = widget.child;

    switch (widget.trigger) {
      case TooltipTrigger.hover:
        child = MouseRegion(
          onEnter: (_) {
            Future.delayed(widget.waitDuration, () {
              if (mounted) _showTooltip();
            });
          },
          onExit: (_) => _hideTooltip(),
          child: child,
        );
        break;
      case TooltipTrigger.tap:
        child = GestureDetector(
          onTap: _showTooltip,
          child: child,
        );
        break;
      case TooltipTrigger.longPress:
        child = GestureDetector(
          onLongPress: _showTooltip,
          child: child,
        );
        break;
    }

    return child;
  }
}

class _TooltipOverlay extends StatelessWidget {
  const _TooltipOverlay({
    required this.targetOffset,
    required this.targetSize,
    required this.position,
    required this.showArrow,
    required this.backgroundColor,
    required this.maxWidth,
    required this.animation,
    required this.child,
    required this.padding,
  });

  final Offset targetOffset;
  final Size targetSize;
  final TooltipPosition position;
  final bool showArrow;
  final Color backgroundColor;
  final double maxWidth;
  final Animation<double> animation;
  final Widget child;
  final EdgeInsets padding;

  static const double arrowSize = 6;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final tooltipOffset = _calculateTooltipOffset(screenSize);

    return Positioned(
      left: tooltipOffset.dx,
      top: tooltipOffset.dy,
      child: FadeTransition(
        opacity: animation,
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showArrow && position == TooltipPosition.bottom)
                _buildArrow(pointing: AxisDirection.up),
              if (showArrow &&
                  (position == TooltipPosition.left ||
                      position == TooltipPosition.right))
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (position == TooltipPosition.right)
                      _buildArrow(pointing: AxisDirection.left),
                    _buildTooltipContent(),
                    if (position == TooltipPosition.left)
                      _buildArrow(pointing: AxisDirection.right),
                  ],
                )
              else
                _buildTooltipContent(),
              if (showArrow && position == TooltipPosition.top)
                _buildArrow(pointing: AxisDirection.down),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTooltipContent() {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        boxShadow: AppTheme.shadowMd,
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          color: AppTheme.textOnPrimary,
          fontSize: AppTheme.fontSizeSm,
        ),
        child: child,
      ),
    );
  }

  Widget _buildArrow({required AxisDirection pointing}) {
    return CustomPaint(
      size: const Size(arrowSize * 2, arrowSize),
      painter: _ArrowPainter(
        color: backgroundColor,
        direction: pointing,
      ),
    );
  }

  Offset _calculateTooltipOffset(Size screenSize) {
    double x = 0;
    double y = 0;
    const spacing = 8.0;

    switch (position) {
      case TooltipPosition.top:
        x = targetOffset.dx + (targetSize.width / 2) - (maxWidth / 2);
        y = targetOffset.dy - spacing - (showArrow ? arrowSize : 0);
        break;
      case TooltipPosition.bottom:
        x = targetOffset.dx + (targetSize.width / 2) - (maxWidth / 2);
        y = targetOffset.dy + targetSize.height + spacing + (showArrow ? arrowSize : 0);
        break;
      case TooltipPosition.left:
        x = targetOffset.dx - maxWidth - spacing - (showArrow ? arrowSize : 0);
        y = targetOffset.dy + (targetSize.height / 2);
        break;
      case TooltipPosition.right:
        x = targetOffset.dx + targetSize.width + spacing + (showArrow ? arrowSize : 0);
        y = targetOffset.dy + (targetSize.height / 2);
        break;
    }

    // Keep tooltip within screen bounds
    x = x.clamp(8.0, screenSize.width - maxWidth - 8.0);
    y = y.clamp(8.0, screenSize.height - 100);

    return Offset(x, y);
  }
}

class _ArrowPainter extends CustomPainter {
  final Color color;
  final AxisDirection direction;

  _ArrowPainter({required this.color, required this.direction});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    switch (direction) {
      case AxisDirection.up:
        path.moveTo(size.width / 2, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
        break;
      case AxisDirection.down:
        path.moveTo(0, 0);
        path.lineTo(size.width, 0);
        path.lineTo(size.width / 2, size.height);
        break;
      case AxisDirection.left:
        path.moveTo(0, size.height / 2);
        path.lineTo(size.width, 0);
        path.lineTo(size.width, size.height);
        break;
      case AxisDirection.right:
        path.moveTo(0, 0);
        path.lineTo(size.width, size.height / 2);
        path.lineTo(0, size.height);
        break;
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_ArrowPainter oldDelegate) =>
      color != oldDelegate.color || direction != oldDelegate.direction;
}
