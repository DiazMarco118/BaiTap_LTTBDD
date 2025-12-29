## Các Tính Năng

Ứng dụng bao gồm các cuộc trình diễn tương tác về các thành phần UI sau:

**Input Components (Các Thành Phần Nhập Liệu)**

- Text widgets and styling (Widget Text và kiểu dáng)
- Text Fields - standard and password (Trường Văn Bản - tiêu chuẩn và mật khẩu)
- Checkboxes (Các Hộp Kiểm)
- Radio Buttons (Các Nút Radio)
- Sliders (Thanh Trượt)
- Switches (Công Tắc)
- Time Pickers (Bộ Chọn Thời Gian)
- Chips (Chips)

**Layout Components (Các Thành Phần Bố Cục)**

- Columns
- Rows
- Cards
- Dividers (Dòng Phân Cách)
- Box decorations
- Carousel

**Display Components (Các Thành Phần Hiển Thị)**

- Images
- Badges
- Progress Indicators - circular and linear (Chỉ Báo Tiến Trình)
- Tooltips
  **Navigation & Feedback (Điều Hướng và Phản Hồi)**

- Menus and dropdown options (Menu và tùy chọn thả xuống)
- Bottom Sheets (Bảng Dưới)
- Dialogs (Hộp Thoại)
- Snackbars (Thanh Thông Báo)
- Segmented Buttons (Các Nút Phân Đoạn)

**Button Types (Loại Nút)**

- Elevated Buttons
- Standard Buttons
- Floating Action Buttons - FAB (Nút Hành Động Nổi)
- Icon Buttons (Nút Biểu Tượng)

## Cấu Trúc Dự Án

```
lib/
├── main.dart                    # Điểm nhập cảnh với màn hình onboarding
├── screens/                     # Màn hình chi tiết cho mỗi thành phần
│   ├── text_detail_screen.dart
│   ├── images_detail_screen.dart
│   ├── textfield_detail_screen.dart
│   ├── passwordfield_detail_screen.dart
│   ├── column_detail_screen.dart
│   ├── row_detail_screen.dart
│   ├── box_detail_screen.dart
│   ├── checkbox_detail_screen.dart
│   ├── radio_button_detail_screen.dart
│   ├── slider_detail_screen.dart
│   ├── chips_detail_screen.dart
│   ├── menus_detail_screen.dart
│   ├── switch_detail_screen.dart
│   ├── time_picker_detail_screen.dart
│   ├── bottom_sheets_detail_screen.dart
│   ├── cards_detail_screen.dart
│   ├── carousel_detail_screen.dart
│   ├── dialogs_detail_screen.dart
│   ├── dividers_detail_screen.dart
│   ├── badges_detail_screen.dart
│   ├── progress_indicators_detail_screen.dart
│   ├── snackbar_detail_screen.dart
│   ├── tooltips_detail_screen.dart
│   ├── buttons_detail_screen.dart
│   ├── floating_action_button_detail_screen.dart
│   ├── icon_button_detail_screen.dart
│   └── segmented_button_detail_screen.dart
assets/
└── jetpack_compose.png          # Hình ảnh onboarding
```
