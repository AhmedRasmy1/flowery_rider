import '../data/response/driver_orders_response.dart';
import '../data/response/pending__orders__response.dart';

class PendingDriverOrdersEntity
{

  PendingDriverOrdersEntity({
    required this.metadata,
    required this.orders,
    required this.message,
  });

  Metadata metadata;
  List<Order> orders;
  String message;


}