import 'package:flutter/material.dart' hide Checkbox;

import '../../../config/theme.dart';
import '../../../widgets/checkbox.dart' as cn;

/// Preview showing disabled checkboxes.
class CheckboxDisabledPreview extends StatelessWidget {
  const CheckboxDisabledPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              cn.Checkbox(
                value: true,
                label: 'Disabled checked',
                disabled: true,
                onChanged: null,
              ),
              SizedBox(height: 16),
              cn.Checkbox(
                value: false,
                label: 'Disabled unchecked',
                disabled: true,
                onChanged: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
