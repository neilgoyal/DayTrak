import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('users');
User? firebaseUser = FirebaseAuth.instance.currentUser;

class DatabaseService {
  static Future<void> addItem({
    required String title,
    required String date,
    required String time,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(firebaseUser!.uid).collection('tasks').doc();
    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "date": date,
      "time": time
    };
    await documentReferencer
        .set(data)
        .whenComplete(() => print("Task added to the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(firebaseUser!.uid).collection('tasks');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    required String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(firebaseUser!.uid).collection('tasks').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
