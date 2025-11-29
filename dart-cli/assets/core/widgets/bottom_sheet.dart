import 'package:flutter/material.dart';

import '../config/theme.dart';

// ═══════════════════════════════════════════════════════════════
// ENUMS & TYPES
// ═══════════════════════════════════════════════════════════════

/// Bottom sheet sizes with predefined height percentages
enum BottomSheetSize {
  /// Small - 30% of usable screen height
  sm,

  /// Medium - 50% of usable screen height (default)
  md,

  /// Large - 75% of usable screen height
  lg,

  /// Full - 95% of usable screen height
  full,
}

/// Bottom sheet types
enum BottomSheetType { modal, persistent }

// ═══════════════════════════════════════════════════════════════
// MAIN BOTTOM SHEET FUNCTION
// ═══════════════════════════════════════════════════════════════

/// A customizable bottom sheet component similar to shadcn/ui Sheet
///
/// Supports both modal and persistent bottom sheets with customizable styling.
/// Automatically handles safe areas, keyboard avoidance, and device-specific padding.
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
/// // Bottom sheet with header and footer
/// showAppBottomSheet(
///   context: context,
///   builder: (context) => Column(
///     mainAxisSize: MainAxisSize.min,
///     children: [
///       BottomSheetHeader(
///         title: BottomSheetTitle('Sheet Title'),
///         description: BottomSheetDescription('Description here'),
///         showCloseButton: true,
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
///   builder: (context) => BottomSheetContent(
///     scrollable: true,
///     child: YourScrollableContent(),
///   ),
/// );
///
/// // Custom size
/// showAppBottomSheet(
///   context: context,
///   size: BottomSheetSize.lg,
///   builder: (context) => YourContent(),
/// );
/// ```
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  BottomSheetSize size = BottomSheetSize.md,
  bool isScrollControlled = true,
  bool isDismissible = true,
  bool enableDrag = true,
  bool useSafeArea = true,
  bool resizeToAvoidBottomInset = true,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Color? barrierColor,
  String? barrierLabel,
  String? semanticLabel,
  Duration? transitionDuration,
  Clip? clipBehavior,
  BoxConstraints? constraints,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    backgroundColor: backgroundColor ?? Colors.transparent,
    elevation: elevation ?? 0,
    shape: shape,
    barrierColor: barrierColor ?? Colors.black54,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
    clipBehavior: clipBehavior ?? Clip.antiAlias,
    transitionAnimationController: transitionDuration != null
        ? AnimationController(
            duration: transitionDuration,
            vsync: Navigator.of(context),
          )
        : null,
    builder: (context) {
      return _BottomSheetContainer(
        size: size,
        enableDrag: enableDrag,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        semanticLabel: semanticLabel,
        constraints: constraints,
        child: builder(context),
      );
    },
  );
}

// ═══════════════════════════════════════════════════════════════
// PERSISTENT BOTTOM SHEET HELPER
// ═══════════════════════════════════════════════════════════════

/// Shows a persistent bottom sheet (remains visible until explicitly dismissed)
///
/// Unlike modal bottom sheets, persistent sheets don't block interaction with
/// the rest of the screen and don't have a barrier overlay.
///
/// Example:
/// ```dart
/// final controller = showPersistentAppBottomSheet(
///   context: context,
///   builder: (context) => YourContent(),
/// );
///
/// // Later, dismiss it:
/// controller.close();
/// ```
PersistentBottomSheetController showPersistentAppBottomSheet({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  bool enableDrag = true,
  AnimationController? transitionAnimationController,
}) {
  final scaffoldState = Scaffold.of(context);

  return scaffoldState.showBottomSheet(
    (context) => Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppTheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppTheme.radiusXl),
          topRight: Radius.circular(AppTheme.radiusXl),
        ),
        boxShadow: AppTheme.shadowXl,
      ),
      constraints: constraints,
      child: builder(context),
    ),
    backgroundColor: Colors.transparent,
    elevation: elevation ?? 0,
    shape: shape,
    clipBehavior: clipBehavior ?? Clip.antiAlias,
    enableDrag: enableDrag,
    transitionAnimationController: transitionAnimationController,
  );
}

// ═══════════════════════════════════════════════════════════════
// INTERNAL CONTAINER WIDGET
// ═══════════════════════════════════════════════════════════════

/// Internal widget that wraps the bottom sheet content with proper styling
/// and safe area handling
class _BottomSheetContainer extends StatelessWidget {
  const _BottomSheetContainer({
    required this.child,
    required this.size,
    required this.enableDrag,
    required this.resizeToAvoidBottomInset,
    this.semanticLabel,
    this.constraints,
  });

  final Widget child;
  final BottomSheetSize size;
  final bool enableDrag;
  final bool resizeToAvoidBottomInset;
  final String? semanticLabel;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomInset = resizeToAvoidBottomInset
        ? mediaQuery.viewInsets.bottom
        : 0.0;
    final bottomPadding = mediaQuery.padding.bottom;

