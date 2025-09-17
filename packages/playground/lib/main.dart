import 'package:flutter/material.dart';

import 'theme/theme.dart';
import 'widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CN Playground',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const ButtonShowcase(),
    );
  }
}

class ButtonShowcase extends StatefulWidget {
  const ButtonShowcase({super.key});

  @override
  State<ButtonShowcase> createState() => _ButtonShowcaseState();
}

class _ButtonShowcaseState extends State<ButtonShowcase> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Components')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Button Variants', [
              Button(
                onPressed: () => _showSnackBar('Primary button pressed'),
                child: const Text('Primary'),
              ),
              Button(
                variant: ButtonVariant.secondary,
                onPressed: () => _showSnackBar('Secondary button pressed'),
                child: const Text('Secondary'),
              ),
              Button(
                variant: ButtonVariant.destructive,
                onPressed: () => _showSnackBar('Destructive button pressed'),
                child: const Text('Destructive'),
              ),
              Button(
                variant: ButtonVariant.outline,
                onPressed: () => _showSnackBar('Outline button pressed'),
                child: const Text('Outline'),
              ),
              Button(
                variant: ButtonVariant.ghost,
                onPressed: () => _showSnackBar('Ghost button pressed'),
                child: const Text('Ghost'),
              ),
              Button(
                variant: ButtonVariant.link,
                onPressed: () => _showSnackBar('Link button pressed'),
                child: const Text('Link'),
              ),
            ]),
            const SizedBox(height: 32),
            _buildSection('Button Sizes', [
              Button(
                size: ButtonSize.sm,
                onPressed: () => _showSnackBar('Small button pressed'),
                child: const Text('Small'),
              ),
              Button(
                size: ButtonSize.md,
                onPressed: () => _showSnackBar('Medium button pressed'),
                child: const Text('Medium'),
              ),
              Button(
                size: ButtonSize.lg,
                onPressed: () => _showSnackBar('Large button pressed'),
                child: const Text('Large'),
              ),
            ]),
            const SizedBox(height: 32),
            _buildSection('Buttons with Icons', [
              Button(
                onPressed: () =>
                    _showSnackBar('Button with leading icon pressed'),
                icon: const Icon(Icons.mail),
                child: const Text('Login with Email'),
              ),
              Button(
                variant: ButtonVariant.secondary,
                onPressed: () =>
                    _showSnackBar('Button with trailing icon pressed'),
                icon: const Icon(Icons.arrow_forward),
                iconPosition: IconPosition.trailing,
                child: const Text('Continue'),
              ),
              Button(
                variant: ButtonVariant.outline,
                size: ButtonSize.icon,
                onPressed: () => _showSnackBar('Icon button pressed'),
                child: const Icon(Icons.settings),
              ),
            ]),
            const SizedBox(height: 32),
            _buildSection('Button States', [
              Button(
                onPressed: _toggleLoading,
                loading: _isLoading,
                child: Text(_isLoading ? 'Loading...' : 'Click to Load'),
              ),
              Button(
                variant: ButtonVariant.secondary,
                disabled: true,
                onPressed: () {},
                child: const Text('Disabled'),
              ),
              Button(
                variant: ButtonVariant.outline,
                fullWidth: true,
                onPressed: () => _showSnackBar('Full width button pressed'),
                child: const Text('Full Width Button'),
              ),
            ]),
            const SizedBox(height: 32),
            _buildSection('Mixed Examples', [
              Button(
                variant: ButtonVariant.destructive,
                size: ButtonSize.sm,
                icon: const Icon(Icons.delete),
                onPressed: () => _showSnackBar('Delete button pressed'),
                child: const Text('Delete'),
              ),
              Button(
                variant: ButtonVariant.ghost,
                size: ButtonSize.lg,
                icon: const Icon(Icons.download),
                iconPosition: IconPosition.trailing,
                onPressed: () => _showSnackBar('Download button pressed'),
                child: const Text('Download'),
              ),
              Button(
                variant: ButtonVariant.outline,
                fullWidth: true,
                icon: const Icon(Icons.share),
                onPressed: () => _showSnackBar('Share button pressed'),
                child: const Text('Share'),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> buttons) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Wrap(spacing: 12, runSpacing: 12, children: buttons),
      ],
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
