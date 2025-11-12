import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/card.dart';

class CardShowcase extends StatelessWidget {
  const CardShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Components')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Composable Structure (shadcn-style)', [
              // Full card with header, content, and footer
              CNCard(
                header: CardHeader(
                  title: CardTitle('Card Title'),
                  description: CardDescription(
                    'This is a card description that explains what the card is about.',
                  ),
                ),
                content: CardContent(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('This is the main content area of the card.'),
                      const SizedBox(height: 16),
                      Text('You can put any widgets here.'),
                    ],
                  ),
                ),
                footer: CardFooter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                        variant: ButtonVariant.outline,
                        size: ButtonSize.sm,
                        onPressed: () => _showSnackBar(context, 'Cancel pressed'),
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      Button(
                        variant: ButtonVariant.primary,
                        size: ButtonSize.sm,
                        onPressed: () => _showSnackBar(context, 'Save pressed'),
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              ),
              // Card with header and content only
              CNCard(
                header: CardHeader(
                  title: CardTitle('Card with Header and Content'),
                  description: CardDescription(
                    'This card has a header and content but no footer.',
                  ),
                ),
                content: CardContent(
                  child: Text('Main content goes here.'),
                ),
              ),
              // Card with content and footer only
              CNCard(
                content: CardContent(
                  child: Text('This card has content and footer but no header.'),
                ),
                footer: CardFooter(
                  child: Button(
                    variant: ButtonVariant.primary,
                    size: ButtonSize.sm,
                    onPressed: () => _showSnackBar(context, 'Action pressed'),
                    child: const Text('Action'),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 32),
            _buildSection('Backward Compatible (Single Child)', [
              // Backward compatible: single child usage
              CNCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Simple Card',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This is a basic card with some content inside.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              CNCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card with Action',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'This card has a button for user interaction.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Button(
                      size: ButtonSize.sm,
                      onPressed: () => _showSnackBar(context, 'Card button pressed'),
                      child: const Text('Action'),
                    ),
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 32),
            _buildSection('Interactive Cards', [
              CNCard(
                onTap: () => _showSnackBar(context, 'Card tapped'),
                header: CardHeader(
                  title: CardTitle('Clickable Card'),
                  description: CardDescription(
                    'Tap this card to see the interaction.',
                  ),
                ),
                content: CardContent(
                  child: Text('This entire card is clickable.'),
                ),
              ),
              CNCard(
                onTap: () => _showSnackBar(context, 'Profile card tapped'),
                content: CardContent(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.blue,
                        child: const Text(
                          'JD',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Software Developer',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 32),
            _buildSection('Custom Padding', [
              CNCard(
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'Small Padding',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              CNCard(
                padding: const EdgeInsets.all(32),
                child: const Text(
                  'Large Padding',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              // Custom padding in sections
              CNCard(
                header: CardHeader(
                  title: CardTitle('Custom Header Padding'),
                  padding: const EdgeInsets.all(8),
                ),
                content: CardContent(
                  padding: const EdgeInsets.all(16),
                  child: const Text('Content with default padding.'),
                ),
                footer: CardFooter(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Footer with default padding.'),
                ),
              ),
            ]),
            const SizedBox(height: 32),
            _buildSection('Custom Header Content', [
              // Header with custom child
              CNCard(
                header: CardHeader(
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Custom Header',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                content: CardContent(
                  child: const Text('This card has a custom header with an icon.'),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> cards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        Column(
          children: cards.map((card) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: card,
          )).toList(),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
