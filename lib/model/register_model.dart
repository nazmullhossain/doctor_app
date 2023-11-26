
// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  bool? success;
  String? message;
  String? token;
  Data? data;

  RegisterModel({
    this.success,
    this.message,
    this.token,
    this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    success: json["success"],
    message: json["message"],
    token: json["token"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "token": token,
    "data": data?.toJson(),
  };
}

class Data {
  String? name;
  String? email;
  String? phone;
  String? username;
  dynamic gender;
  DateTime? updatedAt;
  DateTime? createdAt;
  dynamic? id;
  String? profilePhotoUrl;

  Data({
    this.name,
    this.email,
    this.phone,
    this.username,
    this.gender,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.profilePhotoUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    gender: json["gender"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "username": username,
    "gender": gender,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
    "profile_photo_url": profilePhotoUrl,
  };
}
