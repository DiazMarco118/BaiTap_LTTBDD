import 'package:flutter/material.dart';

class RadioButtonDetailScreen extends StatefulWidget {
  const RadioButtonDetailScreen({super.key});

  @override
  State<RadioButtonDetailScreen> createState() =>
      _RadioButtonDetailScreenState();
}

class _RadioButtonDetailScreenState extends State<RadioButtonDetailScreen> {
  String? selectedRadio = 'option1';

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
          'Radio button',
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
              'Radio button',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Radio buttons let people select one\noption from a set of options.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Radio(
                  value: 'option1',
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value;
                    });
                  },
                ),
                const SizedBox(width: 8),
                Radio(
                  value: 'option2',
                  groupValue: selectedRadio,
                  onChanged: (value) {
                    setState(() {
                      selectedRadio = value;
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
