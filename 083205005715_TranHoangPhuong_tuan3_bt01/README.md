# Bài Tập Tuần 3 - Nullable Types

Ứng dụng Flutter demo về cách xử lý Nullable. Bài tập làm quen với việc khai báo và quản lý các biến có thể nhận giá trị `null`.

## Tính năng chính

- **Form nhập liệu**: Nhập tên, email và số điện thoại
- **Xử lý null**: Các trường input sử dụng `String?` (nullable string)
- **Nút Submit**: Xác nhận dữ liệu và hiển thị kết quả
- **Nút Reset**: Xóa toàn bộ dữ liệu và đặt lại giá trị null
- **Hiển thị kết quả**: Hiện tên, email và số điện thoại (hoặc null nếu không nhập)

## Các khái niệm chính

1. **Nullable Type (`String?`)**: Biến có thể chứa giá trị `null`
2. **Điều kiện kiểm tra rỗng**: `isEmpty` để kiểm tra chuỗi trống
3. **State Management**: Sử dụng `setState()` để cập nhật UI
4. **TextEditingController**: Quản lý dữ liệu từ TextField
