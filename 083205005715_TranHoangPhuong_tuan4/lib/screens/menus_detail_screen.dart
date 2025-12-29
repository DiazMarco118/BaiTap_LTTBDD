import 'package:flutter/material.dart';

class MenusDetailScreen extends StatefulWidget {
  const MenusDetailScreen({super.key});

  @override
  State<MenusDetailScreen> createState() => _MenusDetailScreenState();
}

class _MenusDetailScreenState extends State<MenusDetailScreen> {
  String? selectedMenuItem = 'Item 1';

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
          'Menus',
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
              'Menus',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Menus display a list of choices on a\ntemporary surface.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            PopupMenuButton<String>(
              onSelected: (String value) {
                setState(() {
                  selectedMenuItem = value;
                });
              },
              position: PopupMenuPosition.under,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Item 1',
                  child: Row(
                    children: [
                      Icon(Icons.visibility, size: 20),
                      SizedBox(width: 8),
                      Text('Item 1'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Item 2',
                  child: Row(
                    children: [
                      Icon(Icons.visibility, size: 20),
                      SizedBox(width: 8),
                      Text('Item 2'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Item 3',
                  child: Row(
                    children: [
                      Icon(Icons.visibility, size: 20),
                      SizedBox(width: 8),
                      Text('Item 3'),
                    ],
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'Item 4',
                  child: Row(
                    children: [
                      Icon(Icons.visibility, size: 20),
                      SizedBox(width: 8),
                      Text('Item 4'),
                    ],
                  ),
                ),
              ],
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Icon(Icons.visibility, size: 20),
                      const SizedBox(width: 8),
                      Expanded(child: Text(selectedMenuItem ?? 'Select')),
                      Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
