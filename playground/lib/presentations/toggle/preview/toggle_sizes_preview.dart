import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/toggle.dart';

/// Preview for the three toggle sizes.
class ToggleSizesPreview extends StatefulWidget {
  const ToggleSizesPreview({super.key});

  @override
  State<ToggleSizesPreview> createState() => _ToggleSizesPreviewState();
}

class _ToggleSizesPreviewState extends State<ToggleSizesPreview> {
  final Map<ToggleSize, bool> _values = {
    ToggleSize.sm: true,
    ToggleSize.md: true,
    ToggleSize.lg: true,
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
            children: ToggleSize.values
                .map(
                  (size) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Toggle(
                        value: _values[size] ?? false,
                        label: '${size.name.toUpperCase()} toggle',
                        size: size,
                        onChanged: (value) =>
                            setState(() => _values[size] = value),
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

