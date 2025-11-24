import 'package:flutter/material.dart' hide Card;
import 'package:flutter_cn_playground/presentations/avatar/avatar_preview_list.dart';
import 'package:flutter_cn_playground/presentations/badge/badge_preview_list.dart';
import 'package:flutter_cn_playground/presentations/button/button_preview_list.dart';
import 'package:flutter_cn_playground/presentations/card/card_preview_list.dart';
import 'package:flutter_cn_playground/presentations/checkbox/checkbox_preview_list.dart';
import 'package:flutter_cn_playground/presentations/toggle/toggle_preview_list.dart';
import 'package:flutter_cn_playground/presentations/typography/typography_preview_list.dart';

import '../widgets/button.dart';
import '../widgets/card.dart';

class ShowcaseDashboard extends StatelessWidget {
  const ShowcaseDashboard({super.key, required this.onThemeToggle});

  final VoidCallback onThemeToggle;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('fluttercn Components'),
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
            return Card(
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
      case 'Typography':
        page = const TypographyPreviewList();
        break;
      case 'Button':
        page = const ButtonPreviewList();
        break;
      case 'Card':
        page = const CardPreviewList();
        break;
      case 'Avatar':
        page = const AvatarPreviewList();
        break;
      case 'Badge':
        page = const BadgePreviewList();
        break;
      case 'Checkbox':
        page = const CheckboxPreviewList();
        break;
      case 'Toggle':
        page = const TogglePreviewList();
        break;
      default:
        return;
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

final List<String> _components = [
  'Typography',
  'Button',
  'Card',
  'Avatar',
  'Badge',
  'Checkbox',
  'Tooltip',
  'Dropdown',
  'Input',
  'Dialog',
  'Toggle',
];
