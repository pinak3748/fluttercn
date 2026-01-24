import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Accordion sizes
enum AccordionSize { sm, md, lg }

/// A single accordion item data model
class AccordionItem {
  const AccordionItem({
    required this.title,
    required this.content,
    this.leading,
    this.disabled = false,
  });

  /// Title displayed in the header
  final String title;

  /// Content displayed when expanded
  final Widget content;

  /// Optional leading widget (icon)
  final Widget? leading;

  /// Whether this item is disabled
  final bool disabled;
}

/// A customizable accordion component similar to shadcn/ui Accordion
///
/// Supports single and multiple expansion modes with smooth animations.
///
/// Example:
/// ```dart
/// // Single expansion accordion
/// Accordion(
///   items: [
///     AccordionItem(
///       title: 'Section 1',
///       content: Text('Content for section 1'),
///     ),
///     AccordionItem(
///       title: 'Section 2',
///       content: Text('Content for section 2'),
///     ),
///   ],
/// )
///
/// // Multiple expansion accordion
/// Accordion(
///   allowMultiple: true,
///   items: [
///     AccordionItem(
///       title: 'FAQ 1',
///       content: Text('Answer 1'),
///     ),
///     AccordionItem(
///       title: 'FAQ 2',
///       content: Text('Answer 2'),
///     ),
///   ],
/// )
/// ```
class Accordion extends StatefulWidget {
  const Accordion({
    super.key,
    required this.items,
    this.allowMultiple = false,
    this.initialExpandedIndexes = const [],
    this.size = AccordionSize.md,
    this.onExpansionChanged,
    this.dividerColor,
    this.collapsedIconColor,
    this.expandedIconColor,
  });

  /// List of accordion items
  final List<AccordionItem> items;

  /// Whether multiple items can be expanded at once
  final bool allowMultiple;

  /// Initially expanded item indexes
  final List<int> initialExpandedIndexes;

  /// Accordion size
  final AccordionSize size;

  /// Callback when expansion state changes
  final void Function(int index, bool isExpanded)? onExpansionChanged;

  /// Custom divider color
  final Color? dividerColor;

  /// Icon color when collapsed
  final Color? collapsedIconColor;

  /// Icon color when expanded
  final Color? expandedIconColor;

  @override
  State<Accordion> createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  late Set<int> _expandedIndexes;

  @override
  void initState() {
    super.initState();
    _expandedIndexes = Set<int>.from(widget.initialExpandedIndexes);
  }

  void _handleTap(int index) {
    final item = widget.items[index];
    if (item.disabled) return;

    setState(() {
      if (_expandedIndexes.contains(index)) {
        _expandedIndexes.remove(index);
        widget.onExpansionChanged?.call(index, false);
      } else {
        if (!widget.allowMultiple) {
          _expandedIndexes.clear();
        }
        _expandedIndexes.add(index);
        widget.onExpansionChanged?.call(index, true);
      }
    });
  }

