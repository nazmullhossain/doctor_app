// To parse this JSON data, do
//
//     final symptomModel = symptomModelFromJson(jsonString);

import 'dart:convert';

SymptomModel symptomModelFromJson(String str) => SymptomModel.fromJson(json.decode(str));

String symptomModelToJson(SymptomModel data) => json.encode(data.toJson());

class SymptomModel {
  bool success;
  String message;
  List<SymptomData> data;

  SymptomModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SymptomModel.fromJson(Map<String, dynamic> json) => SymptomModel(
    success: json["success"],
    message: json["message"],
    data: List<SymptomData>.from(json["data"].map((x) => SymptomData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SymptomData {
  dynamic id;
  String name;
  String slug;
  String icon;
  DateTime createdAt;
  DateTime updatedAt;

  SymptomData({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SymptomData.fromJson(Map<String, dynamic> json) => SymptomData(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
