import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  String result = "";
  String formatResult(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  void calculate(String arith) {
    setState(() {
      double? num1 = double.tryParse(controller1.text);
      double? num2 = double.tryParse(controller2.text);
      if (num1 == null || num2 == null) {
        result = "Nhập số hợp lệ!";
        return;
      }
      switch (arith) {
        case "+":
          double res = (num1 + num2);
          result = formatResult(res);
          break;
        case "-":
          double res = num1 - num2;
          result = formatResult(res);
          break;

        case "*":
          double res = num1 * num2;
          result = formatResult(res);
          break;

        case "/":
          if (num2 == 0) {
            result = "Không thể chia cho số 0";
          } else {
            double res = num1 / num2;
            result = formatResult(res);
          }
          break;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Thực hành 03',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              TextField(
                controller: controller1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter Number...",
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CalculateButton(
                    color: Colors.red,
                    arithmetic: "+",
                    onTap: calculate,
                  ),
                  CalculateButton(
                    color: Colors.amber,
                    arithmetic: "-",
                    onTap: calculate,
                  ),
                  CalculateButton(
                    color: Colors.deepPurple,
                    arithmetic: "*",
                    onTap: calculate,
                  ),
                  CalculateButton(
                    color: Colors.black,
                    arithmetic: "/",
                    onTap: calculate,
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                controller: controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter Number...",
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Kết quả: $result",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.arithmetic,
    required this.color,
    required this.onTap,
  });
  final String arithmetic;
  final Color color;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
        onPressed: () => onTap(arithmetic),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: Text(
            arithmetic,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
