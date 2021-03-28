import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.description,
    this.manufacturer,
    this.inStock,
  });

  String id;
  String name;
  double price;
  String imageUrl;
  String description;
  String manufacturer;
  bool inStock;

  Product copyWith({
    String id,
    String name,
    double price,
    String imageUrl,
    String description,
    String manufacturer,
    bool inStock,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        manufacturer: manufacturer ?? this.manufacturer,
        inStock: inStock ?? this.inStock,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    description: json["description"] == null ? null : json["description"],
    manufacturer:
    json["manufacturer"] == null ? null : json["manufacturer"],
    inStock: json["inStock"] == null ? null : json["inStock"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "description": description == null ? null : description,
    "manufacturer": manufacturer == null ? null : manufacturer,
    "inStock": inStock == null ? null : inStock,
  };
}

class Profile {
  String name;
  String emailId;
  String mobileNumber;

  /// constructor
  Profile({this.name, this.emailId, this.mobileNumber});

  /// fromMap
  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    name: json['name'] == null ? null : json["name"],
    emailId: json['emailId'] == null ? null : json["emailId"],
    mobileNumber:
    json['mobileNumber'] == null ? null : json["mobileNumber"],
  );

  ///toMap()
  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "emailId": emailId == null ? null : emailId,
    "mobileNumber": mobileNumber == null ? null : mobileNumber,
  };
}