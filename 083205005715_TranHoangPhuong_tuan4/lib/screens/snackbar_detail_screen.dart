import 'package:flutter/material.dart';

class SnackbarDetailScreen extends StatelessWidget {
  const SnackbarDetailScreen({super.key});

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
          'Snackbar',
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
              'Snackbar',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Snackbars show short updates about app\nprocesses at the bottom of the screen.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          const Expanded(
                            child: Text('Single-line snackbar with action'),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(
                                context,
                              ).hideCurrentSnackBar();
                            },
                            child: const Text(
                              'Action',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.grey[800],
                      duration: const Duration(seconds: 4),
                    ),
                  );
                },
                child: const Text('Show Snackbar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
