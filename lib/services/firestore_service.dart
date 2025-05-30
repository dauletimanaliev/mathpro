import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  Future<void> saveAnswer(String text) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final uid = user.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('answers')
          .add({
        'text': text,
        'created_at': Timestamp.now(),
      });
    } else {
      throw Exception('❌ Пользователь не авторизован');
    }
  }
}