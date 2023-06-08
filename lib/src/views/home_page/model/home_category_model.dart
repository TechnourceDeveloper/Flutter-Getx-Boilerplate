// To parse this JSON data, do
//
//     final getHomeCategory = getHomeCategoryFromJson(jsonString);

import 'dart:convert';

GetHomeCategory getHomeCategoryFromJson(String str) =>
    GetHomeCategory.fromJson(json.decode(str));

String getHomeCategoryToJson(GetHomeCategory data) =>
    json.encode(data.toJson());

class GetHomeCategory {
  GetHomeCategory({
    required this.message,
    required this.data,
    required this.code,
  });

  String message;
  Data data;
  int code;

  factory GetHomeCategory.fromJson(Map<String, dynamic> json) =>
      GetHomeCategory(
        message: json["message"],
        data: Data.fromJson(json["data"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "code": code,
      };
}

class Data {
  Data({
    required this.category,
    required this.isNext,
    required this.isAppleProfileCompleted,
  });

  List<CategoryItem> category;
  bool isNext;
  String? isAppleProfileCompleted;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: List<CategoryItem>.from(
            json["category"].map((x) => CategoryItem.fromJson(x))),
        isNext: json["is_next"],
        isAppleProfileCompleted: json['is_apple_profile_completed'],
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "is_next": isNext,
        'is_apple_profile_completed': isAppleProfileCompleted,
      };
}

class CategoryItem {
  CategoryItem({
    required this.categoryId,
    required this.categoryName,
    required this.sequence,
    required this.icon,
    required this.isIndividual,
    required this.isCertificateRequired,
  });

  String categoryId;
  String categoryName;
  int sequence;
  String icon;
  bool isIndividual;
  String isCertificateRequired;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        sequence: json["sequence"],
        icon: json["icon"],
        isIndividual: json["is_individual"],
        isCertificateRequired: json["is_certificate_required"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "sequence": sequence,
        "icon": icon,
        "is_individual": isIndividual,
        "is_certificate_required": isCertificateRequired,
      };
}
