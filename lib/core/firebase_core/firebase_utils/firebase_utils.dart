import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../features/home/data/response/pending__orders__response.dart';

class FirebaseUtils {
  static CollectionReference<Orders> _getDriverCollection() {
    return FirebaseFirestore.instance
        .collection('OrdersInfo')
        .withConverter<Orders>(
      fromFirestore: (snapshot, options) =>
          Orders.fromJson(snapshot.data()!),
      toFirestore: (orderInfo, options) => orderInfo.toJson(),
    );
  }

  /// add Order To Firebase
  static Future<void> addOrderToFirebase({required Orders orders}) async {
    var ordersCollection = _getDriverCollection();
    await ordersCollection.doc(orders.id).set(orders);
    var batch = FirebaseFirestore.instance.batch();
    var orderItemsCollection =
    ordersCollection.doc(orders.id).collection('Products');
    for (var orderItem in orders.orderItems ?? []) {
      var orderItemDoc = orderItemsCollection.doc();
      batch.set(orderItemDoc, orderItem.toJson());
    }

    await batch.commit();
  }

  /// fetch Order From Firebase
  static Future<Orders?> fetchOrderFromFirebase(
      {required String orderId}) async {
    try {
      var ordersCollection = _getDriverCollection();
      var orderDoc = await ordersCollection.doc(orderId).get();
      if (!orderDoc.exists) {

        return null;
      }
      Orders order = orderDoc.data()!;
      var orderItemsCollection = ordersCollection
          .doc(orderId)
          .collection('Products')
          .withConverter<OrderItems>(
        fromFirestore: (snapshot, options) =>
            OrderItems.fromJson(snapshot.data()!),
        toFirestore: (orderItem, options) => orderItem.toJson(),
      );
      var orderItemsSnapshot = await orderItemsCollection.get();
      List<OrderItems> orderItems =
      orderItemsSnapshot.docs.map((doc) => doc.data()).toList();
      order.orderItems = orderItems;
      return order;
    } catch (e) {
      print('Error fetching order from Firebase:////////////// $e');
      return null;
    }
  }

  /// update Order State
  static Future<void> updateOrderState(String orderId,
      OrderStateModel updatedData) async {
    try {
      var document =
      FirebaseFirestore.instance.collection('OrdersInfo').doc(orderId);
      await document.update(updatedData.toJson());

      log('Order state updated successfully.');
    } catch (e) {
      log('Error updating order state: $e');
    }
  }

}

class OrderStateModel {
  String state;
  String updatedAt;

  OrderStateModel({
    required this.state,
    required this.updatedAt,
  });


  Map<String, dynamic> toJson() {
    return {
      'status': state,
      'updatedAt': updatedAt,
    };
  }


  factory OrderStateModel.fromJson(Map<String, dynamic> json) {
    return OrderStateModel(
      state: json['status'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }}