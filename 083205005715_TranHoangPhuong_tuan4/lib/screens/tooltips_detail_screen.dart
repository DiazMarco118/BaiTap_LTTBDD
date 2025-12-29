import 'package:flutter/material.dart';

class TooltipsDetailScreen extends StatelessWidget {
  const TooltipsDetailScreen({super.key});

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
          'Tooltips',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tooltips',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tooltips display brief labels or messages.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Tooltip(
                message: 'Plain tooltip',
                showDuration: const Duration(seconds: 3),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Plain tooltip',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Tooltip(
                message: 'Hover or long-press to see tooltip',
                showDuration: const Duration(seconds: 3),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.info_outline,
                    size: 32,
                    color: Colors.blue[600],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
