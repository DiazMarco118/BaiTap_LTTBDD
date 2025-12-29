import 'package:flutter/material.dart';

class ProgressIndicatorsDetailScreen extends StatefulWidget {
  const ProgressIndicatorsDetailScreen({super.key});

  @override
  State<ProgressIndicatorsDetailScreen> createState() =>
      _ProgressIndicatorsDetailScreenState();
}

class _ProgressIndicatorsDetailScreenState
    extends State<ProgressIndicatorsDetailScreen> {
  double progress = 0.3;

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
          'Progress indicators',
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
              'Progress indicators',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Progress indicators express an\nunspecified wait time or display the\nduration of a process.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 8,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.purple,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    progress = progress < 1.0 ? progress + 0.2 : 0.0;
                  });
                },
                child: const Text('Update Progress'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
