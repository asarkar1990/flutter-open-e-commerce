import 'dart:convert';

Adress adressFromMap(String str) => Adress.fromMap(json.decode(str));

String adressToMap(Adress data) => json.encode(data.toMap());

Profile profileFromMap(String str) => Profile.fromMap(json.decode(str));

String profileToMap(Profile data) => json.encode(data.toMap());

Order orderFromMap(String str) => Order.fromMap(json.decode(str));

String orderToMap(Order data) => json.encode(data.toMap());

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Order {
  Order({
    this.uid,
    this.buyer,
    this.products,
    this.deliveryAddress,
  });

  String uid;
  final Profile buyer;
  final List<Product> products;
  final Adress deliveryAddress;

  Order copyWith({
    String uid,
    Profile buyer,
    List<Product> products,
    Adress deliveryAddress,
  }) =>
      Order(
        uid: uid ?? this.uid,
        buyer: buyer ?? this.buyer,
        products: products ?? this.products,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      );

  factory Order.fromMap(Map<String, dynamic> json) => Order(
    uid: json["uid"] == null ? null : json["uid"],
    buyer: json["buyer"] == null ? null : Profile.fromMap(json["buyer"]),
    products: json["products"] == null
        ? null
        : List<Product>.from(
        json["products"].map((x) => Product.fromMap(x))),
    deliveryAddress: json["deliveryAddress"] == null
        ? null
        : Adress.fromMap(json["deliveryAddress"]),
  );

  Map<String, dynamic> toMap() => {
    "uid": uid == null ? null : uid,
    "buyer": buyer == null ? null : buyer.toMap(),
    "products": products == null
        ? null
        : List<dynamic>.from(products.map((x) => x.toMap())),
    "deliveryAddress":
    deliveryAddress == null ? null : deliveryAddress.toMap(),
  };
}

class Profile {
  Profile({
    this.uid,
    this.name,
    this.email,
    this.mobileNumber,
  });

  String uid;
  String name;
  String email;
  String mobileNumber;

  Profile copyWith({
    String uid,
    String name,
    String email,
    String mobileNumber,
  }) =>
      Profile(
        uid: uid ?? this.uid,
        name: name ?? this.name,
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
      );

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    uid: json["uid"] == null ? null : json["uid"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    mobileNumber:
    json["mobileNumber"] == null ? null : json["mobileNumber"],
  );

  Map<String, dynamic> toMap() => {
    "uid": uid == null ? null : uid,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "mobileNumber": mobileNumber == null ? null : mobileNumber,
  };
}

class Adress {
  Adress({
    this.addressLine1,
    this.landMark,
    this.area,
    this.city,
    this.state,
    this.country,
  });

  final String addressLine1;
  final String landMark;
  final String area;
  final String city;
  final String state;
  final String country;

  Adress copyWith({
    String addressLine1,
    String landMark,
    String area,
    String city,
    String state,
    String country,
  }) =>
      Adress(
        addressLine1: addressLine1 ?? this.addressLine1,
        landMark: landMark ?? this.landMark,
        area: area ?? this.area,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
      );

  factory Adress.fromMap(Map<String, dynamic> json) => Adress(
    addressLine1:
    json["addressLine1"] == null ? null : json["addressLine1"],
    landMark: json["landMark"] == null ? null : json["landMark"],
    area: json["area"] == null ? null : json["area"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    country: json["country"] == null ? null : json["country"],
  );

  Map<String, dynamic> toMap() => {
    "addressLine1": addressLine1 == null ? null : addressLine1,
    "landMark": landMark == null ? null : landMark,
    "area": area == null ? null : area,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "country": country == null ? null : country,
  };
}

class Product {
  Product({
    this.name,
    this.price,
    this.imageUrl,
    this.description,
    this.manufacturer,
    this.inStock,
    this.id,
  });

  String name;
  double price;
  String imageUrl;
  String description;
  String manufacturer;
  bool inStock;
  String id;

  Product copyWith({
    String name,
    double price,
    String imageUrl,
    String description,
    String manufacturer,
    bool inStock,
    String id,
  }) =>
      Product(
        name: name ?? this.name,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        manufacturer: manufacturer ?? this.manufacturer,
        inStock: inStock ?? this.inStock,
        id: id ?? this.id,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    description: json["description"] == null ? null : json["description"],
    manufacturer:
    json["manufacturer"] == null ? null : json["manufacturer"],
    inStock: json["inStock"] == null ? null : json["inStock"],
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "description": description == null ? null : description,
    "manufacturer": manufacturer == null ? null : manufacturer,
    "inStock": inStock == null ? null : inStock,
    "id": id == null ? null : id,
  };
}