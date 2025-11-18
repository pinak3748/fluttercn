import 'package:flutter/material.dart';

import '../../widgets/card.dart';
import '../../config/theme.dart';
import 'showcase_screens/button_variants_showcase.dart';
import 'showcase_screens/button_sizes_showcase.dart';
import 'showcase_screens/button_with_icons_showcase.dart';
import 'showcase_screens/button_states_showcase.dart';
import 'showcase_screens/button_animations_showcase.dart';
import 'showcase_screens/button_combinations_showcase.dart';
import 'showcase_screens/button_real_world_showcase.dart';

class ButtonShowcaseList extends StatelessWidget {
  const ButtonShowcaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Showcases'),
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
    description: 'Different button styles',
    icon: Icons.palette,
    page: const ButtonVariantsShowcase(),
  ),
  _ShowcaseItem(
    title: 'Sizes',
    description: 'Small, medium, large',
    icon: Icons.format_size,
    page: const ButtonSizesShowcase(),
  ),
  _ShowcaseItem(
    title: 'With Icons',
    description: 'Leading, trailing, icon-only',
    icon: Icons.star,
    page: const ButtonWithIconsShowcase(),
  ),
  _ShowcaseItem(
    title: 'States',
    description: 'Loading, disabled, full-width',
    icon: Icons.toggle_on,
    page: const ButtonStatesShowcase(),
  ),
  _ShowcaseItem(
    title: 'Animations',
    description: 'Press and hover effects',
    icon: Icons.animation,
    page: const ButtonAnimationsShowcase(),
  ),
  _ShowcaseItem(
    title: 'Combinations',
    description: 'Mixed properties',
    icon: Icons.tune,
    page: const ButtonCombinationsShowcase(),
  ),
  _ShowcaseItem(
    title: 'Real-world',
    description: 'Practical examples',
    icon: Icons.apps,
    page: const ButtonRealWorldShowcase(),
  ),
];
