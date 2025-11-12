import 'package:flutter/material.dart';

import '../theme/radius.dart';
import '../theme/spacing.dart';
import '../theme/theme_extensions.dart';

/// Main Card component - container for card sections
///
/// Supports both composable structure (header, content, footer) and
/// backward-compatible single child usage.
///
/// Example with composable structure:
/// ```dart
/// CNCard(
///   header: CardHeader(
///     title: CardTitle('Card Title'),
///     description: CardDescription('Card description text'),
///   ),
///   content: CardContent(
///     child: YourContentWidget(),
///   ),
///   footer: CardFooter(
///     child: YourActionsWidget(),
///   ),
/// )
/// ```
///
/// Example with single child (backward compatible):
/// ```dart
/// CNCard(
///   child: YourContentWidget(),
/// )
/// ```
class CNCard extends StatefulWidget {
  const CNCard({
    super.key,
    this.header,
    this.content,
    this.footer,
    this.child,
    this.onTap,
    this.padding,
  }) : assert(
         child == null || (header == null && content == null && footer == null),
         'Cannot use both child and header/content/footer. Use either composable structure or single child.',
       );

  /// Header section of the card
  final CardHeader? header;

  /// Content section of the card
  final CardContent? content;

  /// Footer section of the card
  final CardFooter? footer;

  /// Single child (for backward compatibility)
  /// Cannot be used together with header/content/footer
  final Widget? child;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Custom padding for the entire card (only used when using single child)
  final EdgeInsets? padding;

  @override
  State<CNCard> createState() => _CNCardState();
}

class _CNCardState extends State<CNCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTap != null) {
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTap != null) {
      _animationController.reverse();
    }
  }

  void _onTapCancel() {
    if (widget.onTap != null) {
      _animationController.reverse();
    }
  }

  void _onHover(bool isHovered) {
    if (widget.onTap != null) {
      setState(() => _isHovered = isHovered);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            cursor: widget.onTap != null
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: context.card,
                borderRadius: BorderRadius.circular(AppRadius.xl),
                border: Border.all(color: context.border, width: 1),
                boxShadow: _isHovered && widget.onTap != null
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: context.isDark ? 0.3 : 0.1,
                          ),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  onTapCancel: _onTapCancel,
                  borderRadius: BorderRadius.circular(AppRadius.xl),
                  splashColor: context.accent.withValues(alpha: 0.1),
                  highlightColor: context.accent.withValues(alpha: 0.05),
                  child: _buildContent(context),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    // Backward compatible: single child
    if (widget.child != null) {
      return Padding(
        padding: widget.padding ?? EdgeInsets.all(AppSpacing.md),
        child: DefaultTextStyle(
          style: TextStyle(color: context.cardForeground),
          child: widget.child!,
        ),
      );
    }

    // Composable structure: header, content, footer
    final List<Widget> children = [];

    if (widget.header != null) {
      children.add(widget.header!);
    }

    if (widget.content != null) {
      // Add divider if header exists
      if (widget.header != null) {
        children.add(Divider(height: 1, thickness: 1, color: context.border));
      }
      children.add(widget.content!);
    }

    if (widget.footer != null) {
      // Add divider if header or content exists
      if (widget.header != null || widget.content != null) {
        children.add(Divider(height: 1, thickness: 1, color: context.border));
      }
      children.add(widget.footer!);
    }

    return DefaultTextStyle(
      style: TextStyle(color: context.cardForeground),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

/// Card header section - contains title and description
///
/// Example:
/// ```dart
/// CardHeader(
///   title: CardTitle('Title'),
///   description: CardDescription('Description'),
/// )
/// ```
class CardHeader extends StatelessWidget {
  const CardHeader({
    super.key,
    this.title,
    this.description,
    this.child,
    this.padding,
  }) : assert(
         child == null || (title == null && description == null),
         'Cannot use both child and title/description. Use either composable or custom child.',
       );

  /// Card title widget
  final CardTitle? title;

  /// Card description widget
  final CardDescription? description;

  /// Custom child widget (alternative to title/description)
  final Widget? child;

  /// Custom padding (defaults to standard header padding)
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final defaultPadding =
        padding ??
        EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.lg,
          AppSpacing.md,
        );

    if (child != null) {
      return Padding(padding: defaultPadding, child: child!);
    }

    final List<Widget> children = [];
    if (title != null) {
      children.add(title!);
    }
    if (description != null) {
      if (title != null) {
        children.add(SizedBox(height: AppSpacing.sm));
      }
      children.add(description!);
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: defaultPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

/// Card title widget - styled title text
///
/// Example:
/// ```dart
/// CardTitle('Card Title')
/// ```
class CardTitle extends StatelessWidget {
  const CardTitle(this.text, {super.key, this.style});

  /// The title text
  final String text;

  /// Custom text style (will merge with default title style)
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: context.cardForeground,
      height: 1.2,
    );

    return Text(
      text,
      style: style != null ? defaultStyle.merge(style) : defaultStyle,
    );
  }
}

/// Card description widget - styled description text
///
/// Example:
/// ```dart
/// CardDescription('Card description text')
/// ```
class CardDescription extends StatelessWidget {
  const CardDescription(this.text, {super.key, this.style});

  /// The description text
  final String text;

  /// Custom text style (will merge with default description style)
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: context.mutedForeground,
      height: 1.5,
    );

    return Text(
      text,
      style: style != null ? defaultStyle.merge(style) : defaultStyle,
    );
  }
}

/// Card content section - main content area
///
/// Example:
/// ```dart
/// CardContent(
///   child: YourContentWidget(),
/// )
/// ```
class CardContent extends StatelessWidget {
  const CardContent({super.key, required this.child, this.padding});

  /// The content widget
  final Widget child;

  /// Custom padding (defaults to standard content padding)
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final defaultPadding = padding ?? EdgeInsets.all(AppSpacing.lg);

    return Padding(padding: defaultPadding, child: child);
  }
}

/// Card footer section - actions and additional information
///
/// Example:
/// ```dart
/// CardFooter(
///   child: Row(
///     children: [
///       Button(...),
///       Button(...),
///     ],
///   ),
/// )
/// ```
class CardFooter extends StatelessWidget {
  const CardFooter({super.key, required this.child, this.padding});

  /// The footer widget (typically buttons or actions)
  final Widget child;

  /// Custom padding (defaults to standard footer padding)
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final defaultPadding =
        padding ??
        EdgeInsets.fromLTRB(
          AppSpacing.lg,
          AppSpacing.md,
          AppSpacing.lg,
          AppSpacing.lg,
        );

    return Padding(padding: defaultPadding, child: child);
  }
}
