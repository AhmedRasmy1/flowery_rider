
import '../data/response/driver_orders_response.dart';

class DriverOrdersEntity {
  DriverOrdersEntity({
this.metadata,
  this.orders,
   this.message,
  });

  Metadata? metadata;
  List<OrderElement>? orders;
  String? message;
}