import 'package:flutter/material.dart';

import '../config/theme.dart';

/// Avatar sizes
enum AvatarSize { xs, sm, md, lg, xl, xl2 }

/// Avatar status indicator position
enum StatusPosition { topRight, topLeft, bottomRight, bottomLeft }

/// A customizable avatar component similar to shadcn/ui Avatar
///
/// Supports multiple image sources with automatic fallback:
/// 1. Network images (with loading and error handling)
/// 2. Asset images
/// 3. Fallback to initials from name
/// 4. Custom fallback widget
///
/// Example:
/// ```dart
/// // Network image with fallback
/// Avatar(
///   imageUrl: 'https://example.com/avatar.jpg',
///   fallbackName: 'John Doe',
/// )
///
/// // Asset image
/// Avatar(
///   assetPath: 'assets/avatar.png',
///   fallbackName: 'Jane Smith',
/// )
///
/// // Initials only
/// Avatar(
///   fallbackName: 'Alice Bob',
/// )
/// ```
class Avatar extends StatefulWidget {
  const Avatar({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.fallbackName,
    this.fallbackWidget,
    this.size = AvatarSize.md,
    this.shape = BoxShape.circle,
    this.borderRadius,
    this.showBorder = false,
    this.borderColor,
    this.borderWidth = 2.0,
    this.showStatus = false,
    this.statusColor,
    this.statusPosition = StatusPosition.bottomRight,
    this.onTap,
  }) : assert(
          imageUrl == null || assetPath == null,
          'Cannot use both imageUrl and assetPath. Use one or the other.',
        );

  /// Network image URL
  final String? imageUrl;

  /// Asset image path
  final String? assetPath;

  /// Name to generate fallback initials (e.g., "John Doe" -> "JD")
  final String? fallbackName;

  /// Custom fallback widget (overrides initials)
  final Widget? fallbackWidget;

  /// Avatar size
  final AvatarSize size;

  /// Avatar shape (circle or rectangle)
  final BoxShape shape;

  /// Custom border radius (only for BoxShape.rectangle)
  final double? borderRadius;

  /// Whether to show border around avatar
  final bool showBorder;

  /// Border color (defaults to theme border color)
  final Color? borderColor;

  /// Border width
  final double borderWidth;

  /// Whether to show status indicator
  final bool showStatus;

  /// Status indicator color (defaults to success green)
  final Color? statusColor;

  /// Status indicator position
  final StatusPosition statusPosition;

