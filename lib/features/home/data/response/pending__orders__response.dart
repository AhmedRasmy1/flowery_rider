/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation
library;

import 'dart:convert';

import '../../domain/pending_entity.dart';
import 'driver_orders_response.dart';

PendingOrdersResponse pendingOrdersResponseFromJson(String str) =>
    PendingOrdersResponse.fromJson(json.decode(str));

String pendingOrdersResponseToJson(PendingOrdersResponse data) =>
    json.encode(data.toJson());

class PendingOrdersResponse {
  PendingOrdersResponse({
    this.metadata,
   this.orders,
   this.message,
  });

  Metadata? metadata;
  List<Order>? orders;
  String? message;

  factory PendingOrdersResponse.fromJson(Map<dynamic, dynamic> json) =>
      PendingOrdersResponse(
        metadata: Metadata.fromJson(json["metadata"]),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson()))??[],
        "message": message,
      };

  PendingDriverOrdersEntity toPendingDriverOrderEntity() {
    return PendingDriverOrdersEntity(
      metadata: metadata,
      orders: orders,
      message: message,
    );
  }
}

class Order {
  Order({
     this.orderNumber,
  this.totalPrice,
  this.store,
  this.orderItems,
   this.paymentType,
   this.isPaid,
   this.isDelivered,
    this.createdAt,
     this.v,
    this.id,
    this.state,
  this.user,
   this.updatedAt,
  });

  String? orderNumber;
  double? totalPrice;
  Store? store;
  List<OrderItem>? orderItems;
  PaymentType? paymentType;
  bool? isPaid;
  bool? isDelivered;
  DateTime? createdAt;
  int? v;
  String? id;
  State? state;
  User? user;
  DateTime? updatedAt;

