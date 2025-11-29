import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for text fields with labels and descriptions.
class TextFieldDescriptionPreview extends StatefulWidget {
  const TextFieldDescriptionPreview({super.key});

  @override
  State<TextFieldDescriptionPreview> createState() =>
      _TextFieldDescriptionPreviewState();
}

class _TextFieldDescriptionPreviewState
    extends State<TextFieldDescriptionPreview> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
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
                controller: _usernameController,
                label: 'Username',
                description: 'This will be your unique identifier',
                placeholder: 'johndoe',
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _bioController,
                label: 'Bio',
                description: 'Tell us a bit about yourself',
                placeholder: 'Software developer passionate about...',
                maxLines: 3,
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
