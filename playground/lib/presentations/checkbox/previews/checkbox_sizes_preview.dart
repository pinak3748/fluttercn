import 'package:flutter/material.dart' hide Checkbox;

import '../../../config/theme.dart';
import '../../../widgets/checkbox.dart' as cn;

/// Preview for the three checkbox sizes.
class CheckboxSizesPreview extends StatefulWidget {
  const CheckboxSizesPreview({super.key});

  @override
  State<CheckboxSizesPreview> createState() => _CheckboxSizesPreviewState();
}

class _CheckboxSizesPreviewState extends State<CheckboxSizesPreview> {
  final Map<cn.CheckboxSize, bool> _values = {
    cn.CheckboxSize.sm: true,
    cn.CheckboxSize.md: true,
    cn.CheckboxSize.lg: true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Wrap(
            spacing: AppTheme.spaceLg,
            runSpacing: AppTheme.spaceLg,
            alignment: WrapAlignment.center,
            children: cn.CheckboxSize.values
                .map(
                  (size) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      cn.Checkbox(
                        value: _values[size],
                        label: '${size.name.toUpperCase()} checkbox',
                        size: size,
                        onChanged: (value) =>
                            setState(() => _values[size] = value ?? false),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
