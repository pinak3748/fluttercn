import 'package:flutter/material.dart' hide Checkbox;

import '../../../config/theme.dart';
import '../../../widgets/checkbox.dart' as cn;

/// Preview for CheckboxGroup usage.
class CheckboxGroupPreview extends StatefulWidget {
  const CheckboxGroupPreview({super.key});

  @override
  State<CheckboxGroupPreview> createState() => _CheckboxGroupPreviewState();
}

class _CheckboxGroupPreviewState extends State<CheckboxGroupPreview> {
  List<String> _selected = const ['Option 1'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: cn.CheckboxGroup(
            options: const ['Option 1', 'Option 2', 'Option 3'],
            selectedValues: _selected,
            onChanged: (values) => setState(() => _selected = values),
          ),
        ),
      ),
    );
  }
}
