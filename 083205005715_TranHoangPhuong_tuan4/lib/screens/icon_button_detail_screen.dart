import 'package:flutter/material.dart';

class IconButtonDetailScreen extends StatelessWidget {
  const IconButtonDetailScreen({super.key});

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
          'Icon button',
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
              'Icon button',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Icon buttons help users take minor\nactions with one tap.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
