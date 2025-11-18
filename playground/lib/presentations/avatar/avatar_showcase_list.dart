import 'package:flutter/material.dart';

import '../../widgets/card.dart';
import '../../config/theme.dart';
import 'showcase_screens/avatar_sizes_showcase.dart';
import 'showcase_screens/avatar_initials_showcase.dart';
import 'showcase_screens/avatar_network_images_showcase.dart';
import 'showcase_screens/avatar_shapes_showcase.dart';
import 'showcase_screens/avatar_border_showcase.dart';
import 'showcase_screens/avatar_status_showcase.dart';
import 'showcase_screens/avatar_interactive_showcase.dart';
import 'showcase_screens/avatar_groups_showcase.dart';
import 'showcase_screens/avatar_custom_fallback_showcase.dart';
import 'showcase_screens/avatar_real_world_showcase.dart';

class AvatarShowcaseList extends StatelessWidget {
  const AvatarShowcaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Showcases'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: _showcases.length,
          itemBuilder: (context, index) {
            final showcase = _showcases[index];
            return CNCard(
              onTap: () => _navigateToShowcase(context, showcase),
              child: Padding(
                padding: AppTheme.paddingMd,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      showcase.icon,
                      size: 28,
                      color: AppTheme.primary,
                    ),
                    AppTheme.gapVerticalSm,
                    Text(
                      showcase.title,
                      style: AppTheme.titleMedium.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: AppTheme.fontWeightSemiBold,
                      ),
                    ),
                    AppTheme.gapVerticalXs,
                    Text(
                      showcase.description,
                      style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.textTertiary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToShowcase(BuildContext context, _ShowcaseItem showcase) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => showcase.page),
    );
  }
}

class _ShowcaseItem {
  final String title;
  final String description;
  final IconData icon;
  final Widget page;

  const _ShowcaseItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.page,
  });
}

final List<_ShowcaseItem> _showcases = [
  const _ShowcaseItem(
    title: 'Avatar Sizes',
    description: 'Multiple sizes from XS to 2XL',
    icon: Icons.photo_size_select_large,
    page: AvatarSizesShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Avatar Initials',
    description: 'Fallback to user initials',
    icon: Icons.text_fields,
    page: AvatarInitialsShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Network Images',
    description: 'Load images from the internet',
    icon: Icons.cloud_download,
    page: AvatarNetworkImagesShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Avatar Shapes',
    description: 'Circular and rounded square shapes',
    icon: Icons.crop_square,
    page: AvatarShapesShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Avatar Border',
    description: 'Add decorative borders',
    icon: Icons.border_outer,
    page: AvatarBorderShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Status Indicator',
    description: 'Show online/offline status',
    icon: Icons.circle,
    page: AvatarStatusShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Interactive Avatars',
    description: 'Avatars with tap handlers',
    icon: Icons.touch_app,
    page: AvatarInteractiveShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Avatar Groups',
    description: 'Multiple avatars with overlap',
    icon: Icons.groups,
    page: AvatarGroupsShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Custom Fallback',
    description: 'Custom widgets for fallback',
    icon: Icons.widgets,
    page: AvatarCustomFallbackShowcase(),
  ),
  const _ShowcaseItem(
    title: 'Real-world Examples',
    description: 'Common avatar use cases',
    icon: Icons.apps,
    page: AvatarRealWorldShowcase(),
  ),
];
