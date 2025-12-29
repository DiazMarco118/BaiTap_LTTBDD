import 'package:flutter/material.dart';

class SegmentedButtonDetailScreen extends StatefulWidget {
  const SegmentedButtonDetailScreen({super.key});

  @override
  State<SegmentedButtonDetailScreen> createState() =>
      _SegmentedButtonDetailScreenState();
}

class _SegmentedButtonDetailScreenState
    extends State<SegmentedButtonDetailScreen> {
  String selectedOption = 'selected';

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
          'Segmented button',
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
              'Segmented button',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Segmented buttons help users select\noptions, switch views, or sort elements.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: SegmentedButton<String>(
                segments: const [
                  ButtonSegment(value: 'selected', label: Text('Selected')),
                  ButtonSegment(value: 'enabled', label: Text('Enabled')),
                  ButtonSegment(value: 'disabled', label: Text('Disabled')),
                ],
                selected: {selectedOption},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    selectedOption = newSelection.first;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
