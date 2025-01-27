



import '../../domain/pending_entity.dart';
import 'driver_orders_response.dart';


class PendingOrdersResponse {
  PendingOrdersResponse({
    this.message,
    this.metadata,
    this.orders,});
    this.metadata,
    this.orders,
    this.message,
  });

  Metadata? metadata;
  List<OrderPending>? orders;
  String? message;

  PendingOrdersResponse.fromJson(dynamic json) {
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
  factory PendingOrdersResponse.fromJson(Map<dynamic, dynamic> json) =>
      PendingOrdersResponse(
        metadata: Metadata.fromJson(json["metadata"]),
        orders: List<OrderPending>.from(json["orders"].map((x) => OrderPending.fromJson(x))),
        message: json["message"],
      );

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
  Map<dynamic, dynamic> toJson() => {
        "metadata": metadata?.toJson(),
        "orders": List<dynamic>.from(orders!.map((x) => x.toJson())) ?? [],
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

class Orders {
  Orders({
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
    this.v,
    this.store,});

  Orders.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['orderItems'] != null) {
      orderItems = [];
      json['orderItems'].forEach((v) {
        orderItems?.add(OrderItems.fromJson(v));
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
    v = json['__v'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
  }
  String? id;
  User? user;
  List<OrderItems>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;
  Store? store;
class OrderPending {
  OrderPending({
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

  factory OrderPending.fromJson(Map<dynamic, dynamic> json) => OrderPending(
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

  Map<dynamic, dynamic> toJson() => {
        "orderNumber": orderNumber,
        "totalPrice": totalPrice,
        "store": store?.toJson(),
        "orderItems":
            List<dynamic>.from(orderItems?.map((x) => x.toJson()) ?? []),
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

class OrderItems {
  OrderItems({
    this.product,
    this.price,
    this.quantity,
    this.id,});
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

  OrderItems.fromJson(dynamic json) {
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    id = json['_id'];
  }
  Product? product;
  num? price;
  num? quantity;
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

  Map<dynamic, dynamic> toJson() => {
        "product": product?.toJson(),
        "quantity": quantity,
        "price": price,
        "_id": id,
      };
}

class Product {
  Product({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,});

  Product.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    discount = json['discount'];
    sold = json['sold'];
  }
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? discount;
  num? sold;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['imgCover'] = imgCover;
    map['images'] = images;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['quantity'] = quantity;
    map['category'] = category;
    map['occasion'] = occasion;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['discount'] = discount;
    map['sold'] = sold;
    return map;
  }

}
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
        "images": List<dynamic>.from(images!.map((x) => x)) ?? [],
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
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.passwordChangedAt,});

  User.fromJson(dynamic json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    passwordChangedAt = json['passwordChangedAt'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
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
  String? photo;
  String? passwordChangedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['passwordChangedAt'] = passwordChangedAt;
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
  num? currentPage;
  num? totalPages;
  num? totalItems;
  num? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['totalPages'] = totalPages;
    map['totalItems'] = totalItems;
    map['limit'] = limit;
    return map;
  }

}