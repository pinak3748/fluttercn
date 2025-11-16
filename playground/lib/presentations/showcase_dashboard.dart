import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/card.dart';
import 'button_showcase.dart';
import 'card_showcase.dart';
import 'avatar_showcase.dart';
import 'badge_showcase.dart';
import 'checkbox_showcase.dart';

class ShowcaseDashboard extends StatelessWidget {
  const ShowcaseDashboard({super.key, required this.onThemeToggle});

  final VoidCallback onThemeToggle;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter CN Components'),
        actions: [
          Button(
            variant: ButtonVariant.ghost,
            size: ButtonSize.icon,
            onPressed: onThemeToggle,
            child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 2.5,
          ),
          itemCount: _components.length,
          itemBuilder: (context, index) {
            final component = _components[index];
            return CNCard(
              onTap: () => _navigateToShowcase(context, component),
              child: Center(
                child: Text(
                  component,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _navigateToShowcase(BuildContext context, String component) {
    Widget page;
    switch (component) {
      case 'Button':
        page = const ButtonShowcase();
        break;
      case 'Card':
        page = const CardShowcase();
        break;
      case 'Avatar':
        page = const AvatarShowcase();
        break;
      case 'Badge':
        page = const BadgeShowcase();
        break;
      case 'Checkbox':
        page = const CheckboxShowcase();
        break;
      default:
        return;
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

final List<String> _components = [
  'Button',
  'Card',
  'Avatar',
  'Badge',
  'Checkbox',
  'Dropdown',
  'Input',
  'Dialog',
];
