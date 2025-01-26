/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation
library;

import 'dart:convert';

import 'package:flowery_rider/features/home/domain/home_entity.dart';

DriverOrdersResponse driverOrdersResponseFromJson(String str) =>
    DriverOrdersResponse.fromJson(json.decode(str));

String driverOrdersResponseToJson(DriverOrdersResponse data) =>
    json.encode(data.toJson());

class DriverOrdersResponse {
  DriverOrdersResponse({
    this.metadata,
     this.orders,
   this.message,
  });

  Metadata? metadata;
  List<OrderElement>? orders;
  String? message;

  factory DriverOrdersResponse.fromJson(Map<dynamic, dynamic> json) =>
      DriverOrdersResponse(
        metadata: Metadata.fromJson(json["metadata"]),
        orders: List<OrderElement>.from(
            json["orders"].map((x) => OrderElement.fromJson(x))),
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
        "message": message,
      };

  DriverOrdersEntity toDriverOrderEntity() {
    return DriverOrdersEntity(
      metadata: metadata,
      orders: orders,
      message: message,
    );
  }
}

class Metadata {
  Metadata({
   this.totalItems,
  this.totalPages,
    this.limit,
    this.currentPage,
  });

  int? totalItems;
  int? totalPages;
  int? limit;
  int? currentPage;

  factory Metadata.fromJson(Map<dynamic, dynamic> json) => Metadata(
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        limit: json["limit"],
        currentPage: json["currentPage"],
      );

  Map<dynamic, dynamic> toJson() => {
        "totalItems": totalItems,
        "totalPages": totalPages,
        "limit": limit,
        "currentPage": currentPage,
      };
}

class OrderElement {
  OrderElement({
  this.createdAt,
this.driver,
   this.v,
this.id,
this.store,
   this.order,
this.updatedAt,
  });

  DateTime? createdAt;
  String? driver;
  int? v;
  String? id;
  Store? store;
  OrderOrder? order;
  DateTime? updatedAt;

  factory OrderElement.fromJson(Map<dynamic, dynamic> json) => OrderElement(
        createdAt: DateTime.parse(json["createdAt"]),
        driver: json["driver"],
        v: json["__v"],
        id: json["_id"],
        store: Store.fromJson(json["store"]),
        order: OrderOrder.fromJson(json["order"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "driver": driver,
        "__v": v,
        "_id": id,
        "store": store?.toJson(),
        "order": order?.toJson(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class OrderOrder {
  OrderOrder({
  this.isPaid,
   this.isDelivered,
    this.createdAt,
     this.orderNumber,
 this.totalPrice,
  this.v,
   this.id,
 this.state,
    this.user,
  this.orderItems,
  this.updatedAt, required paymentType,
  });

  bool? isPaid;
  bool? isDelivered;
  DateTime? createdAt;
  String? orderNumber;
  int? totalPrice;
  int? v;
  String? id;
  String? state;
  User? user;
  List<OrderItem>? orderItems;
  String? paymentType;
  DateTime? updatedAt;

  factory OrderOrder.fromJson(Map<dynamic, dynamic> json) => OrderOrder(
        isPaid: json["isPaid"],
        isDelivered: json["isDelivered"],
        createdAt: DateTime.parse(json["createdAt"]),
        orderNumber: json["orderNumber"],
        totalPrice: json["totalPrice"],
        v: json["__v"],
        id: json["_id"],
        state: json["state"],
        user: User.fromJson(json["user"]),
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
        paymentType: json["paymentType"],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "isPaid": isPaid,
        "isDelivered": isDelivered,
        "createdAt": createdAt?.toIso8601String(),
        "orderNumber": orderNumber,
        "totalPrice": totalPrice,
        "__v": v,
        "_id": id,
        "state": state,
        "user": user?.toJson(),
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())) ??[],
        "paymentType": paymentType,
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class OrderItem {
  OrderItem({
    this.product,
this.quantity,
  this.price,
   this.id,
  });

  Product? product;
  int? quantity;
  int? price;
  String? id;

  factory OrderItem.fromJson(Map<dynamic, dynamic> json) => OrderItem(
        product: Product.fromJson(json["product"]),
        quantity: json["quantity"],
        price: json["price"],
        id: json["_id"],
      );

  Map<dynamic, dynamic> toJson() => {
        "product": product?.toJson(),
        "quantity": quantity,
        "price": price,
        "_id": id,
      };
}

class Product {
  Product({
   this.price,
   this.id,
  });

  int? price;
  String? id;

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        price: json["price"],
        id: json["_id"],
      );

  Map<dynamic, dynamic> toJson() => {
        "price": price,
        "_id": id,
      };
}

class User {
  User({
   this.firstName,
    this.lastName,
  this.gender,
    this.phone,
   this.photo,
     this.id,
     this.email,
  });

  String? firstName;
  String? lastName;
  String? gender;
  String? phone;
  String? photo;
  String? id;
  String? email;

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        phone: json["phone"],
        photo: json["photo"],
        id: json["_id"],
        email: json["email"],
      );

  Map<dynamic, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "phone": phone,
        "photo": photo,
        "_id": id,
        "email": email,
      };
}

class Store {
  Store({
   this.image,
 this.address,
 this.phoneNumber,
 this.latLong,
    this.name,
  });

  String? image;
  String? address;
  String? phoneNumber;
  String? latLong;
  String? name;

  factory Store.fromJson(Map<dynamic, dynamic> json) => Store(
        image: json["image"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        latLong: json["latLong"],
        name: json["name"],
      );

  Map<dynamic, dynamic> toJson() => {
        "image": image,
        "address": address,
        "phoneNumber": phoneNumber,
        "latLong": latLong,
        "name": name,
      };
}
