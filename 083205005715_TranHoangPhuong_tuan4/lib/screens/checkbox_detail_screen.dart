import 'package:flutter/material.dart';

class CheckboxDetailScreen extends StatefulWidget {
  const CheckboxDetailScreen({super.key});

  @override
  State<CheckboxDetailScreen> createState() => _CheckboxDetailScreenState();
}

class _CheckboxDetailScreenState extends State<CheckboxDetailScreen> {
  bool checkbox1 = false;
  bool checkbox2 = true;

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
          'Checkbox',
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
              'Checkbox',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Checkboxes let users select one or\nmore items from a list, or turn an\nitem on or off.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: checkbox1,
                  onChanged: (value) {
                    setState(() {
                      checkbox1 = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                Checkbox(
                  value: checkbox2,
                  onChanged: (value) {
                    setState(() {
                      checkbox2 = value ?? false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
