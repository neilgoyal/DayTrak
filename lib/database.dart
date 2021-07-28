import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

concisedate(date, time) {
  String concisedate = "";
  String concisetime = "";
  Color late = Colors.black45;
  if (date == "No Date") {
    return [concisedate, concisetime, late];
  }
  DateTime fulldate = DateFormat('yyyy-MM-dd').parse('$date');
  if (time != "No Time") {
    concisetime = time;
    fulldate = DateFormat('yyyy-MM-dd hh:mm a', 'en_US').parse('$date $time');
    if (fulldate.compareTo(DateTime.now()) < 0) {
      late = Colors.red;
      concisedate = DateFormat('E, d MMM').format(DateTime.parse(date));
      return [concisedate, concisetime, late];
    }
  }
  if (fulldate.compareTo(
          DateTime.parse(DateFormat("yyyy-MM-dd").format(DateTime.now()))) <
      0) {
    late = Colors.red;
    concisedate = DateFormat('E, d MMM').format(DateTime.parse(date));
    return [concisedate, concisetime, late];
  } else if (date == DateFormat('yyyy-MM-dd').format(DateTime.now())) {
    concisedate = 'Today';
  } else if (date ==
      DateFormat('yyyy-MM-dd').format(DateTime.now().add(Duration(days: 1)))) {
    concisedate = 'Tomorrow';
  } else {
    concisedate = DateFormat('E, d MMM').format(DateTime.parse(date));
  }

  return [concisedate, concisetime, late];
}
