import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for multiline text fields (textarea).
class TextFieldMultilinePreview extends StatefulWidget {
  const TextFieldMultilinePreview({super.key});

  @override
  State<TextFieldMultilinePreview> createState() =>
      _TextFieldMultilinePreviewState();
}

class _TextFieldMultilinePreviewState extends State<TextFieldMultilinePreview> {
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _bioController.dispose();
    _feedbackController.dispose();
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
                controller: _bioController,
                label: 'Bio',
                description: 'Tell us about yourself',
                placeholder: 'Write a short bio...',
                maxLines: 4,
                width: 350,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _feedbackController,
                label: 'Feedback',
                description: 'We value your thoughts',
                placeholder: 'Share your feedback...',
                maxLines: 6,
                maxLength: 500,
                width: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
