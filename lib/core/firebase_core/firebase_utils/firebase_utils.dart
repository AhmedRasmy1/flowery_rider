import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/order_details_add_firestore.dart';

class FirebaseUtils {
  static CollectionReference<OrderInfo> _getDriverCollection() {
    return FirebaseFirestore.instance
        .collection('OrdersInfo')
        .withConverter<OrderInfo>(
          fromFirestore: (snapshot, options) =>
              OrderInfo.fromJson(snapshot.data()!),
          toFirestore: (orderInfo, options) => orderInfo.toJson(),
        );
  }
/// add Order In FireBase

  static Future<void> addOrderInFireBase({
    required OrderInfo orderInfo,
    required List<ProductInfo> productInfo,
    required StoreMetadata storeInfo,
    required UserInfo userInfo,
    required DriverInfo driverInfo,
  }) async {
    var collection = _getDriverCollection();
    await collection.doc(orderInfo.id).set(orderInfo);
    var batch = FirebaseFirestore.instance.batch();

    /// Products
    var productsCollection = collection
        .doc(orderInfo.id)
        .collection('Products')
        .withConverter<ProductInfo>(
          fromFirestore: (snapshot, options) =>
              ProductInfo.fromJson(snapshot.data()!),
          toFirestore: (productInfo, options) => productInfo.toJson(),
        );
    for (final product in productInfo) {
      var productDoc = productsCollection.doc();
      batch.set(productDoc, product);
    }

    /// Store
    var storeCollection = collection
        .doc(orderInfo.id)
        .collection('Store')
        .withConverter<StoreMetadata>(
          fromFirestore: (snapshot, options) =>
              StoreMetadata.fromJson(snapshot.data()!),
          toFirestore: (storeInfo, options) => storeInfo.toJson(),
        );
    var storeDoc = storeCollection.doc();
    batch.set(storeDoc, storeInfo);

    /// User
    var userCollection =
        collection.doc(orderInfo.id).collection('User').withConverter<UserInfo>(
              fromFirestore: (snapshot, options) =>
                  UserInfo.fromJson(snapshot.data()!),
              toFirestore: (userInfo, options) => userInfo.toJson(),
            );
    var userDoc = userCollection.doc();
    batch.set(userDoc, userInfo);

    /// Driver
    var driverCollection = collection
        .doc(orderInfo.id)
        .collection('Driver')
        .withConverter<DriverInfo>(
          fromFirestore: (snapshot, options) =>
              DriverInfo.fromJson(snapshot.data()!),
          toFirestore: (driverInfo, options) => driverInfo.toJson(),
        );
    var driverDoc = driverCollection.doc();
    batch.set(driverDoc, driverInfo);
    await batch.commit();
  }

/// fetch Order From Firebase
  static Future<OrderDetails> fetchOrderFromFirebase(String orderId) async {
    var collection = _getDriverCollection();

    ///  OrderInfo
    var orderSnapshot = await collection.doc(orderId).get();
    if (!orderSnapshot.exists) {
      throw Exception('Order with ID $orderId does not exist.');
    }
    var orderInfo = orderSnapshot.data()!;

    ///  Products
    var productsCollection = collection
        .doc(orderId)
        .collection('Products')
        .withConverter<ProductInfo>(
          fromFirestore: (snapshot, options) =>
              ProductInfo.fromJson(snapshot.data()!),
          toFirestore: (productInfo, options) => productInfo.toJson(),
        );
    var productsSnapshot = await productsCollection.get();
    var products = productsSnapshot.docs.map((doc) => doc.data()).toList();

    ///  User
    var userCollection =
        collection.doc(orderId).collection('User').withConverter<UserInfo>(
              fromFirestore: (snapshot, options) =>
                  UserInfo.fromJson(snapshot.data()!),
              toFirestore: (userInfo, options) => userInfo.toJson(),
            );
    var userSnapshot = await userCollection.get();
    var user =
        userSnapshot.docs.isNotEmpty ? userSnapshot.docs.first.data() : null;

    ///  Driver
    var driverCollection =
        collection.doc(orderId).collection('Driver').withConverter<DriverInfo>(
              fromFirestore: (snapshot, options) =>
                  DriverInfo.fromJson(snapshot.data()!),
              toFirestore: (driverInfo, options) => driverInfo.toJson(),
            );
    var driverSnapshot = await driverCollection.get();
    var driver = driverSnapshot.docs.isNotEmpty
        ? driverSnapshot.docs.first.data()
        : null;


    return OrderDetails(
      orderInfo: orderInfo,
      productInfo: products,
      userInfo: user,
      driverInfo: driver,
    );
  }
/// updateOrderState
  static Future<void> updateOrderState(
      String orderId, OrderStateModel updatedData ) async {
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

//
// static Future<void> addOrderInFireBase(
//     {required OrderInfo orderInfo,
//     required List<ProductInfo> productInfo,
//     required StoreMetadata storeInfo,
//     required UserInfo userInfo,
//     required DriverInfo driverInfo,
//
//     }) async {
//   var collection = _getDriverCollection();
//   await collection.doc(orderInfo.id).set(orderInfo);
//   /// products SubCollection
//   var productsCollection = collection
//       .doc('orderInfo.id')
//       .collection('Products')
//       .withConverter<ProductInfo>(
//         fromFirestore: (snapshot, options) =>
//             ProductInfo.fromJson(snapshot.data()!),
//         toFirestore: (productInfo, options) => productInfo.toJson(),
//       );
//   for(final product in productInfo){
//     await productsCollection.add(product);
//   }
//   ///  store SubCollection
//   var storeCollection = collection
//       .doc(orderInfo.id)
//       .collection('Store')
//       .withConverter<StoreMetadata>(
//     fromFirestore: (snapshot, options) =>
//         StoreMetadata.fromJson(snapshot.data()!),
//     toFirestore: (storeInfo, options) => storeInfo.toJson(),
//   );
//     await storeCollection.add(storeInfo);
//   /// user SubCollection
//   var userCollection = collection
//       .doc(orderInfo.id)
//       .collection('User')
//       .withConverter<UserInfo>(
//     fromFirestore: (snapshot, options) =>
//         UserInfo.fromJson(snapshot.data()!),
//     toFirestore: (userInfo, options) => userInfo.toJson(),
//   );
//   await userCollection.add(userInfo);
//   /// driver SubCollection
//   var driverCollection = collection
//       .doc(orderInfo.id)
//       .collection('Driver')
//       .withConverter<DriverInfo>(
//     fromFirestore: (snapshot, options) =>
//         DriverInfo.fromJson(snapshot.data()!),
//     toFirestore: (driverInfo, options) => driverInfo.toJson(),
//   );
//   await driverCollection.add(driverInfo);
// }
//
