import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  final TextEditingController _controller = TextEditingController();
  int boxCount = 0;
  String? _errorText;
  void _handleCreateBox() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      setState(() {
        _errorText = "Vui lòng nhập số lượng";
      });
      return;
    }
    final num = int.tryParse(text); // ep kieu int
    if (num == null || num <= 0) {
      setState(() {
        _errorText = "Dữ liệu bạn nhập không hợp lệ";
      });
      return;
    }
    setState(() {
      boxCount = num;
      _errorText = null;
    });
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Thực hành 02',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 225,
                      height: 50,
                      child: TextField(
                        style: TextStyle(fontSize: 16),
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Nhập vào số lượng",
                          border: OutlineInputBorder(
                            borderRadius: (BorderRadius.circular(12)),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                      width: 80,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _handleCreateBox,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          textStyle: const TextStyle(fontSize: 16),
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("Tạo"),
                      ),
                    ),
                  ],
                ),
                if (_errorText != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _errorText!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                SizedBox(height: 20),
                ...List.generate(boxCount, (index) => RedBox(index: index + 1)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RedBox extends StatelessWidget {
  const RedBox({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "$index",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
