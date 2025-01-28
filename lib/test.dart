// import 'package:flutter/material.dart';
//
// import 'core/firebase_core/model/order_details_add_firestore.dart';
//
// class OrderPage extends StatelessWidget {
//   final String orderId;
//
//   OrderPage({required this.orderId});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Details'),
//       ),
//       body: FutureBuilder<OrderDetails>(
//         future: fetchOrderDetails(orderId),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text('Error: ${snapshot.error}'),
//             );
//           } else if (snapshot.hasData) {
//             final orderDetails = snapshot.data!;
//             return OrderDetailsWidget(orderDetails: orderDetails);
//           } else {
//             return Center(
//               child: Text('No data found'),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//
// }
//
// class OrderDetailsWidget extends StatelessWidget {
//   final OrderDetails orderDetails;
//
//   const OrderDetailsWidget({required this.orderDetails});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.all(16),
//       children: [
//         Text(
//           'Order Info:',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Text(orderDetails.orderInfo.toString()),
//         SizedBox(height: 16),
//         Text(
//           'Products:',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         ...orderDetails.productInfo.map((product) => Text(product.toString())),
//         SizedBox(height: 16),
//         Text(
//           'User Info:',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Text(orderDetails.userInfo?.toString() ?? 'No user info'),
//         SizedBox(height: 16),
//         Text(
//           'Driver Info:',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Text(orderDetails.driverInfo?.toString() ?? 'No driver info'),
//       ],
//     );
//   }
// }
