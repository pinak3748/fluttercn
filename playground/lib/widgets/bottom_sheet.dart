import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Bottom sheet sizes
enum BottomSheetSize { sm, md, lg, full }

/// Bottom sheet types
enum BottomSheetType { modal, persistent }

/// A customizable bottom sheet component similar to shadcn/ui Sheet
///
/// Supports both modal and persistent bottom sheets with customizable styling.
///
/// Example:
/// ```dart
/// // Basic modal bottom sheet
/// showAppBottomSheet(
///   context: context,
///   builder: (context) => BottomSheetContent(
///     child: Text('Content here'),
///   ),
/// );
///
/// // Bottom sheet with header
/// showAppBottomSheet(
///   context: context,
///   builder: (context) => Column(
///     children: [
///       BottomSheetHeader(
///         title: BottomSheetTitle('Sheet Title'),
///         description: BottomSheetDescription('Description here'),
///       ),
///       BottomSheetContent(
///         child: YourContentWidget(),
///       ),
///       BottomSheetFooter(
///         child: YourActionsWidget(),
///       ),
///     ],
///   ),
/// );
///
/// // Scrollable bottom sheet
/// showAppBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   builder: (context) => BottomSheetContent(
///     scrollable: true,
///     child: YourScrollableContent(),
///   ),
/// );
/// ```

/// Shows a modal bottom sheet with consistent styling
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  BottomSheetSize size = BottomSheetSize.md,
  bool isScrollControlled = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: backgroundColor ?? Colors.transparent,
    elevation: elevation ?? 0,
    shape: shape,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppTheme.radiusXl),
            topRight: Radius.circular(AppTheme.radiusXl),
          ),
          boxShadow: AppTheme.shadowXl,
        ),
        constraints: BoxConstraints(
          maxHeight: _getSizeHeight(context, size),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (enableDrag) const _DragHandle(),
            Flexible(child: builder(context)),
          ],
        ),
      );
    },
  );
}

/// Helper to get height based on size
double _getSizeHeight(BuildContext context, BottomSheetSize size) {
  final screenHeight = MediaQuery.of(context).size.height;

  switch (size) {
    case BottomSheetSize.sm:
      return screenHeight * 0.3;
    case BottomSheetSize.md:
      return screenHeight * 0.5;
    case BottomSheetSize.lg:
      return screenHeight * 0.75;
    case BottomSheetSize.full:
      return screenHeight * 0.95;
  }
}

/// Drag handle widget for bottom sheets
class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spaceMd),
      child: Center(
        child: Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: AppTheme.border,
            borderRadius: BorderRadius.circular(AppTheme.radiusFull),
          ),
        ),
      ),
    );
  }
}

/// Bottom sheet header section - contains title, description, and optional close button
///
/// Example:
/// ```dart
/// BottomSheetHeader(
///   title: BottomSheetTitle('Title'),
///   description: BottomSheetDescription('Description'),
///   showCloseButton: true,
/// )
/// ```
class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    super.key,
    this.title,
    this.description,
    this.child,
    this.padding,
    this.showCloseButton = false,
    this.onClose,
  }) : assert(
         child == null || (title == null && description == null),
         'Cannot use both child and title/description. Use either composable or custom child.',
       );

  /// Sheet title widget
  final BottomSheetTitle? title;

  /// Sheet description widget
  final BottomSheetDescription? description;

  /// Custom child widget (alternative to title/description)
  final Widget? child;

  /// Custom padding (defaults to standard header padding)
  final EdgeInsets? padding;

  /// Whether to show close button
  final bool showCloseButton;

  /// Callback when close button is pressed
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    final defaultPadding =
        padding ??
        EdgeInsets.fromLTRB(
          AppTheme.spaceLg,
          AppTheme.spaceXs,
          AppTheme.spaceLg,
          AppTheme.spaceMd,
        );

    if (child != null) {
      return Padding(
        padding: defaultPadding,
        child: showCloseButton
            ? Row(
                children: [
                  Expanded(child: child!),
                  IconButton(
                    onPressed: onClose ?? () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    color: AppTheme.textSecondary,
                    iconSize: 20,
                  ),
                ],
              )
            : child!,
      );
    }

    final List<Widget> children = [];
    if (title != null) {
      children.add(title!);
    }
    if (description != null) {
      if (title != null) {
        children.add(SizedBox(height: AppTheme.spaceSm));
      }
      children.add(description!);
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );

    if (showCloseButton) {
      content = Row(
        children: [
          Expanded(child: content),
          IconButton(
            onPressed: onClose ?? () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close),
            color: AppTheme.textSecondary,
            iconSize: 20,
          ),
        ],
      );
    }

    return Padding(
      padding: defaultPadding,
      child: content,
    );
  }
}

/// Bottom sheet title widget - styled title text
///
/// Example:
/// ```dart
/// BottomSheetTitle('Sheet Title')
/// ```
class BottomSheetTitle extends StatelessWidget {
  const BottomSheetTitle(this.text, {super.key, this.style});

  /// The title text
  final String text;

  /// Custom text style (will merge with default title style)
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppTheme.textPrimary,
      height: 1.2,
    );

    return Text(
      text,
      style: style != null ? defaultStyle.merge(style) : defaultStyle,
    );
  }
}

/// Bottom sheet description widget - styled description text
///
/// Example:
/// ```dart
/// BottomSheetDescription('Sheet description text')
/// ```
class BottomSheetDescription extends StatelessWidget {
  const BottomSheetDescription(this.text, {super.key, this.style});

  /// The description text
  final String text;

  /// Custom text style (will merge with default description style)
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppTheme.textTertiary,
      height: 1.5,
    );

    return Text(
      text,
      style: style != null ? defaultStyle.merge(style) : defaultStyle,
    );
  }
}

/// Bottom sheet content section - main content area
///
/// Example:
/// ```dart
/// BottomSheetContent(
///   child: YourContentWidget(),
/// )
///
/// // Scrollable content
/// BottomSheetContent(
///   scrollable: true,
///   child: YourLongContent(),
/// )
/// ```
class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.child,
    this.padding,
    this.scrollable = false,
  });

  /// The content widget
  final Widget child;

  /// Custom padding (defaults to standard content padding)
  final EdgeInsets? padding;

  /// Whether the content should be scrollable
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final defaultPadding = padding ?? AppTheme.paddingLg;

    if (scrollable) {
      return SingleChildScrollView(
        padding: defaultPadding,
        child: child,
      );
    }

    return Padding(
      padding: defaultPadding,
      child: child,
    );
  }
}

/// Bottom sheet footer section - actions and additional information
///
/// Example:
/// ```dart
/// BottomSheetFooter(
///   child: Row(
///     children: [
///       Expanded(child: Button(...)),
///       SizedBox(width: 8),
///       Expanded(child: Button(...)),
///     ],
///   ),
/// )
/// ```
class BottomSheetFooter extends StatelessWidget {
  const BottomSheetFooter({super.key, required this.child, this.padding});

  /// The footer widget (typically buttons or actions)
  final Widget child;

  /// Custom padding (defaults to standard footer padding)
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final defaultPadding =
        padding ??
        EdgeInsets.fromLTRB(
          AppTheme.spaceLg,
          AppTheme.spaceMd,
          AppTheme.spaceLg,
          AppTheme.spaceLg,
        );

    return Padding(
      padding: defaultPadding,
      child: child,
    );
  }
}
