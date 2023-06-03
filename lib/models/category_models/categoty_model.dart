import 'dart:convert';

CategoryModel productModelFormJson(String str) =>
    CategoryModel.fromJson(json.decode(str));
String productModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.image,
  });
  String id, image;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