  double _getTitleFontSize() {
    switch (widget.size) {
      case AccordionSize.sm:
        return AppTheme.fontSizeSm;
      case AccordionSize.md:
        return AppTheme.fontSizeMd;
      case AccordionSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getContentFontSize() {
    switch (widget.size) {
      case AccordionSize.sm:
        return AppTheme.fontSizeXs;
      case AccordionSize.md:
        return AppTheme.fontSizeSm;
      case AccordionSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  EdgeInsets _getHeaderPadding() {
    switch (widget.size) {
      case AccordionSize.sm:
        return const EdgeInsets.symmetric(vertical: 10, horizontal: 0);
      case AccordionSize.md:
        return const EdgeInsets.symmetric(vertical: 14, horizontal: 0);
      case AccordionSize.lg:
        return const EdgeInsets.symmetric(vertical: 18, horizontal: 0);
    }
  }

  EdgeInsets _getContentPadding() {
    switch (widget.size) {
      case AccordionSize.sm:
        return const EdgeInsets.only(bottom: 12);
      case AccordionSize.md:
        return const EdgeInsets.only(bottom: 16);
      case AccordionSize.lg:
        return const EdgeInsets.only(bottom: 20);
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case AccordionSize.sm:
        return 16;
      case AccordionSize.md:
        return 20;
      case AccordionSize.lg:
        return 24;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        final isExpanded = _expandedIndexes.contains(index);
        final isLast = index == widget.items.length - 1;

        return _AccordionTile(
          item: item,
          isExpanded: isExpanded,
          isLast: isLast,
          onTap: () => _handleTap(index),
          titleFontSize: _getTitleFontSize(),
          contentFontSize: _getContentFontSize(),
          headerPadding: _getHeaderPadding(),
          contentPadding: _getContentPadding(),
          iconSize: _getIconSize(),
          dividerColor: widget.dividerColor,
          collapsedIconColor: widget.collapsedIconColor,
          expandedIconColor: widget.expandedIconColor,
        );
      }),
    );
  }
}

class _AccordionTile extends StatefulWidget {
  const _AccordionTile({
    required this.item,
    required this.isExpanded,
    required this.isLast,
    required this.onTap,
    required this.titleFontSize,
    required this.contentFontSize,
    required this.headerPadding,
    required this.contentPadding,
    required this.iconSize,
    this.dividerColor,
    this.collapsedIconColor,
    this.expandedIconColor,
  });

  final AccordionItem item;
  final bool isExpanded;
  final bool isLast;
  final VoidCallback onTap;
  final double titleFontSize;
  final double contentFontSize;
  final EdgeInsets headerPadding;
  final EdgeInsets contentPadding;
  final double iconSize;
  final Color? dividerColor;
  final Color? collapsedIconColor;
  final Color? expandedIconColor;

  @override
  State<_AccordionTile> createState() => _AccordionTileState();
}

class _AccordionTileState extends State<_AccordionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconRotation;
  late Animation<double> _heightFactor;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppTheme.durationNormal,
      vsync: this,
    );
    _iconRotation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _heightFactor = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isExpanded) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_AccordionTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded != widget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getIconColor() {
    if (widget.item.disabled) {
      return AppTheme.textDisabled;
    }
    if (widget.isExpanded) {
      return widget.expandedIconColor ?? AppTheme.textPrimary;
    }
    return widget.collapsedIconColor ?? AppTheme.textSecondary;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          cursor: widget.item.disabled
              ? SystemMouseCursors.basic
              : SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.item.disabled ? null : widget.onTap,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: widget.headerPadding,
              child: Row(
                children: [
                  if (widget.item.leading != null) ...[
                    widget.item.leading!,
                    SizedBox(width: AppTheme.spaceMd),
                  ],
                  Expanded(
                    child: Text(
                      widget.item.title,
                      style: TextStyle(
                        fontSize: widget.titleFontSize,
                        fontWeight: AppTheme.fontWeightMedium,
                        color: widget.item.disabled
                            ? AppTheme.textDisabled
                            : _isHovered
                                ? AppTheme.textPrimary
                                : AppTheme.textPrimary,
                        decoration: _isHovered && !widget.item.disabled
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: _iconRotation,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: widget.iconSize,
                      color: _getIconColor(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Content
        ClipRect(
          child: AnimatedBuilder(
            animation: _heightFactor,
            builder: (context, child) {
              return Align(
                alignment: Alignment.topLeft,
                heightFactor: _heightFactor.value,
                child: child,
              );
            },
            child: Padding(
              padding: widget.contentPadding,
              child: DefaultTextStyle(
                style: TextStyle(
                  fontSize: widget.contentFontSize,
                  color: widget.item.disabled
                      ? AppTheme.textDisabled
                      : AppTheme.textSecondary,
                  height: 1.6,
                ),
                child: widget.item.content,
              ),
            ),
          ),
        ),
        // Divider
        if (!widget.isLast)
          Divider(
            height: 1,
            thickness: 1,
            color: widget.dividerColor ?? AppTheme.border,
          ),
      ],
    );
  }
}
