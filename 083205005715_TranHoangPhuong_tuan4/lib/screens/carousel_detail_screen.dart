import 'package:flutter/material.dart';

class CarouselDetailScreen extends StatefulWidget {
  const CarouselDetailScreen({super.key});

  @override
  State<CarouselDetailScreen> createState() => _CarouselDetailScreenState();
}

class _CarouselDetailScreenState extends State<CarouselDetailScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          'Carousel',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Carousel',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Carousels show a collection of items\nthat can be scrolled on and off the screen.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final colors = [Colors.blue, Colors.green, Colors.orange];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: colors[index % colors.length],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Item ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
