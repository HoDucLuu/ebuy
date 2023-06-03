import 'dart:convert';

ProductModel productModelFormJson(String str) =>
    ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.status,
    required this.isFarourite,
  });
  String id, name, image, price, description, status;
  bool isFarourite;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        description: json["description"],
        status: json["status"],
        isFarourite: false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "description": description,
        "status": status,
        "isFarourite": isFarourite,
      };
}
