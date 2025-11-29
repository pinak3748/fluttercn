import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for text fields with labels.
class TextFieldLabelPreview extends StatefulWidget {
  const TextFieldLabelPreview({super.key});

  @override
  State<TextFieldLabelPreview> createState() => _TextFieldLabelPreviewState();
}

class _TextFieldLabelPreviewState extends State<TextFieldLabelPreview> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
                controller: _nameController,
                label: 'Full name',
                placeholder: 'John Doe',
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _emailController,
                label: 'Email address',
                placeholder: 'john@example.com',
                keyboardType: TextInputType.emailAddress,
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
