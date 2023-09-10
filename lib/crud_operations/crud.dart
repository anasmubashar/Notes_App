import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addTask(String title, String notes) async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;
    var time = DateTime.now();

    await FirebaseFirestore.instance
        .collection('notes')
        .doc(uid)
        .collection('mynotes')
        .doc(time.toString())
        .set({
      'title': title,
      'notes': notes,
      'time': time,
    });
  } else {
    print('User is not logged in.');
  }
}
