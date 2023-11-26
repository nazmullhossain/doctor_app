// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  bool? success;
  String? message;
  List<SliderData>? data;

  SliderModel({
    this.success,
    this.message,
    this.data,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SliderData>.from(json["data"]!.map((x) => SliderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SliderData {
  dynamic? id;
  String? image;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  SliderData({
    this.id,
    this.image,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
