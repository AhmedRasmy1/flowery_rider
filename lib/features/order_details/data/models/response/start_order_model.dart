import '../../../domain/entities/start_order_entity.dart';


class StartOrderModel {
  String? message;
  Orders? orders;

  StartOrderModel({this.message, this.orders});

  StartOrderModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    orders =
    json['orders'] != null ? new Orders.fromJson(json['orders']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.orders != null) {
      data['orders'] = this.orders!.toJson();
    }
    return data;
  }
  StartOrderEntity toStartOrderEntity(){
    return StartOrderEntity(
        message: message
    );
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
        orderItems!.add(new OrderItems.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    if (this.orderItems != null) {
      data['orderItems'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    data['paymentType'] = this.paymentType;
    data['isPaid'] = this.isPaid;
    data['isDelivered'] = this.isDelivered;
    data['state'] = this.state;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['orderNumber'] = this.orderNumber;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = this.product;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}



