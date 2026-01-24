import 'package:flutter/material.dart' hide Card;
import 'package:flutter_cn_playground/presentations/accordion/accordion_preview_list.dart';
import 'package:flutter_cn_playground/presentations/alert/alert_preview_list.dart';
import 'package:flutter_cn_playground/presentations/avatar/avatar_preview_list.dart';
import 'package:flutter_cn_playground/presentations/badge/badge_preview_list.dart';
import 'package:flutter_cn_playground/presentations/bottom_sheet/bottom_sheet_preview_list.dart';
import 'package:flutter_cn_playground/presentations/button/button_preview_list.dart';
import 'package:flutter_cn_playground/presentations/card/card_preview_list.dart';
import 'package:flutter_cn_playground/presentations/checkbox/checkbox_preview_list.dart';
import 'package:flutter_cn_playground/presentations/dropdown/dropdown_preview_list.dart';
import 'package:flutter_cn_playground/presentations/slider/slider_preview_list.dart';
import 'package:flutter_cn_playground/presentations/text_field/text_field_preview_list.dart';
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
      case 'Accordion':
        page = const AccordionPreviewList();
        break;
      case 'Alert':
        page = const AlertPreviewList();
        break;
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
      case 'Bottom Sheet':
        page = const BottomSheetPreviewList();
        break;
      case 'Checkbox':
        page = const CheckboxPreviewList();
        break;
      case 'Dropdown':
        page = const DropdownPreviewList();
        break;
      case 'TextField':
        page = const TextFieldPreviewList();
        break;
      case 'Toggle':
        page = const TogglePreviewList();
        break;
      case 'Slider':
        page = const SliderPreviewList();
        break;
      default:
        return;
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

final List<String> _components = [
  'Accordion',
  'Alert',
  'Avatar',
  'Badge',
  'Bottom Sheet',
  'Button',
  'Card',
  'Checkbox',
  'Dialog',
  'Dropdown',
  'Input',
  'Slider',
  'TextField',
  'Toggle',
  'Tooltip',
  'Typography',
];
