// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

Product productFromMap(String str) => Product.fromMap(json.decode(str));

String productToMap(Product data) => json.encode(data.toMap());

class Product {
  Product({
    this.name,
    this.price,
    this.imageUrl,
    this.description,
    this.manufacturer,
    this.inStock,
  });

  final String name;
  final double price;
  final String imageUrl;
  final String description;
  final String manufacturer;
  final bool inStock;

  Product copyWith({
    String name,
    double price,
    String imageUrl,
    String description,
    String manufacturer,
    bool inStock,
  }) =>
      Product(
        name: name ?? this.name,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        description: description ?? this.description,
        manufacturer: manufacturer ?? this.manufacturer,
        inStock: inStock ?? this.inStock,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    description: json["description"] == null ? null : json["description"],
    manufacturer: json["manufacturer"] == null ? null : json["manufacturer"],
    inStock: json["inStock"] == null ? null : json["inStock"],
  );

  Map<String, dynamic> toMap() => {
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "description": description == null ? null : description,
    "manufacturer": manufacturer == null ? null : manufacturer,
    "inStock": inStock == null ? null : inStock,
  };
}
