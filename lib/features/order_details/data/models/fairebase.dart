

class Order {
  final String id;
  final User user;
  final List<OrderItem> orderItems;
  final double totalPrice;
  final String paymentType;
  final bool isPaid;
  final bool isDelivered;
  final String state;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String orderNumber;
  final Store store;

  Order({
    required this.id,
    required this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.paymentType,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.orderNumber,
    required this.store,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['_id'],
      user: User.fromJson(json['user']),
      orderItems: (json['orderItems'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      totalPrice: json['totalPrice']?.toDouble() ?? 0.0,
      paymentType: json['paymentType'],
      isPaid: json['isPaid'],
      isDelivered: json['isDelivered'],
      state: json['state'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      orderNumber: json['orderNumber'],
      store: Store.fromJson(json['store']),
    );
  }
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      gender: json['gender'],
      phone: json['phone'],
      photo: json['photo'],
    );
  }
}

class OrderItem {
  final Product product;
  final double price;
  final int quantity;
  final String id;

  OrderItem({
    required this.product,
    required this.price,
    required this.quantity,
    required this.id,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      product: Product.fromJson(json['product']),
      price: json['price']?.toDouble() ?? 0.0,
      quantity: json['quantity'],
      id: json['_id'],
    );
  }
}

class Product {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final double price;
  final double priceAfterDiscount;
  final int quantity;
  final String category;
  final String occasion;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int discount;
  final int sold;

  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.createdAt,
    required this.updatedAt,
    required this.discount,
    required this.sold,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      imgCover: json['imgCover'],
      images: List<String>.from(json['images']),
      price: json['price']?.toDouble() ?? 0.0,
      priceAfterDiscount: json['priceAfterDiscount']?.toDouble() ?? 0.0,
      quantity: json['quantity'],
      category: json['category'],
      occasion: json['occasion'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      discount: json['discount'],
      sold: json['sold'],
    );
  }
}

class Store {
  final String name;
  final String image;
  final String address;
  final String phoneNumber;
  final String latLong;

  Store({
    required this.name,
    required this.image,
    required this.address,
    required this.phoneNumber,
    required this.latLong,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      name: json['name'],
      image: json['image'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      latLong: json['latLong'],
    );
  }
}


