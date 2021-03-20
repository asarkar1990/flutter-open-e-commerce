// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

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
