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
            _buildSection('Basic Cards', [
              CustomCard(
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
                    SizedBox(height: 8),
                    Text(
                      'This is a basic card with some content inside.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              CustomCard(
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
                    SizedBox(height: 8),
                    Text(
                      'This card has a button for user interaction.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),
                    Button(
                      size: ButtonSize.sm,
                      onPressed: () => _showSnackBar(context, 'Card button pressed'),
                      child: Text('Action'),
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(height: 32),
            _buildSection('Interactive Cards', [
              CustomCard(
                onTap: () => _showSnackBar(context, 'Card tapped'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clickable Card',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tap this card to see the interaction.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              CustomCard(
                onTap: () => _showSnackBar(context, 'Profile card tapped'),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.blue,
                      child: Text(
                        'JD',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
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
                          SizedBox(height: 4),
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
            ]),
            SizedBox(height: 32),
            _buildSection('Custom Padding', [
              CustomCard(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Small Padding',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              CustomCard(
                padding: EdgeInsets.all(32),
                child: Text(
                  'Large Padding',
                  style: TextStyle(fontSize: 14),
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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16),
        Column(
          children: cards.map((card) => Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: card,
          )).toList(),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: Duration(seconds: 2)),
    );
  }
}