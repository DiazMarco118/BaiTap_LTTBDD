import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class PaymentMethod {
  final String id;
  final String name;
  final String iconPath;
  bool isSelected;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.iconPath,
    this.isSelected = false,
  });
  // đa hình
  void select() {
    // Method được gọi từ nhiều nơi
    isSelected = true;
  }

  void deselect() {
    isSelected = false;
  }
}

// đóng gói
class PaymentService {
  final List<PaymentMethod> _paymentMethods = []; // đóng gói với private _
  // Chỉ cung cấp public methods để truy cập an toàn
  PaymentService() {
    _initializePaymentMethods();
  }

  void _initializePaymentMethods() {
    _paymentMethods.addAll([
      PaymentMethod(
        id: 'paypal',
        name: 'PayPal',
        iconPath: 'assets/images/paypal.png',
      ),
      PaymentMethod(
        id: 'googlepay',
        name: 'Google Pay',
        iconPath: 'assets/images/google_pay.png',
      ),
      PaymentMethod(
        id: 'applepay',
        name: 'Apple Pay',
        iconPath: 'assets/images/apple_pay.png',
      ),
    ]);
  }

  List<PaymentMethod> getPaymentMethods() {
    return _paymentMethods;
  }

  void selectPaymentMethod(String id) {
    // tính trừu tượng
    //Che giấu chi tiết này- ng dùg ko cần biết cách thực hiện
    for (var method in _paymentMethods) {
      if (method.id == id) {
        method.select();
      } else {
        method.deselect();
      }
    }
  }

  PaymentMethod? getSelectedPaymentMethod() {
    try {
      return _paymentMethods.firstWhere((method) => method.isSelected);
    } catch (e) {
      return null;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment Method Selection',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const PaymentSelectionPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaymentSelectionPage extends StatefulWidget {
  const PaymentSelectionPage({super.key});

  @override
  State<PaymentSelectionPage> createState() => _PaymentSelectionPageState();
}

class _PaymentSelectionPageState extends State<PaymentSelectionPage> {
  late PaymentService _paymentService;
  late List<PaymentMethod> _paymentMethods;
  PaymentMethod? _selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    _paymentService = PaymentService();
    _paymentMethods = _paymentService.getPaymentMethods();
  }

  void _onPaymentMethodSelected(String id) {
    setState(() {
      _paymentService.selectPaymentMethod(id);
      _selectedPaymentMethod = _paymentService.getSelectedPaymentMethod();
    });
  }

  void _continuePayment() {
    final selectedMethod = _paymentService.getSelectedPaymentMethod();
    if (selectedMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng chọn hình thức thanh toán')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tiếp tục với: ${selectedMethod.name}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_selectedPaymentMethod != null)
                Center(
                  child: Container(
                    width: 150,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      _selectedPaymentMethod!.iconPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              else
                const SizedBox(height: 150),
              const Spacer(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = _paymentMethods[index];
                  return PaymentMethodCard(
                    paymentMethod: method,
                    onSelected: _onPaymentMethodSelected,
                  );
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _continuePayment,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  // kế thừa
  final PaymentMethod paymentMethod;
  final Function(String) onSelected;

  const PaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(paymentMethod.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: paymentMethod.isSelected
                ? Colors.blue
                : Colors.grey.shade300,
            width: paymentMethod.isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          color: paymentMethod.isSelected ? Colors.blue.shade50 : Colors.white,
        ),
        child: Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: paymentMethod.isSelected,
              onChanged: (_) => onSelected(paymentMethod.id),
              activeColor: Colors.blue,
            ),
            Expanded(
              child: Text(
                paymentMethod.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              width: 70,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.asset(paymentMethod.iconPath, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
