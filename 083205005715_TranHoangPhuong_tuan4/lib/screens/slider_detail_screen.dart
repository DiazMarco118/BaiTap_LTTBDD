import 'package:flutter/material.dart';

class SliderDetailScreen extends StatefulWidget {
  const SliderDetailScreen({super.key});

  @override
  State<SliderDetailScreen> createState() => _SliderDetailScreenState();
}

class _SliderDetailScreenState extends State<SliderDetailScreen> {
  double sliderValue = 50;

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
          'Sliders',
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
              'Sliders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Sliders let users make selections\nfrom a range of values.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Value: ${sliderValue.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
