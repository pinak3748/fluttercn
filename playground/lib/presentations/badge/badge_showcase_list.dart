import 'package:flutter/material.dart';

import '../../widgets/card.dart';
import '../../config/theme.dart';
import 'showcase_screens/badge_variants_showcase.dart';
import 'showcase_screens/badge_sizes_showcase.dart';
import 'showcase_screens/badge_with_icons_showcase.dart';
import 'showcase_screens/badge_interactive_showcase.dart';
import 'showcase_screens/badge_count_status_showcase.dart';
import 'showcase_screens/badge_real_world_showcase.dart';

class BadgeShowcaseList extends StatelessWidget {
  const BadgeShowcaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge Showcases'),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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

  _ShowcaseItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.page,
  });
}

final List<_ShowcaseItem> _showcases = [
  _ShowcaseItem(
    title: 'Variants',
    description: 'Different color schemes',
    icon: Icons.palette,
    page: const BadgeVariantsShowcase(),
  ),
  _ShowcaseItem(
    title: 'Sizes',
    description: 'Small, medium, large',
    icon: Icons.format_size,
    page: const BadgeSizesShowcase(),
  ),
  _ShowcaseItem(
    title: 'With Icons',
    description: 'Leading and trailing icons',
    icon: Icons.star,
    page: const BadgeWithIconsShowcase(),
  ),
  _ShowcaseItem(
    title: 'Interactive',
    description: 'Clickable and removable',
    icon: Icons.touch_app,
    page: const BadgeInteractiveShowcase(),
  ),
  _ShowcaseItem(
    title: 'Count & Status',
    description: 'Numbers and statuses',
    icon: Icons.numbers,
    page: const BadgeCountStatusShowcase(),
  ),
  _ShowcaseItem(
    title: 'Real-world',
    description: 'Practical examples',
    icon: Icons.apps,
    page: const BadgeRealWorldShowcase(),
  ),
];
