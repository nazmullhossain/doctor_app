// To parse this JSON data, do
//
//     final myPrescriptionModel = myPrescriptionModelFromJson(jsonString);

import 'dart:convert';

MyPrescriptionModel myPrescriptionModelFromJson(String str) =>
    MyPrescriptionModel.fromJson(json.decode(str));

String myPrescriptionModelToJson(MyPrescriptionModel data) =>
    json.encode(data.toJson());

class MyPrescriptionModel {
  bool? success;
  String? message;
  List<Datum>? data;

  MyPrescriptionModel({
    this.success,
    this.message,
    this.data,
  });

  factory MyPrescriptionModel.fromJson(Map<String, dynamic> json) =>
      MyPrescriptionModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  dynamic? doctorId;
  String? patientableType;
  dynamic? patientableId;
  String? pdfName;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? pdf;

  Datum({
    this.id,
    this.doctorId,
    this.patientableType,
    this.patientableId,
    this.pdfName,
    this.createdAt,
    this.updatedAt,
    this.pdf,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        doctorId: json["doctor_id"],
        patientableType: json["patientable_type"],
        patientableId: json["patientable_id"],
        pdfName: json["pdf_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pdf: json["pdf"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "patientable_type": patientableType,
        "patientable_id": patientableId,
        "pdf_name": pdfName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pdf": pdf,
      };
}
