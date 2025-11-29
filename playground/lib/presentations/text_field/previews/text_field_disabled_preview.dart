import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for disabled text fields.
class TextFieldDisabledPreview extends StatefulWidget {
  const TextFieldDisabledPreview({super.key});

  @override
  State<TextFieldDisabledPreview> createState() =>
      _TextFieldDisabledPreviewState();
}

class _TextFieldDisabledPreviewState extends State<TextFieldDisabledPreview> {
  final TextEditingController _disabledController = TextEditingController(
    text: 'This field is disabled',
  );
  final TextEditingController _readonlyController = TextEditingController(
    text: 'This field is read-only',
  );

  @override
  void dispose() {
    _disabledController.dispose();
    _readonlyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              cn.TextField(
                controller: _disabledController,
                label: 'Disabled',
                description: 'This field cannot be edited',
                disabled: true,
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _readonlyController,
                label: 'Read-only',
                description: 'This field can be focused but not edited',
                readOnly: true,
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
