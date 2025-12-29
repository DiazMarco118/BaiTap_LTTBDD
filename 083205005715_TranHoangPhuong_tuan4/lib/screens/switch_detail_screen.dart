import 'package:flutter/material.dart';

class SwitchDetailScreen extends StatefulWidget {
  const SwitchDetailScreen({super.key});

  @override
  State<SwitchDetailScreen> createState() => _SwitchDetailScreenState();
}

class _SwitchDetailScreenState extends State<SwitchDetailScreen> {
  bool switchValue = true;

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
          'Switch',
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
              'Switch',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Switches toggle the selection of an\nitem on or off.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
