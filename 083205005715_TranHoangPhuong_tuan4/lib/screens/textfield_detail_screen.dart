import 'package:flutter/material.dart';

class TextFieldDetailScreen extends StatefulWidget {
  const TextFieldDetailScreen({super.key});

  @override
  State<TextFieldDetailScreen> createState() => _TextFieldDetailScreenState();
}

class _TextFieldDetailScreenState extends State<TextFieldDetailScreen> {
  String inputText = '';

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
          'TextField',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display text
            Text(
              inputText.isEmpty ? 'Nhập gì đi...' : inputText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            // Input field
            TextField(
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Thứ tin nhập',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.blue, width: 2),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 12),
            // Helper text
            Text(
              'Tự động cập nhật nội dung textfield',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.red[400]),
            ),
          ],
        ),
      ),
    );
  }
}
