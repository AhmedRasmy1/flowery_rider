
import '../../data/models/my_orders_response.dart';

class MyOrdersEntity {
  MyOrdersEntity({
    this.message,
    this.metadata,
    this.orders,});

  String? message;
  Metadata? metadata;
  List<Orders>? orders;

}
