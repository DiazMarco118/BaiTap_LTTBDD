import 'package:flutter/material.dart';

class ChipsDetailScreen extends StatefulWidget {
  const ChipsDetailScreen({super.key});

  @override
  State<ChipsDetailScreen> createState() => _ChipsDetailScreenState();
}

class _ChipsDetailScreenState extends State<ChipsDetailScreen> {
  List<String> chips = ['Input chip'];
  TextEditingController chipController = TextEditingController();

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
          'Chips',
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
              'Chips',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Chips help people enter information,\nmake selections, filter content, or\ntrigger actions.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8,
              children: [
                ...chips.map(
                  (chip) => Chip(
                    label: Text(chip),
                    onDeleted: () {
                      setState(() {
                        chips.remove(chip);
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
