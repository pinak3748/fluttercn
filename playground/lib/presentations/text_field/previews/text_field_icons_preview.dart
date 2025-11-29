import 'package:flutter/material.dart';

import '../../../config/theme.dart';
import '../../../widgets/text_field.dart' as cn;

/// Preview for text fields with icons.
class TextFieldIconsPreview extends StatefulWidget {
  const TextFieldIconsPreview({super.key});

  @override
  State<TextFieldIconsPreview> createState() => _TextFieldIconsPreviewState();
}

class _TextFieldIconsPreviewState extends State<TextFieldIconsPreview> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _searchController.dispose();
    _urlController.dispose();
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
                controller: _emailController,
                label: 'Email',
                placeholder: 'john@example.com',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _searchController,
                label: 'Search',
                placeholder: 'Search...',
                prefixIcon: Icons.search,
                suffixIcon: Icons.filter_list,
                width: 300,
              ),
              AppTheme.gapLg,
              cn.TextField(
                controller: _urlController,
                label: 'Website',
                placeholder: 'https://example.com',
                prefixIcon: Icons.link,
                keyboardType: TextInputType.url,
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
