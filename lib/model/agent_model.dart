// // To parse this JSON data, do
// //
// //     final agentModel = agentModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AgentModel agentModelFromJson(String str) => AgentModel.fromJson(json.decode(str));
//
// String agentModelToJson(AgentModel data) => json.encode(data.toJson());
//
// class AgentModel {
//   bool? success;
//   String? message;
//   Data? data;
//
//   AgentModel({
//     this.success,
//     this.message,
//     this.data,
//   });
//
//   factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
//     success: json["success"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }
//
// class Data {
//   dynamic? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? username;
//   String? usertype;
//   dynamic about;
//   String? gender;
//   bool? status;
//   dynamic profilePhotoPath;
//   dynamic emailVerifiedAt;
//   dynamic phoneVerifiedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? profilePhotoUrl;
//   Wallet? wallet;
//
//   Data({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.username,
//     this.usertype,
//     this.about,
//     this.gender,
//     this.status,
//     this.profilePhotoPath,
//     this.emailVerifiedAt,
//     this.phoneVerifiedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.profilePhotoUrl,
//     this.wallet,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     phone: json["phone"],
//     username: json["username"],
//     usertype: json["usertype"],
//     about: json["about"],
//     gender: json["gender"],
//     status: json["status"],
//     profilePhotoPath: json["profile_photo_path"],
//     emailVerifiedAt: json["email_verified_at"],
//     phoneVerifiedAt: json["phone_verified_at"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     profilePhotoUrl: json["profile_photo_url"],
//     wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "phone": phone,
//     "username": username,
//     "usertype": usertype,
//     "about": about,
//     "gender": gender,
//     "status": status,
//     "profile_photo_path": profilePhotoPath,
//     "email_verified_at": emailVerifiedAt,
//     "phone_verified_at": phoneVerifiedAt,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "profile_photo_url": profilePhotoUrl,
//     "wallet": wallet?.toJson(),
//   };
// }
//
// class Wallet {
//   dynamic? id;
//   String? doctorAgentId;
//   String? amount;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   Wallet({
//     this.id,
//     this.doctorAgentId,
//     this.amount,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
//     id: json["id"],
//     doctorAgentId: json["doctor_agent_id"],
//     amount: json["amount"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "doctor_agent_id": doctorAgentId,
//     "amount": amount,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
// To parse this JSON data, do
//
//     final agentModel = agentModelFromJson(jsonString);

import 'dart:convert';

AgentModel agentModelFromJson(String str) => AgentModel.fromJson(json.decode(str));

String agentModelToJson(AgentModel data) => json.encode(data.toJson());

class AgentModel {
  bool? success;
  String? message;
  Data? data;

  AgentModel({
    this.success,
    this.message,
    this.data,
  });

  factory AgentModel.fromJson(Map<String, dynamic> json) => AgentModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? username;
  String? usertype;
  String? about;
  String? gender;
  bool? status;
  String? profilePhotoPath;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profilePhotoUrl;
  Wallet? wallet;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.username,
    this.usertype,
    this.about,
    this.gender,
    this.status,
    this.profilePhotoPath,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
    this.wallet,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    usertype: json["usertype"],
    about: json["about"],
    gender: json["gender"],
    status: json["status"],
    profilePhotoPath: json["profile_photo_path"],
    emailVerifiedAt: json["email_verified_at"],
    phoneVerifiedAt: json["phone_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    profilePhotoUrl: json["profile_photo_url"],
    wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "username": username,
    "usertype": usertype,
    "about": about,
    "gender": gender,
    "status": status,
    "profile_photo_path": profilePhotoPath,
    "email_verified_at": emailVerifiedAt,
    "phone_verified_at": phoneVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "profile_photo_url": profilePhotoUrl,
    "wallet": wallet?.toJson(),
  };
}

class Wallet {
  int? id;
  int? doctorAgentId;
  double? amount;
  DateTime? createdAt;
  DateTime? updatedAt;

  Wallet({
    this.id,
    this.doctorAgentId,
    this.amount,
    this.createdAt,
    this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
    id: json["id"],
    doctorAgentId: json["doctor_agent_id"],
    amount: json["amount"]?.toDouble(),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_agent_id": doctorAgentId,
    "amount": amount,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
