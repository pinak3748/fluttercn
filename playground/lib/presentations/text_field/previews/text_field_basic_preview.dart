import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for a basic text field without labels.
class TextFieldBasicPreview extends StatefulWidget {
  const TextFieldBasicPreview({super.key});

  @override
  State<TextFieldBasicPreview> createState() => _TextFieldBasicPreviewState();
}

class _TextFieldBasicPreviewState extends State<TextFieldBasicPreview> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Center(
        child: Padding(
          padding: AppTheme.padding2xl,
          child: cn.TextField(
            controller: _controller,
            placeholder: 'Enter your text...',
            width: 300,
          ),
        ),
      ),
    );
  }
}