    return Semantics(
      label: semanticLabel ?? 'Bottom sheet',
      container: true,
      child: AnimatedPadding(
        padding: EdgeInsets.only(bottom: bottomInset),
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppTheme.radiusXl),
              topRight: Radius.circular(AppTheme.radiusXl),
            ),
            boxShadow: AppTheme.shadowXl,
          ),
          constraints:
              constraints ??
              BoxConstraints(
                maxHeight: _getSizeHeight(context, size),
                minHeight: 0,
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (enableDrag) const _DragHandle(),
              Flexible(child: child),
              // Add bottom safe area padding when keyboard is not visible
              if (bottomInset == 0 && bottomPadding > 0)
                SizedBox(height: bottomPadding),
            ],
          ),
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// SIZE CALCULATION
// ═══════════════════════════════════════════════════════════════

/// Helper to calculate height based on size, accounting for safe areas
double _getSizeHeight(BuildContext context, BottomSheetSize size) {
  final mediaQuery = MediaQuery.of(context);
  final screenHeight = mediaQuery.size.height;
  final topPadding = mediaQuery.padding.top;
  final bottomPadding = mediaQuery.padding.bottom;

  // Calculate usable height (excluding status bar and safe areas)
  final usableHeight = screenHeight - topPadding - bottomPadding;

  switch (size) {
    case BottomSheetSize.sm:
      return usableHeight * 0.3;
    case BottomSheetSize.md:
      return usableHeight * 0.5;
    case BottomSheetSize.lg:
      return usableHeight * 0.75;
    case BottomSheetSize.full:
      return usableHeight * 0.95;
  }
}

// ═══════════════════════════════════════════════════════════════
// DRAG HANDLE
// ═══════════════════════════════════════════════════════════════

/// Drag handle widget for bottom sheets - visual indicator for swipe gestures
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

// ═══════════════════════════════════════════════════════════════
// BOTTOM SHEET HEADER
// ═══════════════════════════════════════════════════════════════

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
        const EdgeInsets.fromLTRB(
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
                  _CloseButton(onClose: onClose),
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
        children.add(const SizedBox(height: AppTheme.spaceSm));
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
          _CloseButton(onClose: onClose),
        ],
      );
    }

    return Padding(padding: defaultPadding, child: content);
  }
}

/// Internal close button widget
class _CloseButton extends StatelessWidget {
  const _CloseButton({this.onClose});

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClose ?? () => Navigator.of(context).pop(),
      icon: const Icon(Icons.close),
      color: AppTheme.textSecondary,
      iconSize: 20,
      tooltip: 'Close',
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// BOTTOM SHEET TITLE
// ═══════════════════════════════════════════════════════════════

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

// ═══════════════════════════════════════════════════════════════
// BOTTOM SHEET DESCRIPTION
// ═══════════════════════════════════════════════════════════════

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

// ═══════════════════════════════════════════════════════════════
// BOTTOM SHEET CONTENT
// ═══════════════════════════════════════════════════════════════

/// Bottom sheet content section - main content area with safe area support
///
/// Automatically adds bottom safe area padding to prevent content from
/// being hidden behind system navigation bars or home indicators.
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
///
/// // With custom scroll physics
/// BottomSheetContent(
///   scrollable: true,
///   physics: BouncingScrollPhysics(),
///   child: YourContent(),
/// )
/// ```
class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    super.key,
    required this.child,
    this.padding,
    this.scrollable = false,
    this.physics,
    this.scrollController,
    this.addAutomaticKeepAlive = true,
  });

  /// The content widget
  final Widget child;

  /// Custom padding (defaults to standard content padding)
  final EdgeInsets? padding;

  /// Whether the content should be scrollable
  final bool scrollable;

  /// Scroll physics for scrollable content
  final ScrollPhysics? physics;

  /// Scroll controller for external control
  final ScrollController? scrollController;

  /// Whether to keep scroll position alive when scrollable
  final bool addAutomaticKeepAlive;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomSafeArea = mediaQuery.padding.bottom;
    final bottomInset = mediaQuery.viewInsets.bottom;

    // Only add safe area padding if keyboard is not visible
    final additionalBottomPadding = bottomInset > 0 ? 0.0 : bottomSafeArea;

    final defaultPadding = padding ?? AppTheme.paddingLg;
    final safePadding = defaultPadding.copyWith(
      bottom: defaultPadding.bottom + additionalBottomPadding,
    );

    if (scrollable) {
      return SingleChildScrollView(
        controller: scrollController,
        physics: physics ?? const ClampingScrollPhysics(),
        padding: safePadding,
        child: child,
      );
    }

    return Padding(padding: safePadding, child: child);
  }
}

// ═══════════════════════════════════════════════════════════════
// BOTTOM SHEET FOOTER
// ═══════════════════════════════════════════════════════════════

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
        const EdgeInsets.fromLTRB(
          AppTheme.spaceLg,
          AppTheme.spaceMd,
          AppTheme.spaceLg,
          AppTheme.spaceLg,
        );

    return Padding(padding: defaultPadding, child: child);
  }
}

// ═══════════════════════════════════════════════════════════════
// HELPER WIDGETS
// ═══════════════════════════════════════════════════════════════

