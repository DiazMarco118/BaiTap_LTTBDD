import 'package:flutter/material.dart';

class TextDetailScreen extends StatelessWidget {
  const TextDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Text Detail',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black87,
                height: 1.8,
              ),
              children: [
                const TextSpan(
                  text: 'The ',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                TextSpan(
                  text: 'quick',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[600],
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: 'B',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A574),
                    fontSize: 32,
                  ),
                ),
                const TextSpan(
                  text: 'rown',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFD4A574),
                    fontSize: 24,
                  ),
                ),
                const TextSpan(text: '\n'),
                const TextSpan(
                  text: 'fox j u m p s ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    letterSpacing: 3.0,
                  ),
                ),
                const TextSpan(
                  text: 'over',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '\n'),
                const TextSpan(
                  text: 'the ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(
                  text: 'lazy',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    fontSize: 28,
                  ),
                ),
                const TextSpan(text: ' '),
                const TextSpan(
                  text: 'dog.',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
