import 'package:flutter/material.dart';

import '../../widgets/card.dart';
import '../../config/theme.dart';
import 'showcase_screens/card_composable_showcase.dart';
import 'showcase_screens/card_simple_showcase.dart';
import 'showcase_screens/card_interactive_showcase.dart';
import 'showcase_screens/card_padding_showcase.dart';
import 'showcase_screens/card_dividers_showcase.dart';
import 'showcase_screens/card_real_world_showcase.dart';

class CardShowcaseList extends StatelessWidget {
  const CardShowcaseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Showcases'),
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
    title: 'Composable',
    description: 'Header, content, footer',
    icon: Icons.layers,
    page: const CardComposableShowcase(),
  ),
  _ShowcaseItem(
    title: 'Simple',
    description: 'Single child usage',
    icon: Icons.crop_square,
    page: const CardSimpleShowcase(),
  ),
  _ShowcaseItem(
    title: 'Interactive',
    description: 'Clickable cards',
    icon: Icons.touch_app,
    page: const CardInteractiveShowcase(),
  ),
  _ShowcaseItem(
    title: 'Padding',
    description: 'Custom spacing',
    icon: Icons.space_bar,
    page: const CardPaddingShowcase(),
  ),
  _ShowcaseItem(
    title: 'Dividers',
    description: 'Section separators',
    icon: Icons.horizontal_rule,
    page: const CardDividersShowcase(),
  ),
  _ShowcaseItem(
    title: 'Real-world',
    description: 'Practical examples',
    icon: Icons.apps,
    page: const CardRealWorldShowcase(),
  ),
];
