import 'dart:convert';

class Product {
  bool available;
  String name;
  double price;
  String? id;
  String? picture;

  Product({
    required this.available,
    required this.name,
    required this.price,
    this.picture,
    this.id,
  });

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  Product copy() => Product(
        available: available,
        name: name,
        price: price,
        picture: picture,
        id: id,
      );
}
