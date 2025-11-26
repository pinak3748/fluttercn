import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Dropdown sizes
enum DropdownSize { sm, md, lg }

/// A customizable dropdown component similar to shadcn/ui Select
///
/// Supports single selection with smooth animations and customizable styling.
///
/// Example:
/// ```dart
/// // Basic dropdown
/// Dropdown<String>(
///   value: 'apple',
///   items: [
///     DropdownItem(value: 'apple', label: 'Apple'),
///     DropdownItem(value: 'banana', label: 'Banana'),
///   ],
///   onChanged: (value) => print(value),
/// )
///
/// // Dropdown with label
/// Dropdown<String>(
///   value: null,
///   placeholder: 'Select a fruit',
///   label: 'Favorite fruit',
///   items: [
///     DropdownItem(value: 'apple', label: 'Apple'),
///     DropdownItem(value: 'banana', label: 'Banana'),
///   ],
///   onChanged: (value) {},
/// )
///
/// // Dropdown with icons
/// Dropdown<String>(
///   value: 'dark',
///   items: [
///     DropdownItem(
///       value: 'light',
///       label: 'Light',
///       icon: Icons.light_mode,
///     ),
///     DropdownItem(
///       value: 'dark',
///       label: 'Dark',
///       icon: Icons.dark_mode,
///     ),
///   ],
///   onChanged: (value) {},
/// )
/// ```
class Dropdown<T> extends StatefulWidget {
  const Dropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.placeholder = 'Select an option',
    this.label,
    this.description,
    this.size = DropdownSize.md,
    this.disabled = false,
    this.error = false,
    this.errorText,
    this.width,
  });

  /// List of dropdown items
  final List<DropdownItem<T>> items;

  /// Current selected value
  final T? value;

  /// Placeholder text when no value is selected
  final String placeholder;

  /// Callback when selection changes
  final ValueChanged<T?>? onChanged;

  /// Optional label text
  final String? label;

  /// Optional description text below label
  final String? description;

  /// Dropdown size
  final DropdownSize size;

  /// Whether the dropdown is disabled
  final bool disabled;

  /// Whether to show error state
  final bool error;

  /// Optional error message
  final String? errorText;

  /// Optional width constraint for the dropdown
  final double? width;

  @override
  State<Dropdown<T>> createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<Dropdown<T>>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppTheme.durationFast,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _closeDropdown();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDropdown() {
    if (widget.disabled) return;

    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _closeDropdown,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx,
              top: offset.dy + size.height + 4,
              width: widget.width ?? size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 4),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(_getBorderRadius()),
                  color: Colors.transparent,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: 300,
                      minWidth: widget.width ?? size.width,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(_getBorderRadius()),
                      border: Border.all(color: AppTheme.border, width: 1),
                      boxShadow: AppTheme.shadowLg,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(_getBorderRadius()),
                      child: ListView.builder(
                        padding: EdgeInsets.all(_getItemPadding()),
                        shrinkWrap: true,
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          final item = widget.items[index];
                          final isSelected = widget.value == item.value;

                          return _DropdownMenuItem<T>(
                            item: item,
                            isSelected: isSelected,
                            size: widget.size,
                            onTap: () {
                              widget.onChanged?.call(item.value);
                              _closeDropdown();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedItem = widget.items.where((item) => item.value == widget.value).firstOrNull;

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
        CompositedTransformTarget(
          link: _layerLink,
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            cursor: widget.disabled
                ? SystemMouseCursors.basic
                : SystemMouseCursors.click,
            child: GestureDetector(
              onTap: _toggleDropdown,
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
                    child: AnimatedContainer(
                      duration: AppTheme.durationNormal,
                      width: widget.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: _getHorizontalPadding(),
                        vertical: _getVerticalPadding(),
                      ),
                      decoration: BoxDecoration(
                        color: widget.disabled
                            ? AppTheme.surfaceVariant
                            : AppTheme.surface,
                        borderRadius:
                            BorderRadius.circular(_getBorderRadius()),
                        border: Border.all(
                          color: _getBorderColor(),
                          width: _isOpen ? 2 : 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize:
                            widget.width == null ? MainAxisSize.min : MainAxisSize.max,
                        children: [
                          if (selectedItem?.icon != null) ...[
                            Icon(
                              selectedItem!.icon,
                              size: _getIconSize(),
                              color: widget.disabled
                                  ? AppTheme.textDisabled
                                  : AppTheme.textPrimary,
                            ),
                            SizedBox(width: _getIconGap()),
                          ],
                          Expanded(
                            child: Text(
                              selectedItem?.label ?? widget.placeholder,
                              style: TextStyle(
                                fontSize: _getFontSize(),
                                color: widget.disabled
                                    ? AppTheme.textDisabled
                                    : selectedItem == null
                                        ? AppTheme.textTertiary
                                        : AppTheme.textPrimary,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: AppTheme.spaceSm),
                          AnimatedRotation(
                            turns: _isOpen ? 0.5 : 0,
                            duration: AppTheme.durationFast,
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              size: _getIconSize(),
                              color: widget.disabled
                                  ? AppTheme.textDisabled
                                  : AppTheme.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
      case DropdownSize.sm:
        return AppTheme.radiusSm;
      case DropdownSize.md:
        return AppTheme.radiusMd;
      case DropdownSize.lg:
        return AppTheme.radiusLg;
    }
  }

  double _getHorizontalPadding() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.spaceSm;
      case DropdownSize.md:
        return AppTheme.spaceMd;
      case DropdownSize.lg:
        return AppTheme.spaceLg;
    }
  }

  double _getVerticalPadding() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.spaceXs;
      case DropdownSize.md:
        return AppTheme.spaceSm;
      case DropdownSize.lg:
        return AppTheme.spaceMd;
    }
  }

  double _getItemPadding() {
    switch (widget.size) {
      case DropdownSize.sm:
        return 4;
      case DropdownSize.md:
        return 6;
      case DropdownSize.lg:
        return 8;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.fontSizeSm;
      case DropdownSize.md:
        return AppTheme.fontSizeMd;
      case DropdownSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getLabelFontSize() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.fontSizeSm;
      case DropdownSize.md:
        return AppTheme.fontSizeMd;
      case DropdownSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getDescriptionFontSize() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.fontSizeXs;
      case DropdownSize.md:
        return AppTheme.fontSizeSm;
      case DropdownSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case DropdownSize.sm:
        return 16;
      case DropdownSize.md:
        return 18;
      case DropdownSize.lg:
        return 20;
    }
  }

  double _getIconGap() {
    switch (widget.size) {
      case DropdownSize.sm:
        return 6;
      case DropdownSize.md:
        return 8;
      case DropdownSize.lg:
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

    if (_isOpen) {
      return AppTheme.borderFocus;
    }

    if (_isHovered) {
      return AppTheme.borderFocus;
    }

    return AppTheme.border;
  }
}

/// Dropdown menu item widget
class _DropdownMenuItem<T> extends StatefulWidget {
  const _DropdownMenuItem({
    required this.item,
    required this.isSelected,
    required this.size,
    required this.onTap,
  });

  final DropdownItem<T> item;
  final bool isSelected;
  final DropdownSize size;
  final VoidCallback onTap;

  @override
  State<_DropdownMenuItem<T>> createState() => _DropdownMenuItemState<T>();
}

class _DropdownMenuItemState<T> extends State<_DropdownMenuItem<T>> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AppTheme.durationFast,
          padding: EdgeInsets.symmetric(
            horizontal: _getHorizontalPadding(),
            vertical: _getVerticalPadding(),
          ),
          margin: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? AppTheme.surfaceVariant
                : _isHovered
                    ? AppTheme.surfaceVariant.withValues(alpha: 0.5)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(_getBorderRadius()),
          ),
          child: Row(
            children: [
              if (widget.item.icon != null) ...[
                Icon(
                  widget.item.icon,
                  size: _getIconSize(),
                  color: widget.isSelected
                      ? AppTheme.textPrimary
                      : AppTheme.textSecondary,
                ),
                SizedBox(width: _getIconGap()),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.label,
                      style: TextStyle(
                        fontSize: _getFontSize(),
                        fontWeight: widget.isSelected
                            ? AppTheme.fontWeightMedium
                            : AppTheme.fontWeightRegular,
                        color: widget.isSelected
                            ? AppTheme.textPrimary
                            : AppTheme.textPrimary,
                      ),
                    ),
                    if (widget.item.description != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        widget.item.description!,
                        style: TextStyle(
                          fontSize: _getDescriptionFontSize(),
                          color: AppTheme.textTertiary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (widget.isSelected) ...[
                SizedBox(width: AppTheme.spaceSm),
                Icon(
                  Icons.check,
                  size: _getIconSize(),
                  color: AppTheme.textPrimary,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  double _getBorderRadius() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.radiusXs;
      case DropdownSize.md:
        return AppTheme.radiusSm;
      case DropdownSize.lg:
        return AppTheme.radiusMd;
    }
  }

  double _getHorizontalPadding() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.spaceSm;
      case DropdownSize.md:
        return AppTheme.spaceMd;
      case DropdownSize.lg:
        return AppTheme.spaceLg;
    }
  }

  double _getVerticalPadding() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.spaceXs;
      case DropdownSize.md:
        return AppTheme.spaceSm;
      case DropdownSize.lg:
        return AppTheme.spaceMd;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.fontSizeSm;
      case DropdownSize.md:
        return AppTheme.fontSizeMd;
      case DropdownSize.lg:
        return AppTheme.fontSizeLg;
    }
  }

  double _getDescriptionFontSize() {
    switch (widget.size) {
      case DropdownSize.sm:
        return AppTheme.fontSizeXs;
      case DropdownSize.md:
        return AppTheme.fontSizeSm;
      case DropdownSize.lg:
        return AppTheme.fontSizeMd;
    }
  }

  double _getIconSize() {
    switch (widget.size) {
      case DropdownSize.sm:
        return 16;
      case DropdownSize.md:
        return 18;
      case DropdownSize.lg:
        return 20;
    }
  }

  double _getIconGap() {
    switch (widget.size) {
      case DropdownSize.sm:
        return 6;
      case DropdownSize.md:
        return 8;
      case DropdownSize.lg:
        return 10;
    }
  }
}

/// Dropdown item model
class DropdownItem<T> {
  const DropdownItem({
    required this.value,
    required this.label,
    this.icon,
    this.description,
  });

  /// Value of the item
  final T value;

  /// Display label
  final String label;

  /// Optional icon
  final IconData? icon;

  /// Optional description text
  final String? description;
}
