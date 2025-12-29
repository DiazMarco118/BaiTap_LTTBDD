import 'package:flutter/material.dart';

class SelectionDetailScreen extends StatefulWidget {
  const SelectionDetailScreen({super.key});

  @override
  State<SelectionDetailScreen> createState() => _SelectionDetailScreenState();
}

class _SelectionDetailScreenState extends State<SelectionDetailScreen> {
  bool checkbox1 = false;
  bool checkbox2 = true;
  String? selectedRadio = 'option1';
  double sliderValue = 50;
  String? selectedMenuItem = 'Item 1';
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
          'Selection',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Checkbox Section
          _buildSection(
            'Checkbox',
            'Checkboxes let users select one or\nmore items from a list, or turn an\nitem on or off.',
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
          const SizedBox(height: 32),

          // Chips Section
          _buildSection(
            'Chips',
            'Chips help people enter information,\nmake selections, filter content, or\ntrigger actions.',
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
          const SizedBox(height: 32),

          // Radio Button Section
          _buildSection(
            'Radio button',
            'Radio buttons let people select one\noption from a set of options.',
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
          const SizedBox(height: 32),

          // Sliders Section
          _buildSection(
            'Sliders',
            'Sliders let users make selections\nfrom a range of values.',
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Menus Section
          _buildSection(
            'Menus',
            'Menus display a list of choices on a\ntemporary surface.',
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.visibility, size: 20),
                      const SizedBox(width: 8),
                      Text(selectedMenuItem ?? 'Select'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String description, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5),
        ),
        const SizedBox(height: 16),
        content,
      ],
    );
  }
}
