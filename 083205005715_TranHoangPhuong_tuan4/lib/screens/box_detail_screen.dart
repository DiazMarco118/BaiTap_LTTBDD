import 'package:flutter/material.dart';

class BoxDetailScreen extends StatelessWidget {
  const BoxDetailScreen({super.key});

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
          'Box',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SizedBox(
            width: 280,
            height: 280,
            child: Stack(
              children: [
                // Top-left box (light)
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFB8AB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // Bottom-right box (light)
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFB8AB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // Center box (dark, on top)
                Positioned(
                  left: 80,
                  top: 80,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF5722),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
