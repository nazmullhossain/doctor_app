// // To parse this JSON data, do
// //
// //     final prescriptionModel = prescriptionModelFromJson(jsonString);
//
// import 'dart:convert';
//
// PrescriptionModel prescriptionModelFromJson(String str) => PrescriptionModel.fromJson(json.decode(str));
//
// String prescriptionModelToJson(PrescriptionModel data) => json.encode(data.toJson());
//
// class PrescriptionModel {
//   bool success;
//   String message;
//   List<PrescriptionData> data;
//
//   PrescriptionModel({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   factory PrescriptionModel.fromJson(Map<String, dynamic> json) => PrescriptionModel(
//     success: json["success"],
//     message: json["message"],
//     data: List<PrescriptionData>.from(json["data"].map((x) => PrescriptionData.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class PrescriptionData {
//   int id;
//   String prescriptionableType;
//   String prescriptionableId;
//   String photo;
//   String descriptions;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   PrescriptionData({
//     required this.id,
//     required this.prescriptionableType,
//     required this.prescriptionableId,
//     required this.photo,
//     required this.descriptions,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory PrescriptionData.fromJson(Map<String, dynamic> json) => PrescriptionData(
//     id: json["id"],
//     prescriptionableType: json["prescriptionable_type"],
//     prescriptionableId: json["prescriptionable_id"],
//     photo: json["photo"],
//     descriptions: json["descriptions"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "prescriptionable_type": prescriptionableType,
//     "prescriptionable_id": prescriptionableId,
//     "photo": photo,
//     "descriptions": descriptions,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
// To parse this JSON data, do
//
//     final prescriptionModel = prescriptionModelFromJson(jsonString);

import 'dart:convert';

PrescriptionModel prescriptionModelFromJson(String str) => PrescriptionModel.fromJson(json.decode(str));

String prescriptionModelToJson(PrescriptionModel data) => json.encode(data.toJson());

class PrescriptionModel {
  bool? success;
  String? message;
  List<PrescriptionData>? data;

  PrescriptionModel({
    this.success,
    this.message,
    this.data,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) => PrescriptionModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PrescriptionData>.from(json["data"]!.map((x) => PrescriptionData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PrescriptionData {
  int? id;
  String? prescriptionableType;
  int? prescriptionableId;
  String? photo;
  String? descriptions;
  DateTime? createdAt;
  DateTime? updatedAt;

  PrescriptionData({
    this.id,
    this.prescriptionableType,
    this.prescriptionableId,
    this.photo,
    this.descriptions,
    this.createdAt,
    this.updatedAt,
  });

  factory PrescriptionData.fromJson(Map<String, dynamic> json) => PrescriptionData(
    id: json["id"],
    prescriptionableType: json["prescriptionable_type"],
    prescriptionableId: json["prescriptionable_id"],
    photo: json["photo"],
    descriptions: json["descriptions"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prescriptionable_type": prescriptionableType,
    "prescriptionable_id": prescriptionableId,
    "photo": photo,
    "descriptions": descriptions,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