  factory Order.fromJson(Map<dynamic, dynamic> json) => Order(
        orderNumber: json["orderNumber"],
        totalPrice: json["totalPrice"]?.toDouble(),
        store: Store.fromJson(json["store"]),
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
        paymentType: paymentTypeValues.map[json["paymentType"]]!,
        isPaid: json["isPaid"],
        isDelivered: json["isDelivered"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        id: json["_id"],
        state: stateValues.map[json["state"]]!,
        user: User.fromJson(json["user"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "orderNumber": orderNumber,
        "totalPrice": totalPrice,
        "store": store?.toJson(),
        "orderItems": List<dynamic>.from(orderItems?.map((x) => x.toJson())??[]),
        "paymentType": paymentTypeValues.reverse[paymentType],
        "isPaid": isPaid,
        "isDelivered": isDelivered,
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
        "_id": id,
        "state": stateValues.reverse[state],
        "user": user?.toJson(),
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
     this.occasion,
    this.sold,
  this.images,
    this.quantity,
    this.description,
  this.discount,
    this.title,
   this.createdAt,
  this.price,
  this.v,
  this.id,
this.category,
    this.priceAfterDiscount,
    this.slug,
 this.imgCover,
    this.updatedAt,
  });

  Occasion? occasion;
  int? sold;
  List<String>? images;
  int? quantity;
  String? description;
  int? discount;
  Title? title;
  DateTime? createdAt;
  int? price;
  int? v;
  ProductId? id;
  Category? category;
  int? priceAfterDiscount;
  Slug? slug;
  ImgCover? imgCover;
  DateTime? updatedAt;

  factory Product.fromJson(Map<dynamic, dynamic> json) => Product(
        occasion: occasionValues.map[json["occasion"]],
        sold: json["sold"],
        images: List<String>.from(json["images"].map((x) => x)),
        quantity: json["quantity"],
        description: json["description"],
        discount: json["discount"],
        title: titleValues.map[json["title"]],
        createdAt: DateTime.parse(json["createdAt"]),
        price: json["price"],
        v: json["__v"],
        id: productIdValues.map[json["_id"]],
        category: categoryValues.map[json["category"]],
        priceAfterDiscount: json["priceAfterDiscount"],
        slug: slugValues.map[json["slug"]],
        imgCover: imgCoverValues.map[json["imgCover"]],
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "occasion": occasionValues.reverse[occasion],
        "sold": sold,
        "images": List<dynamic>.from(images!.map((x) => x)) ??[],
        "quantity": quantity,
        "description": description,
        "discount": discount,
        "title": titleValues.reverse[title],
        "createdAt": createdAt?.toIso8601String(),
        "price": price,
        "__v": v,
        "_id": productIdValues.reverse[id],
        "category": categoryValues.reverse[category],
        "priceAfterDiscount": priceAfterDiscount,
        "slug": slugValues.reverse[slug],
        "imgCover": imgCoverValues.reverse[imgCover],
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

enum Category { THE_673_C46_FD1159920171827_C85 }

final categoryValues = EnumValues(
    {"673c46fd1159920171827c85": Category.THE_673_C46_FD1159920171827_C85});

enum ProductId {
  THE_673_E1_CD711599201718280_FB,
  THE_6745096_C90_AB40_A0685402_FC,
  THE_6745129_A90_AB40_A068540353
}

final productIdValues = EnumValues({
  "673e1cd711599201718280fb": ProductId.THE_673_E1_CD711599201718280_FB,
  "6745096c90ab40a0685402fc": ProductId.THE_6745096_C90_AB40_A0685402_FC,
  "6745129a90ab40a068540353": ProductId.THE_6745129_A90_AB40_A068540353
});

enum ImgCover {
  FEFA790_A_F0_C1_42_A0_869934_E8_FC065812_COVER_IMAGE_PNG,
  THE_336_D4_A68_109_D_4_F29_A35_C_D5_CA2215_B4_FF_COVER_IMAGE_PNG,
  THE_7_A2_F7_D11_FD7_D_4_F85_9_CB7_5_E6_CABD475_BC_COVER_IMAGE_PNG
}

final imgCoverValues = EnumValues({
  "fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png":
      ImgCover.FEFA790_A_F0_C1_42_A0_869934_E8_FC065812_COVER_IMAGE_PNG,
  "336d4a68-109d-4f29-a35c-d5ca2215b4ff-cover_image.png":
      ImgCover.THE_336_D4_A68_109_D_4_F29_A35_C_D5_CA2215_B4_FF_COVER_IMAGE_PNG,
  "7a2f7d11-fd7d-4f85-9cb7-5e6cabd475bc-cover_image.png":
      ImgCover.THE_7_A2_F7_D11_FD7_D_4_F85_9_CB7_5_E6_CABD475_BC_COVER_IMAGE_PNG
});

enum Occasion {
  THE_673_B34_C21159920171827_AE0,
  THE_673_B351_E1159920171827_AE5
}

final occasionValues = EnumValues({
  "673b34c21159920171827ae0": Occasion.THE_673_B34_C21159920171827_AE0,
  "673b351e1159920171827ae5": Occasion.THE_673_B351_E1159920171827_AE5
});

enum Slug {
  WDDING_FLOWER,
  FOREVER_PINK_OR_BABY_ROSES,
  EMOTIONAL_MOMENTS_BOUQUET_OR_25_CHRYSANTHEMUM
}

final slugValues = EnumValues({
  "emotional-moments-bouquet-or-25-chrysanthemum":
      Slug.EMOTIONAL_MOMENTS_BOUQUET_OR_25_CHRYSANTHEMUM,
  "forever-pink-or-baby-roses": Slug.FOREVER_PINK_OR_BABY_ROSES,
  "wdding-flower": Slug.WDDING_FLOWER
});

enum Title {
  WDDING_FLOWER,
  FOREVER_PINK_BABY_ROSES,
  EMOTIONAL_MOMENTS_BOUQUET_25_CHRYSANTHEMUM
}

final titleValues = EnumValues({
  "Emotional Moments Bouquet | 25 Chrysanthemum":
      Title.EMOTIONAL_MOMENTS_BOUQUET_25_CHRYSANTHEMUM,
  "Forever Pink | Baby Roses": Title.FOREVER_PINK_BABY_ROSES,
  "Wdding Flower": Title.WDDING_FLOWER
});

enum PaymentType { CASH }

final paymentTypeValues = EnumValues({"cash": PaymentType.CASH});

enum State { PENDING }

final stateValues = EnumValues({"pending": State.PENDING});

class Store {
  Store({
    this.image,
 this.address,
 this.phoneNumber,
  this.latLong,
    this.name,
  });

  String? image;
  Address? address;
  String? phoneNumber;
  LatLong? latLong;
  Name? name;

  factory Store.fromJson(Map<dynamic, dynamic> json) => Store(
        image: json["image"],
        address: addressValues.map[json["address"]]!,
        phoneNumber: json["phoneNumber"],
        latLong: latLongValues.map[json["latLong"]]!,
        name: nameValues.map[json["name"]]!,
      );

  Map<dynamic, dynamic> toJson() => {
        "image": image,
        "address": addressValues.reverse[address],
        "phoneNumber": phoneNumber,
        "latLong": latLongValues.reverse[latLong],
        "name": nameValues.reverse[name],
      };
}

enum Address { THE_123_FIXED_ADDRESS_CITY_COUNTRY }

final addressValues = EnumValues({
  "123 Fixed Address, City, Country": Address.THE_123_FIXED_ADDRESS_CITY_COUNTRY
});

enum LatLong { THE_3777491224194 }

final latLongValues =
    EnumValues({"37.7749,-122.4194": LatLong.THE_3777491224194});

enum Name { ELEVATE_FLOWER_APP_STORE }

final nameValues =
    EnumValues({"Elevate FlowerApp Store": Name.ELEVATE_FLOWER_APP_STORE});

class User {
  User({
    this.firstName,
     this.lastName,
  this.gender,
   this.phone,
  this.photo,
   this.id,
     this.email,
    this.passwordChangedAt,
  });

  FirstName? firstName;
  LastName? lastName;
  Gender? gender;
  String? phone;
  Photo? photo;
  UserId? id;
  Email? email;
  DateTime? passwordChangedAt;

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        firstName: firstNameValues.map[json["firstName"]],
        lastName: lastNameValues.map[json["lastName"]],
        gender: genderValues.map[json["gender"]],
        phone: json["phone"],
        photo: photoValues.map[json["photo"]],
        id: userIdValues.map[json["_id"]],
        email: emailValues.map[json["email"]],
        passwordChangedAt: json["passwordChangedAt"] == null
            ? null
            : DateTime.parse(json["passwordChangedAt"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "firstName": firstNameValues.reverse[firstName],
        "lastName": lastNameValues.reverse[lastName],
        "gender": genderValues.reverse[gender],
        "phone": phone,
        "photo": photoValues.reverse[photo],
        "_id": userIdValues.reverse[id],
        "email": emailValues.reverse[email],
        "passwordChangedAt": passwordChangedAt?.toIso8601String(),
      };
}

enum Email { AHMEDMUTTI222_GMAIL_COM, RAWAN_MAGDY_FAHMY_GMAIL_COM }

final emailValues = EnumValues({
  "ahmedmutti222@gmail.com": Email.AHMEDMUTTI222_GMAIL_COM,
  "rawan.magdy.fahmy@gmail.com": Email.RAWAN_MAGDY_FAHMY_GMAIL_COM
});

enum FirstName { ELEVATE, RAWAN }

final firstNameValues =
    EnumValues({"Elevate": FirstName.ELEVATE, "rawan ": FirstName.RAWAN});

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({"female": Gender.FEMALE, "male": Gender.MALE});

enum UserId {
  THE_678_A783_D3_C3797492747_C8_E6,
  THE_673_A676_F1159920171827_A5_D
}

final userIdValues = EnumValues({
  "673a676f1159920171827a5d": UserId.THE_673_A676_F1159920171827_A5_D,
  "678a783d3c3797492747c8e6": UserId.THE_678_A783_D3_C3797492747_C8_E6
});

enum LastName { TECH, MAGDY }

final lastNameValues =
    EnumValues({"magdy ": LastName.MAGDY, "Tech": LastName.TECH});

enum Photo {
  DEFAULT_PROFILE_PNG,
  THE_087_D7961_C14_B_409_E_AAD8_2_BB84196_F9_E7_UNNAMED_PNG
}

final photoValues = EnumValues({
  "default-profile.png": Photo.DEFAULT_PROFILE_PNG,
  "087d7961-c14b-409e-aad8-2bb84196f9e7-unnamed.png":
      Photo.THE_087_D7961_C14_B_409_E_AAD8_2_BB84196_F9_E7_UNNAMED_PNG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
