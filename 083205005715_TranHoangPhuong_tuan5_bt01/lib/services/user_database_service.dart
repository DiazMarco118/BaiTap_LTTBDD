import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Lưu thông tin user vào Firestore
  Future<void> saveUserData(User user, {String? loginMethod}) async {
    try {
      await _firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName ?? 'No Name',
        'photoURL': user.photoURL ?? '',
        'loginMethod': loginMethod ?? 'email', // 'email' hoặc 'google'
        'lastLogin': FieldValue.serverTimestamp(),
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true)); // merge để không ghi đè createdAt

      print('User data saved to Firestore: ${user.email}');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  // Đọc thông tin user từ Firestore
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return doc.data();
      }
      return null;
    } catch (e) {
      print('❌ Error getting user data: $e');
      return null;
    }
  }

  // Update last login time
  Future<void> updateLastLogin(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('❌ Error updating last login: $e');
    }
  }

  // Get all users (admin function)
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      final snapshot = await _firestore.collection('users').get();
      return snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('❌ Error getting all users: $e');
      return [];
    }
  }

  // Delete user data
  Future<void> deleteUserData(String uid) async {
    try {
      await _firestore.collection('users').doc(uid).delete();
      print('✅ User data deleted: $uid');
    } catch (e) {
      print('❌ Error deleting user data: $e');
    }
  }
}
