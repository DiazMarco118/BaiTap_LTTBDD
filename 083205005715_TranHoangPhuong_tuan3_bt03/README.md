Hệ thống Quản lý Thư viện

## Mô tả bài làm

Ứng dụng Flutter quản lý thư viện với chức năng:

- Quản lý độc giả: Chọn người dùng và thêm đơn mượn sách
- Danh sách sách: Hiển thị thông tin chi tiết từng cuốn sách
- Danh sách nhân viên: Xem thông tin nhân viên thư viện

4 TÍNH CHẤT LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG (OOP) ÁP DỤNG

### TÍNH TRỪU TƯỢNG (Abstraction)

**Vị trí**: Lớp `abstract class LibraryEntity` (dòng 11-13)

```dart
abstract class LibraryEntity {
  String get name;
  String getInfo();
}
```

**Mục đích**:

- Định nghĩa giao diện chung cho tất cả các thực thể trong thư viện
- Các lớp `Book`, `User`, `Staff` phải cài đặt các phương thức `name` và `getInfo()`
- Ẩn đi các chi tiết cụ thể, chỉ hiển thị những gì cần thiết
- Giúp code dễ mở rộng: có thể thêm các lớp entity mới mà không cần thay đổi code hiện tại

---

### **TÍNH ĐÓNG GÓI (Encapsulation)**

**Vị trí**: Các lớp `Book` (dòng 16-40), `User` (dòng 43-62), `Staff` (dòng 68-86)

```dart
class Book implements LibraryEntity {
  final String _id;           // Thuộc tính RIÊNG TƯ (private)
  final String _name;
  final String _author;
  final int _quantity;

  // Sử dụng getter để truy cập dữ liệu một cách kiểm soát
  @override
  String get name => _name;
  String get id => _id;
  String get author => _author;
  int get quantity => _quantity;
}
```

**Mục đích**:

- Sử dụng `_` để đánh dấu thuộc tính riêng tư (private)
- Cung cấp getter để truy cập dữ liệu một cách kiểm soát
- Ngăn chặn thay đổi dữ liệu trực tiếp từ bên ngoài
- Đảm bảo tính toàn vẹn dữ liệu: nếu muốn thay đổi logic truy cập, chỉ cần sửa một chỗ

---

### **TÍNH KẾ THỪA (Inheritance)**

**Vị trí**: Các lớp `Book`, `User`, `Staff` kế thừa từ `LibraryEntity` bằng `implements`

```dart
class Book implements LibraryEntity { ... }
class User implements LibraryEntity { ... }
class Staff implements LibraryEntity { ... }
```

**Mục đích**:

- Tất cả các thực thể library đều phải tuân theo hợp đồng của `LibraryEntity`
- Tái sử dụng giao diện chung thay vì viết lại code
- Tạo cấu trúc phân cấp rõ ràng: tất cả đều là `LibraryEntity`
- Dễ bảo trì: nếu muốn thay đổi giao diện, chỉ cần sửa class cha

---

### **TÍNH ĐA HÌNH (Polymorphism)**

**Vị trí**: Phương thức `getInfo()` được ghi đè (override) ở mỗi lớp con (dòng 39-42 cho Book, dòng 59-62 cho User, dòng 83-86 cho Staff)

```dart
// Trong Book
@override
String getInfo() {
  return 'ID: $_id | Tên: $_name | Tác giả: $_author | Số lượng: $_quantity';
}

// Trong User
@override
String getInfo() {
  return 'ID: $_id | Tên: $_name | Email: $_email';
}

// Trong Staff
@override
String getInfo() {
  return 'ID: $_id | Tên: $_name | Chức vụ: $_position';
}
```

**Mục đích**:

- Cùng một phương thức `getInfo()` nhưng có hành vi khác nhau tùy theo lớp
- Sử dụng trong các tab hiển thị: `book.getInfo()`, `user.getInfo()`, `staff.getInfo()`
- Cho phép xử lý các object khác nhau thông qua cùng một interface
- Code gọi không cần biết loại object cụ thể là gì, chỉ cần gọi `getInfo()`

## Cấu trúc các tab

- **Tab 1 - Quản lý**: Chọn người dùng, chọn sách để mượn, xem đơn mượn gần đây
- **Tab 2 - Danh sách sách**: Hiển thị tất cả sách với chi tiết (ID, tác giả, số lượng)
- **Tab 3 - Nhân viên**: Hiển thị danh sách nhân viên thư viện
