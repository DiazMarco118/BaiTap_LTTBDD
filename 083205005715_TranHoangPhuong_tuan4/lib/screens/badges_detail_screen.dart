import 'package:flutter/material.dart';

class BadgesDetailScreen extends StatelessWidget {
  const BadgesDetailScreen({super.key});

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
          'Badges',
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
              'Badges',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Badges show notifications, counts, or\nstatus information on navigation items\nand icons.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    Icon(Icons.mail, size: 32, color: Colors.grey[600]),
                    Positioned(
                      right: 0,
                      top: 2,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const SizedBox(width: 4, height: 4),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Icon(Icons.shopping_bag, size: 32, color: Colors.grey[600]),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Center(
                          child: Text(
                            '5',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 32,
                      color: Colors.grey[600],
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: const Center(
                          child: Text(
                            '99',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Icon(Icons.favorite, size: 32, color: Colors.grey[600]),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 20,
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            '99+',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
