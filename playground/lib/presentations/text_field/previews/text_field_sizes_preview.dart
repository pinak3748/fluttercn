import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for different text field sizes.
class TextFieldSizesPreview extends StatefulWidget {
  const TextFieldSizesPreview({super.key});

  @override
  State<TextFieldSizesPreview> createState() => _TextFieldSizesPreviewState();
}

class _TextFieldSizesPreviewState extends State<TextFieldSizesPreview> {
  final TextEditingController _smController = TextEditingController();
  final TextEditingController _mdController = TextEditingController();
  final TextEditingController _lgController = TextEditingController();

  @override
  void dispose() {
    _smController.dispose();
    _mdController.dispose();
    _lgController.dispose();
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
                controller: _smController,
                label: 'Small',
                placeholder: 'Small text field',
                size: cn.TextFieldSize.sm,
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _mdController,
                label: 'Medium (Default)',
                placeholder: 'Medium text field',
                size: cn.TextFieldSize.md,
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _lgController,
                label: 'Large',
                placeholder: 'Large text field',
                size: cn.TextFieldSize.lg,
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
