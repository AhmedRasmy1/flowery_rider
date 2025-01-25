import '../../../domain/entities/start_order_entity.dart';

class StartOrderModel {
  String? message;
  Orders? orders;

  StartOrderModel({this.message, this.orders});

  StartOrderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    orders = json['orders'] != null ? Orders.fromJson(json['orders']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (orders != null) {
      data['orders'] = orders!.toJson();
    }
    return data;
  }

  StartOrderEntity toStartOrderEntity() {
    return StartOrderEntity(message: message);
  }
}

class Orders {
  String? sId;
  String? user;
  List<OrderItems>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? iV;

  Orders(
      {this.sId,
      this.user,
      this.orderItems,
      this.totalPrice,
      this.paymentType,
      this.isPaid,
      this.isDelivered,
      this.state,
      this.createdAt,
      this.updatedAt,
      this.orderNumber,
      this.iV});

  Orders.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(OrderItems.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    paymentType = json['paymentType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    state = json['state'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderNumber = json['orderNumber'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    if (orderItems != null) {
      data['orderItems'] = orderItems!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = totalPrice;
    data['paymentType'] = paymentType;
    data['isPaid'] = isPaid;
    data['isDelivered'] = isDelivered;
    data['state'] = state;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['orderNumber'] = orderNumber;
    data['__v'] = iV;
    return data;
  }
}

class OrderItems {
  String? product;
  num? price;
  num? quantity;
  String? sId;

  OrderItems({this.product, this.price, this.quantity, this.sId});

  OrderItems.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    price = json['price'];
    quantity = json['quantity'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product;
    data['price'] = price;
    data['quantity'] = quantity;
    data['_id'] = sId;
    return data;
  }
}
