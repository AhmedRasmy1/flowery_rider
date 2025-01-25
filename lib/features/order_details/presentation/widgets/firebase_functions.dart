import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore fireStore = FirebaseFirestore.instance;


  Future<List<Map<String, dynamic>>> startOrder() async {

      List<Map<String, dynamic>> driver = [];
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await fireStore.collection('orders').get();

      for (final doc in snapshot.docs) {
        driver.add(doc.data());
        log(doc.id);
      }
      return driver;

  }
//
// Future<List<Map<String, dynamic>>> updateOrder() async {
//
//   List<Map<String, dynamic>> driver = [];
//   final QuerySnapshot<Map<String, dynamic>> snapshot =
//   // await fireStore.collection('orders').doc('').update(data);
//
//   for (final doc in snapshot.docs) {
//     driver.add(doc.data());
//     log(doc.id);
//   }
//   return driver;
//
// }