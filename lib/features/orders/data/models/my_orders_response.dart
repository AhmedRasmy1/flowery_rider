import '../../domain/entities/my_orders_entity.dart';

class MyOrdersResponse {
  MyOrdersResponse({
      this.message, 
      this.metadata, 
      this.orders,});

  MyOrdersResponse.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<Orders>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  MyOrdersEntity toMyOrdersEntity() {
    return MyOrdersEntity(
      metadata: metadata,
      orders: orders,
      message: message,
    );
  }


}

class Orders {
  Orders({
      this.id, 
      this.driver, 
      this.order, 
      this.v, 
      this.createdAt, 
      this.updatedAt, 
      this.store,});

  Orders.fromJson(dynamic json) {
    id = json['_id'];
    driver = json['driver'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    v = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }
  String? id;
  String? driver;
  Order? order;
  int? v;
  String? createdAt;
  String? updatedAt;
  Store? store;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['driver'] = driver;
    if (order != null) {
      map['order'] = order?.toJson();
    }
    map['__v'] = v;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    if (store != null) {
      map['store'] = store?.toJson();
    }
    return map;
  }

}

class Store {
  Store({
      this.name, 
      this.image, 
      this.address, 
      this.phoneNumber, 
      this.latLong,});

  Store.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    latLong = json['latLong'];
  }
  String? name;
  String? image;
  String? address;
  String? phoneNumber;
  String? latLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;
    map['latLong'] = latLong;
    return map;
  }

}

class Order {
  Order({
      this.id, 
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
      this.v,});

  Order.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['orderItems'] != null) {
      orderItems = [];
      json['orderItems'].forEach((v) {
        orderItems?.add(OrderItems.fromJson(v));
      });
    }
    totalPrice=(json['totalPrice'] as num?)?.toInt();

    //totalPrice = json['totalPrice'];
    paymentType = json['paymentType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    state = json['state'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderNumber = json['orderNumber'];
    v = json['__v'];
  }
  String? id;
  User? user;
  List<OrderItems>? orderItems;
  int? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (orderItems != null) {
      map['orderItems'] = orderItems?.map((v) => v.toJson()).toList();
    }
    map['totalPrice'] = totalPrice;
    map['paymentType'] = paymentType;
    map['isPaid'] = isPaid;
    map['isDelivered'] = isDelivered;
    map['state'] = state;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['orderNumber'] = orderNumber;
    map['__v'] = v;
    return map;
  }

}

class OrderItems {
  OrderItems({
      this.product, 
      this.price, 
      this.quantity, 
      this.id,});

  OrderItems.fromJson(dynamic json) {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    id = json['_id'];
  }
  Product? product;
  int? price;
  int? quantity;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    map['quantity'] = quantity;
    map['_id'] = id;
    return map;
  }

}

class Product {
  Product({
      this.id, 
      this.price,});

  Product.fromJson(dynamic json) {
    id = json['_id'];
    price = json['price'];
  }
  String? id;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['price'] = price;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.gender, 
      this.phone, 
      this.photo,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    return map;
  }

}

class Metadata {
  Metadata({
      this.currentPage, 
      this.totalPages, 
      this.totalItems, 
      this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    limit = json['limit'];
  }
  int? currentPage;
  int? totalPages;
  int? totalItems;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['totalPages'] = totalPages;
    map['totalItems'] = totalItems;
    map['limit'] = limit;
    return map;
  }

}