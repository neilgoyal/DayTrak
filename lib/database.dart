import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('users');
User? firebaseUser = FirebaseAuth.instance.currentUser;

class DatabaseService {
  static Future<void> addItem({
    required String title,
    required String date,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(firebaseUser!.uid).collection('users').doc();
    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "date": date,
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }
}