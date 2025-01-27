import '../data/response/pending__orders__response.dart';

class PendingDriverOrdersEntity {
  PendingDriverOrdersEntity({
    this.metadata,
    this.orders,
    this.message,
  });

  Metadata? metadata;
  List<Orders>? orders;
  String? message;
}
