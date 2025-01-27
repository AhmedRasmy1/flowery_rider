class OrderInfo {
  OrderInfo({
    this.id,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  OrderInfo.fromJson(dynamic json) {
    id = json['_id'];

    totalPrice = json['totalPrice'];
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

  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;

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

class StoreMetadata {
  StoreMetadata({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });

  StoreMetadata.fromJson(dynamic json) {
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

class OrderItemsInfo {
  OrderItemsInfo({
    this.price,
    this.quantity,
    this.id,
  });

  OrderItemsInfo.fromJson(dynamic json) {
    price = json['price'];
    quantity = json['quantity'];
    id = json['_id'];
  }

  num? price;
  num? quantity;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['quantity'] = quantity;
    map['_id'] = id;
    return map;
  }
}

class ProductInfo {
  ProductInfo({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,
  });

  ProductInfo.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
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

class UserInfo {
  UserInfo({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.passwordChangedAt,
  });

  UserInfo.fromJson(dynamic json) {
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

class DriverInfo {
  DriverInfo({
    this.role,
    this.id,
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nIDImg,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.createdAt,
    this.passwordChangedAt,
  });

  DriverInfo.fromJson(dynamic json) {
    role = json['role'];
    id = json['_id'];
    country = json['country'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    vehicleType = json['vehicleType'];
    vehicleNumber = json['vehicleNumber'];
    vehicleLicense = json['vehicleLicense'];
    nid = json['NID'];
    nIDImg = json['NIDImg'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    createdAt = json['createdAt'];
    passwordChangedAt = json['passwordChangedAt'];
  }

  String? role;
  String? id;
  String? country;
  String? firstName;
  String? lastName;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nIDImg;
  String? email;
  String? password;
  String? gender;
  String? phone;
  String? photo;
  String? createdAt;
  String? passwordChangedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['_id'] = id;
    map['country'] = country;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['vehicleType'] = vehicleType;
    map['vehicleNumber'] = vehicleNumber;
    map['vehicleLicense'] = vehicleLicense;
    map['NID'] = nid;
    map['NIDImg'] = nIDImg;
    map['email'] = email;
    map['password'] = password;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['createdAt'] = createdAt;
    map['passwordChangedAt'] = passwordChangedAt;
    return map;
  }
}

class OrderDetails {
  OrderInfo? orderInfo;
 List< ProductInfo>? productInfo;
  UserInfo? userInfo;
  DriverInfo? driverInfo;

  OrderDetails(
      {this.orderInfo, this.productInfo, this.userInfo, this.driverInfo});
}
