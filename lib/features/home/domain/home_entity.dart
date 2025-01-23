
import '../data/response/driver_orders_response.dart';

class DriverOrdersEntity {
  DriverOrdersEntity({
    required this.metadata,
    required this.orders,
    required this.message,
  });

  Metadata metadata;
  List<OrderElement> orders;
  String message;
}