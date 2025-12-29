import 'package:flutter/material.dart';

class ImagesDetailScreen extends StatelessWidget {
  const ImagesDetailScreen({super.key});

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
          'Images',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Asset Image
          _buildImageSection(
            title: 'In app',
            image: Image.asset('assets/hoa_dao.png', fit: BoxFit.cover),
          ),
          const SizedBox(height: 24),
          // Network Image
          _buildImageSection(
            title:
                'https://floli.vn/uploads/news/2023_11/y-nghia-cua-hoa-mai-1.jpg',
            image: Image.network(
              'https://floli.vn/uploads/news/2023_11/y-nghia-cua-hoa-mai-1.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(child: Text('Failed to load image')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection({required String title, required Widget image}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(height: 250, width: double.infinity, child: image),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
