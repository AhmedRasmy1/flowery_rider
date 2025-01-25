import '../data/response/driver_orders_response.dart';
import '../data/response/pending__orders__response.dart';

class PendingDriverOrdersEntity
{

  PendingDriverOrdersEntity({
 this.metadata,
this.orders,
 this.message,
  });

  Metadata? metadata;
  List<OrderPending>? orders;
  String? message;


}