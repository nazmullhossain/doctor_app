// To parse this JSON data, do
//
//     final departmentModel = departmentModelFromJson(jsonString);

import 'dart:convert';

DepartmentModel departmentModelFromJson(String str) => DepartmentModel.fromJson(json.decode(str));

String departmentModelToJson(DepartmentModel data) => json.encode(data.toJson());

class DepartmentModel {
  bool success;
  String message;
  List<DepartmentData> data;

  DepartmentModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
    success: json["success"],
    message: json["message"],
    data: List<DepartmentData>.from(json["data"].map((x) => DepartmentData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DepartmentData {
  dynamic id;
  dynamic name;
  dynamic slug;
  dynamic icon;
  dynamic status;
  DateTime createdAt;
  DateTime updatedAt;

  DepartmentData({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DepartmentData.fromJson(Map<String, dynamic> json) => DepartmentData(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
