## Tính năng chính

### 1. Trang bìa UTH

- Hiển thị logo
- Chữ "UTH SmartTasks" sử dụng font Righteous
- Tự động chuyển sang Onboarding sau 3 giây

### 2. Onboarding Flow

Hướng dẫn người dùng về tính năng chính của ứng dụng:

- Bước 1: Easy Time Management
- Bước 2: Increase Work Effectiveness
- Bước 3: Reminder Notification

### Tính năng Onboarding:

- Cuộn giữa các bước sử dụng PageView
- Hiển thị tiến độ bằng page indicators (dấu chấm)
- Nút Back (quay lại trang trước)
- Nút Next (chuyển đến trang tiếp theo)
- Nút "Get Started" trên trang cuối cùng

## Kiến thức áp dụng

### OOP

- Sử dụng Class để tạo các Screen và Model
- OnboardingItem Model để quản lý dữ liệu Onboarding

### Navigation

- Sử dụng Navigator để điều hướng giữa các trang

## Tích hợp Firebase

Ứng dụng đã tích hợp các dịch vụ Firebase sau:

### 1. Firebase Authentication

- Đăng nhập bằng Google Sign-In

### 2. Cloud Firestore Database

- Lưu trữ thông tin người dùng khi đăng nhập
- Collection: users
- Dữ liệu: uid, email, displayName, photoURL, loginMethod, lastLogin, createdAt

### 3. Firebase Cloud Messaging (FCM)

- Nhận thông báo push notification

### 4. Firebase Remote Config

- parameters: welcome_message