  /// Callback when avatar is tapped
  final VoidCallback? onTap;

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    final size = _getSize();
    final statusSize = _getStatusSize();

    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: widget.onTap != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: Stack(
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: widget.shape,
                borderRadius: widget.shape == BoxShape.rectangle
                    ? BorderRadius.circular(
                        widget.borderRadius ?? _getDefaultBorderRadius())
                    : null,
                border: widget.showBorder
                    ? Border.all(
                        color: widget.borderColor ?? AppTheme.border,
                        width: widget.borderWidth,
                      )
                    : null,
                color: AppTheme.surfaceVariant,
              ),
              child: ClipRRect(
                borderRadius: widget.shape == BoxShape.circle
                    ? BorderRadius.circular(size / 2)
                    : BorderRadius.circular(
                        widget.borderRadius ?? _getDefaultBorderRadius()),
                child: _buildContent(),
              ),
            ),
            if (widget.showStatus) _buildStatusIndicator(size, statusSize),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    // Try to load network image first
    if (widget.imageUrl != null && !_hasError) {
      return Image.network(
        widget.imageUrl!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return _buildLoadingIndicator();
        },
        errorBuilder: (context, error, stackTrace) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() => _hasError = true);
            }
          });
          return _buildFallback();
        },
      );
    }

    // Try to load asset image
    if (widget.assetPath != null) {
      return Image.asset(
        widget.assetPath!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallback();
        },
      );
    }

    // Show fallback
    return _buildFallback();
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: SizedBox(
        width: _getSize() * 0.4,
        height: _getSize() * 0.4,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primary),
        ),
      ),
    );
  }

  Widget _buildFallback() {
    // Use custom fallback widget if provided
    if (widget.fallbackWidget != null) {
      return widget.fallbackWidget!;
    }

    // Generate initials from name
    if (widget.fallbackName != null && widget.fallbackName!.isNotEmpty) {
      final initials = _getInitials(widget.fallbackName!);
      return Container(
        color: AppTheme.secondary,
        child: Center(
          child: Text(
            initials,
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: _getFontSize(),
              fontWeight: AppTheme.fontWeightMedium,
            ),
          ),
        ),
      );
    }

    // Default fallback icon
    return Container(
      color: AppTheme.surfaceVariant,
      child: Center(
        child: Icon(
          Icons.person,
          size: _getSize() * 0.5,
          color: AppTheme.textTertiary,
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(double avatarSize, double statusSize) {
    final offset = avatarSize * 0.08;
    final position = widget.statusPosition;

    double? top;
    double? bottom;
    double? left;
    double? right;

    switch (position) {
      case StatusPosition.topRight:
        top = offset;
        right = offset;
        break;
      case StatusPosition.topLeft:
        top = offset;
        left = offset;
        break;
      case StatusPosition.bottomRight:
        bottom = offset;
        right = offset;
        break;
      case StatusPosition.bottomLeft:
        bottom = offset;
        left = offset;
        break;
    }

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: statusSize,
        height: statusSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.statusColor ?? AppTheme.success,
          border: Border.all(
            color: AppTheme.surface,
            width: 2,
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '?';

    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }

    return (parts[0].substring(0, 1) + parts[parts.length - 1].substring(0, 1))
        .toUpperCase();
  }

  double _getSize() {
    switch (widget.size) {
      case AvatarSize.xs:
        return 24;
      case AvatarSize.sm:
        return 32;
      case AvatarSize.md:
        return 40;
      case AvatarSize.lg:
        return 48;
      case AvatarSize.xl:
        return 64;
      case AvatarSize.xl2:
        return 80;
    }
  }

  double _getStatusSize() {
    switch (widget.size) {
      case AvatarSize.xs:
        return 6;
      case AvatarSize.sm:
        return 8;
      case AvatarSize.md:
        return 10;
      case AvatarSize.lg:
        return 12;
      case AvatarSize.xl:
        return 14;
      case AvatarSize.xl2:
        return 16;
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case AvatarSize.xs:
        return AppTheme.fontSizeXs;
      case AvatarSize.sm:
        return AppTheme.fontSizeSm;
      case AvatarSize.md:
        return AppTheme.fontSizeMd;
      case AvatarSize.lg:
        return AppTheme.fontSizeLg;
      case AvatarSize.xl:
        return AppTheme.fontSizeXl;
      case AvatarSize.xl2:
        return AppTheme.fontSize2xl;
    }
  }

  double _getDefaultBorderRadius() {
    switch (widget.size) {
      case AvatarSize.xs:
      case AvatarSize.sm:
        return AppTheme.radiusSm;
      case AvatarSize.md:
        return AppTheme.radiusMd;
      case AvatarSize.lg:
        return AppTheme.radiusLg;
      case AvatarSize.xl:
      case AvatarSize.xl2:
        return AppTheme.radiusXl;
    }
  }
}

/// Avatar group component - displays multiple avatars in a row with overlap
///
/// Example:
/// ```dart
/// AvatarGroup(
///   avatars: [
///     Avatar(fallbackName: 'John Doe'),
///     Avatar(fallbackName: 'Jane Smith'),
///     Avatar(fallbackName: 'Alice Bob'),
///   ],
///   max: 3,
/// )
/// ```
class AvatarGroup extends StatelessWidget {
  const AvatarGroup({
    super.key,
    required this.avatars,
    this.max,
    this.size = AvatarSize.md,
    this.spacing = -8.0,
    this.showBorder = true,
  });

  /// List of avatars to display
  final List<Avatar> avatars;

  /// Maximum number of avatars to show (remaining count shown as +N)
  final int? max;

  /// Size of avatars (overrides individual avatar sizes)
  final AvatarSize size;

  /// Spacing between avatars (negative for overlap)
  final double spacing;

  /// Whether to show border around avatars
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final maxAvatars = max ?? avatars.length;
    final visibleAvatars = avatars.take(maxAvatars).toList();
    final remainingCount = avatars.length - maxAvatars;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...visibleAvatars.asMap().entries.map((entry) {
          final index = entry.key;
          final avatar = entry.value;

          return Transform.translate(
            offset: Offset(index > 0 ? spacing * index : 0, 0),
            child: Avatar(
              imageUrl: avatar.imageUrl,
              assetPath: avatar.assetPath,
              fallbackName: avatar.fallbackName,
              fallbackWidget: avatar.fallbackWidget,
              size: size,
              shape: avatar.shape,
              borderRadius: avatar.borderRadius,
              showBorder: showBorder,
              borderColor: AppTheme.surface,
              borderWidth: 2,
              onTap: avatar.onTap,
            ),
          );
        }),
        if (remainingCount > 0)
          Transform.translate(
            offset: Offset(spacing * maxAvatars, 0),
            child: Avatar(
              size: size,
              showBorder: showBorder,
              borderColor: AppTheme.surface,
              borderWidth: 2,
              fallbackWidget: Container(
                color: AppTheme.surfaceVariant,
                child: Center(
                  child: Text(
                    '+$remainingCount',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: _getFontSize(),
                      fontWeight: AppTheme.fontWeightMedium,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  double _getFontSize() {
    switch (size) {
      case AvatarSize.xs:
        return AppTheme.fontSizeXs;
      case AvatarSize.sm:
        return AppTheme.fontSizeSm;
      case AvatarSize.md:
        return AppTheme.fontSizeMd;
      case AvatarSize.lg:
        return AppTheme.fontSizeLg;
      case AvatarSize.xl:
        return AppTheme.fontSizeXl;
      case AvatarSize.xl2:
        return AppTheme.fontSize2xl;
    }
  }
}
