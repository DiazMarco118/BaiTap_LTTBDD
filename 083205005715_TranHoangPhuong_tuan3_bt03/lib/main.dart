import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

//TÍNH TRỪU TƯỢNG: Lớp cơ sở trừu tượng
abstract class LibraryEntity {
  String get name;
  String getInfo(); // đa hình
}

// TÍNH ĐÓNG GÓI: Các thuộc tính riêng tư với getter
class Book implements LibraryEntity {
  final String _id;
  final String _name;
  final String _author;
  final int _quantity;

  Book({
    required String id,
    required String name,
    required String author,
    required int quantity,
  }) : _id = id,
       _name = name,
       _author = author,
       _quantity = quantity;

  @override
  String get name => _name;
  String get id => _id;
  String get author => _author;
  int get quantity => _quantity;

  @override
  String getInfo() {
    return 'ID: $_id | Tên: $_name | Tác giả: $_author | Số lượng: $_quantity';
  }
}

//  TÍNH ĐÓNG GÓI: Các thuộc tính riêng tư với getter
class User implements LibraryEntity {
  final String _id;
  final String _name;
  final String _email;

  User({required String id, required String name, required String email})
    : _id = id,
      _name = name,
      _email = email;

  @override
  String get name => _name;
  String get id => _id;
  String get email => _email;

  @override
  String getInfo() {
    return 'ID: $_id | Tên: $_name | Email: $_email';
  }
}

//  TÍNH KẾ THỪA: Kế thừa từ LibraryEntity
class Staff implements LibraryEntity {
  final String _id;
  final String _name;
  final String _position;

  Staff({required String id, required String name, required String position})
    : _id = id,
      _name = name,
      _position = position;

  @override
  String get name => _name;
  String get id => _id;
  String get position => _position;

  @override
  String getInfo() {
    return 'ID: $_id | Tên: $_name | Chức vụ: $_position';
  }
}

class BorrowRecord {
  final String userId;
  final List<String> bookIds;
  final DateTime borrowDate;

  BorrowRecord({
    required this.userId,
    required this.bookIds,
    required this.borrowDate,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hệ thống Quản lý Thư viện',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Dữ liệu mẫu
  late List<Book> books = mockBooks;
  late List<User> users = List.from(mockUsers);

  late List<BorrowRecord> borrowRecords = [];

  String? _selectedUserId;
  Set<String> _selectedBookIds = {};

  @override
  void initState() {
    super.initState();
    if (users.isNotEmpty) {
      _selectedUserId = users[0].id;
    }
  }

  void _addBorrowRecord() {
    if (_selectedUserId != null && _selectedBookIds.isNotEmpty) {
      setState(() {
        borrowRecords.add(
          BorrowRecord(
            userId: _selectedUserId!,
            bookIds: _selectedBookIds.toList(),
            borrowDate: DateTime.now(),
          ),
        );
        _selectedBookIds.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thêm đơn mượn thành công!')),
      );
    }
  }

  void _changeUser() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chọn người dùng'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index].name),
                onTap: () {
                  setState(() {
                    _selectedUserId = users[index].id;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [_buildManagementTab(), _buildBooksTab(), _buildStaffTab()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Quản lý'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'DS Sách'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Người dùng',
          ),
        ],
      ),
    );
  }

  Widget _buildManagementTab() {
    User? selectedUser = users.firstWhereOrNull((u) => u.id == _selectedUserId);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Text(
            'Hệ thống Quản lý Thư viện',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Người dùng:'),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedUser?.name ?? 'Chưa chọn',
                          style: const TextStyle(fontSize: 16),
                        ),
                        ElevatedButton(
                          onPressed: _changeUser,
                          child: const Text('Đổi'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Danh sách sách để mượn
          const Text(
            'Danh sách sách',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(children: _buildBookCheckboxList()),
          ),
          const SizedBox(height: 20),

          // Nút Thêm
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _addBorrowRecord,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Thêm',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Danh sách đơn mượn
          if (borrowRecords.isNotEmpty) ...[
            const Text(
              'Đơn mượn gần đây',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ..._buildBorrowRecordsList(),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildBookCheckboxList() {
    return books.map((book) {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        child: CheckboxListTile(
          title: Text(book.name),
          subtitle: Text('Tác giả: ${book.author}'),
          value: _selectedBookIds.contains(book.id),
          onChanged: (value) {
            setState(() {
              if (value == true) {
                _selectedBookIds.add(book.id);
              } else {
                _selectedBookIds.remove(book.id);
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
        ),
      );
    }).toList();
  }

  List<Widget> _buildBorrowRecordsList() {
    return borrowRecords.asMap().entries.map((entry) {
      int index = entry.key;
      BorrowRecord record = entry.value;
      User? user = users.firstWhereOrNull((u) => u.id == record.userId);
      List<Book> borrowedBooks = books
          .where((b) => record.bookIds.contains(b.id))
          .toList();

      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đơn #${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Người dùng: ${user?.name}'),
              Text('Ngày mượn: ${record.borrowDate.toString().split('.')[0]}'),
              const SizedBox(height: 8),
              const Text('Sách:'),
              ...borrowedBooks.map((b) => Text('  • ${b.name}')).toList(),
            ],
          ),
        ),
      );
    }).toList();
  }

  // ============ TAB 2: DS SÁCH ============
  Widget _buildBooksTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [const SizedBox(height: 50), ..._buildBooksCardList()],
      ),
    );
  }

  List<Widget> _buildBooksCardList() {
    return books.map((book) {
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text('Tác giả: ${book.author}'),
              Text('ID: ${book.id}'),
              Text('Số lượng: ${book.quantity}'),
              const SizedBox(height: 8),
              Text(
                book.getInfo(),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildStaffTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _showAddStaffDialog,
              icon: const Icon(Icons.add),
              label: const Text('Thêm người dùng'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ..._buildStaffCardList(),
        ],
      ),
    );
  }

  void _showAddStaffDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm người dùng mới'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Tên người dùng'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty) {
                setState(() {
                  final lastId = int.parse(users.last.id);
                  final newId = (lastId + 1).toString().padLeft(3, '0');
                  users.add(
                    User(
                      id: newId,
                      name: nameController.text,
                      email: emailController.text,
                    ),
                  );
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thêm người dùng thành công!')),
                );
              }
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStaffCardList() {
    return users.map((user) {
      return SizedBox(
        width: double.infinity,
        height: 140,
        child: Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Email: ${user.email}'),
                Text('ID: ${user.id}'),
                Text(
                  user.getInfo(),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }
}

extension ListExtension<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