/// Helper widget for arranging multiple action buttons in bottom sheets
///
/// Example:
/// ```dart
/// BottomSheetActions(
///   primaryAction: Button(
///     onPressed: () => print('Primary'),
///     child: Text('Confirm'),
///   ),
///   secondaryAction: Button(
///     variant: ButtonVariant.outline,
///     onPressed: () => print('Secondary'),
///     child: Text('Cancel'),
///   ),
/// )
/// ```
class BottomSheetActions extends StatelessWidget {
  const BottomSheetActions({
    super.key,
    this.primaryAction,
    this.secondaryAction,
    this.spacing = AppTheme.spaceMd,
    this.direction = Axis.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.end,
  });

  /// Primary action button (typically on the right)
  final Widget? primaryAction;

  /// Secondary action button (typically on the left)
  final Widget? secondaryAction;

  /// Spacing between buttons
  final double spacing;

  /// Layout direction (horizontal or vertical)
  final Axis direction;

  /// Main axis alignment for horizontal layout
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (secondaryAction != null) {
      children.add(Expanded(child: secondaryAction!));
    }

    if (secondaryAction != null && primaryAction != null) {
      children.add(
        SizedBox(
          width: direction == Axis.horizontal ? spacing : 0,
          height: direction == Axis.vertical ? spacing : 0,
        ),
      );
    }

    if (primaryAction != null) {
      children.add(Expanded(child: primaryAction!));
    }

    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return direction == Axis.horizontal
        ? Row(mainAxisAlignment: mainAxisAlignment, children: children)
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          );
  }
}

/// Loading overlay for bottom sheets
///
/// Shows a loading indicator over the content while an async operation is in progress.
///
/// Example:
/// ```dart
/// BottomSheetLoadingOverlay(
///   isLoading: _isLoading,
///   child: YourContent(),
/// )
/// ```
class BottomSheetLoadingOverlay extends StatelessWidget {
  const BottomSheetLoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingWidget,
    this.loadingText,
  });

  /// Whether to show the loading overlay
  final bool isLoading;

  /// The content widget
  final Widget child;

  /// Custom loading widget (defaults to CircularProgressIndicator)
  final Widget? loadingWidget;

  /// Optional loading text
  final String? loadingText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: AppTheme.surface.withOpacity(0.8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    loadingWidget ??
                        CircularProgressIndicator(color: AppTheme.primary),
                    if (loadingText != null) ...[
                      const SizedBox(height: AppTheme.spaceMd),
                      Text(
                        loadingText!,
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

// ═══════════════════════════════════════════════════════════════
// PRE-BUILT TEMPLATES
// ═══════════════════════════════════════════════════════════════

/// Shows a confirmation bottom sheet with customizable actions
///
/// Returns `true` if confirmed, `false` if cancelled, or `null` if dismissed.
///
/// Example:
/// ```dart
/// final confirmed = await showConfirmationBottomSheet(
///   context: context,
///   title: 'Delete Item',
///   description: 'Are you sure you want to delete this item? This action cannot be undone.',
///   confirmText: 'Delete',
///   isDestructive: true,
/// );
///
/// if (confirmed == true) {
///   // Handle confirmation
/// }
/// ```
Future<bool?> showConfirmationBottomSheet({
  required BuildContext context,
  required String title,
  required String description,
  String confirmText = 'Confirm',
  String cancelText = 'Cancel',
  bool isDestructive = false,
  Widget? icon,
}) {
  return showAppBottomSheet<bool>(
    context: context,
    size: BottomSheetSize.sm,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Padding(
            padding: const EdgeInsets.only(top: AppTheme.spaceLg),
            child: icon,
          ),
          const SizedBox(height: AppTheme.spaceMd),
        ],
        BottomSheetHeader(
          title: BottomSheetTitle(title),
          description: BottomSheetDescription(description),
        ),
        BottomSheetFooter(
          child: BottomSheetActions(
            secondaryAction: _buildOutlineButton(
              context: context,
              text: cancelText,
              onPressed: () => Navigator.pop(context, false),
            ),
            primaryAction: _buildPrimaryButton(
              context: context,
              text: confirmText,
              isDestructive: isDestructive,
              onPressed: () => Navigator.pop(context, true),
            ),
          ),
        ),
      ],
    ),
  );
}

// Helper button builders for templates
Widget _buildPrimaryButton({
  required BuildContext context,
  required String text,
  required VoidCallback onPressed,
  bool isDestructive = false,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: isDestructive ? AppTheme.error : AppTheme.primary,
      foregroundColor: AppTheme.white,
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spaceLg,
        vertical: AppTheme.spaceMd,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      ),
    ),
    child: Text(text),
  );
}

Widget _buildOutlineButton({
  required BuildContext context,
  required String text,
  required VoidCallback onPressed,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      foregroundColor: AppTheme.textPrimary,
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spaceLg,
        vertical: AppTheme.spaceMd,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      ),
      side: BorderSide(color: AppTheme.border, width: 1),
    ),
    child: Text(text),
  );
}
