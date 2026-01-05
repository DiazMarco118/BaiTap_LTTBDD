### 4 Bước Reset Mật Khẩu:

1. Forgot Password: Nhập email để nhận mã
2. Verify Code: Nhập 5 chữ số
3. Create Password: Tạo mật khẩu mới
4. Confirm: Hiển thị lại dữ liệu đã nhập từ các bước trước

## Data Flow

Dữ liệu được truyền qua các bước bằng **TextEditingController**:

```
Bước 1 (Email) → _emailController
              ↓
Bước 2 (Code)  → _codeControllers[5]
              ↓
Bước 3 (Pass)  → _passwordController
              ↓
Bước 4 (Confirm) → Hiển thị tất cả dữ liệu từ các controllers trên
```

### Cách Hoạt Động:

- Mỗi TextEditingController lưu giữ dữ liệu người dùng nhập
- Khi chuyển bước, dữ liệu vẫn được giữ lại trong state
- Ở bước Confirm, tất cả dữ liệu được lấy từ controllers và hiển thị (read-only)
- Nhấn Submit → Hiển thị snackbar xác nhận với email + code

## Ghi Chú Kỹ Thuật

- StatefulWidget: Lưu giữ state giữa các bước
- TextEditingController: Quản lý input data
- FocusNode: Quản lý focus giữa các ô code
- Navigation: Dùng `_currentStep` để điều khiển màn hình hiện tại
