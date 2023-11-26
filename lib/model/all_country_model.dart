// To parse this JSON data, do
//
//     final allCountryModel = allCountryModelFromJson(jsonString);

import 'dart:convert';

AllCountryModel allCountryModelFromJson(String str) => AllCountryModel.fromJson(json.decode(str));

String allCountryModelToJson(AllCountryModel data) => json.encode(data.toJson());

class AllCountryModel {
  bool? success;
  String? message;
  List<CountryList>? data;

  AllCountryModel({
    this.success,
    this.message,
    this.data,
  });

  factory AllCountryModel.fromJson(Map<String, dynamic> json) => AllCountryModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<CountryList>.from(json["data"]!.map((x) => CountryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CountryList {
  int? id;
  String? name;
  String? countryCode;
  DateTime? createdAt;
  DateTime? updatedAt;

  CountryList({
    this.id,
    this.name,
    this.countryCode,
    this.createdAt,
    this.updatedAt,
  });

  factory CountryList.fromJson(Map<String, dynamic> json) => CountryList(
    id: json["id"],
    name: json["name"],
    countryCode: json["country_code"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
