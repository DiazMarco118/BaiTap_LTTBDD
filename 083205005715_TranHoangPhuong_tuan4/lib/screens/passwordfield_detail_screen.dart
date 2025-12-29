import 'package:flutter/material.dart';

class PasswordFieldDetailScreen extends StatefulWidget {
  const PasswordFieldDetailScreen({super.key});

  @override
  State<PasswordFieldDetailScreen> createState() =>
      _PasswordFieldDetailScreenState();
}

class _PasswordFieldDetailScreenState extends State<PasswordFieldDetailScreen> {
  String inputText = '';
  bool isPasswordVisible = false;

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
          'PasswordField',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Password input field
            TextField(
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Nhập password',
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
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
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
