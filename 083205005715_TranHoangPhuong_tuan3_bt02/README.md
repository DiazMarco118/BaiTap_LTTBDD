# Ứng dụng Chọn Hình thức Thanh toán

## Mô tả bài làm

Xem danh sách các hình thức thanh toán (PayPal, Google Pay, Apple Pay)

- Chọn một hình thức thanh toán
- Hiển thị hình ảnh logo của hình thức được chọn
- Tiếp tục thanh toán với phương thức đã chọn

---

4 TÍNH CHẤT LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG (OOP) ÁP DỤNG

### **TÍNH TRỪU TƯỢNG (Abstraction)**

**Vị trí**: Phương thức `selectPaymentMethod()` trong `PaymentService` (dòng 61-68)

```dart
void selectPaymentMethod(String id) {
  // tính trừu tượng
  // Che giấu chi tiết này - người dùng ko cần biết cách thực hiện
  for (var method in _paymentMethods) {
    if (method.id == id) {
      method.select();
    } else {
      method.deselect();
    }
  }
}
```

**Mục đích**:

- Che giấu chi tiết cách chọn hình thức thanh toán từ người dùng
- Người dùng chỉ cần gọi `selectPaymentMethod(id)` mà không cần biết cách nó hoạt động bên trong
- Nếu muốn thay đổi logic chọn, chỉ cần sửa method này mà không ảnh hưởng code gọi
- Giảm độ phức tạp: code gọi không cần lo về chi tiết triển khai

---

**TÍNH ĐÓNG GÓI (Encapsulation)**

**Vị trí**: Thuộc tính `_paymentMethods` trong `PaymentService` (dòng 30) với getter `getPaymentMethods()`

```dart
class PaymentService {
  final List<PaymentMethod> _paymentMethods = []; // Private - được bảo vệ

  // Chỉ cung cấp public methods để truy cập an toàn
  List<PaymentMethod> getPaymentMethods() {
    return _paymentMethods;
  }
}
```

**Mục đích**:

- Sử dụng `_paymentMethods` (private) để bảo vệ danh sách hình thức thanh toán
- Cung cấp getter `getPaymentMethods()` để truy cập controlled
- Ngăn chặn thay đổi dữ liệu trực tiếp từ bên ngoài
- Đảm bảo tính toàn vẹn: danh sách không thể bị xóa hoặc thay đổi sai cách

**TÍNH KẾ THỪA (Inheritance)**

**Vị trí**: `PaymentMethodCard` (class Widget) sử dụng `PaymentMethod` (dòng 193-205)

```
class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final Function(String) onSelected;

  const PaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.onSelected,
  });
}
```

**Mục đích**:

- `PaymentMethodCard` tái sử dụng model `PaymentMethod`
- Các lớp khác có thể tận dụng lớp `PaymentMethod` mà không cần tạo lại
- Giữ một single source of truth: `PaymentMethod` là nơi quản lý trạng thái
- Dễ bảo trì: thay đổi `PaymentMethod` được phản ánh ở mọi nơi sử dụng

**TÍNH ĐA HÌNH (Polymorphism)**

**Vị trí**: Phương thức `select()` và `deselect()` được gọi từ nhiều nơi khác nhau (dòng 19-25)

```dart
class PaymentMethod {
  // ... thuộc tính ...

  void select() {
    // Method được gọi từ nhiều nơi với hành vi giống nhau
    isSelected = true;
  }

  void deselect() {
    isSelected = false;
  }
}
```

**Cách sử dụng đa hình**:

- Phương thức `select()` và `deselect()` được gọi trong `selectPaymentMethod()` (dòng 64-67)
- Cùng một phương thức nhưng có thể được gọi từ các context khác nhau
- Cho phép mở rộng: nếu sau này cần thêm logic khi chọn (như log, event), chỉ cần sửa method `select()`
- Tất cả code gọi `select()` sẽ tự động sử dụng logic mới

## Cấu trúc thành phần chính

- **`PaymentMethod`**: Model lưu trữ thông tin hình thức thanh toán (id, name, iconPath, isSelected)
- **`PaymentService`**: Service quản lý danh sách hình thức thanh toán và logic chọn
- **`PaymentSelectionPage`**: Trang chính hiển thị UI
- **`PaymentMethodCard`**: Widget hiển thị từng hình thức thanh toán
