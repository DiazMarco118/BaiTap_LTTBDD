import 'package:flutter/material.dart';

class RowDetailScreen extends StatelessWidget {
  const RowDetailScreen({super.key});

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
          'Row Layout',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBox(false),
                  _buildBox(false),
                  _buildBox(false),
                ],
              ),
              const SizedBox(height: 10),
              // Row 2 - highlighted
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBox(true),
                  _buildBox(true),
                  _buildBox(true),
                ],
              ),
              const SizedBox(height: 10),
              // Row 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBox(false),
                  _buildBox(false),
                  _buildBox(false),
                ],
              ),
              const SizedBox(height: 10),
              // Row 4
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildBox(false),
                  _buildBox(false),
                  _buildBox(false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox(bool isHighlighted) {
    return Container(
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        color: isHighlighted
            ? const Color(0xFF1976D2)
            : const Color(0xFFB3E5FC),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
