// To parse this JSON data, do
//
//     final testDoctorReportModel = testDoctorReportModelFromJson(jsonString);

import 'dart:convert';

TestDoctorReportModel testDoctorReportModelFromJson(String str) => TestDoctorReportModel.fromJson(json.decode(str));

String testDoctorReportModelToJson(TestDoctorReportModel data) => json.encode(data.toJson());

class TestDoctorReportModel {
  bool? success;
  String? message;
  List<Datum>? data;

  TestDoctorReportModel({
    this.success,
    this.message,
    this.data,
  });

  factory TestDoctorReportModel.fromJson(Map<String, dynamic> json) => TestDoctorReportModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? prescriptionableType;
  int? prescriptionableId;
  String? photo;
  String? descriptions;
  DateTime? createdAt;
  DateTime? updatedAt;
  UserAgent? userAgent;
  Pivot? pivot;
  UserAgent? datumUserAgent;

  Datum({
    this.id,
    this.prescriptionableType,
    this.prescriptionableId,
    this.photo,
    this.descriptions,
    this.createdAt,
    this.updatedAt,
    this.userAgent,
    this.pivot,
    this.datumUserAgent,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    prescriptionableType: json["prescriptionable_type"],
    prescriptionableId: json["prescriptionable_id"],
    photo: json["photo"],
    descriptions: json["descriptions"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    userAgent: json["userAgent"] == null ? null : UserAgent.fromJson(json["userAgent"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    datumUserAgent: json["user_agent"] == null ? null : UserAgent.fromJson(json["user_agent"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prescriptionable_type": prescriptionableType,
    "prescriptionable_id": prescriptionableId,
    "photo": photo,
    "descriptions": descriptions,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "userAgent": userAgent?.toJson(),
    "pivot": pivot?.toJson(),
    "user_agent": datumUserAgent?.toJson(),
  };
}

class UserAgent {
  int? id;
  String? name;
  String? phone;
  String? usertype;
  String? about;
  String? gender;
  bool? status;
  dynamic profilePhotoPath;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  String? deviceToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profilePhotoUrl;

  UserAgent({
    this.id,
    this.name,
    this.phone,
    this.usertype,
    this.about,
    this.gender,
    this.status,
    this.profilePhotoPath,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  factory UserAgent.fromJson(Map<String, dynamic> json) => UserAgent(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    usertype: json["usertype"],
    about: json["about"],
    gender: json["gender"],
    status: json["status"],
    profilePhotoPath: json["profile_photo_path"],
    emailVerifiedAt: json["email_verified_at"],
    phoneVerifiedAt: json["phone_verified_at"],
    deviceToken: json["device_token"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "usertype": usertype,
    "about": about,
    "gender": gender,
    "status": status,
    "profile_photo_path": profilePhotoPath,
    "email_verified_at": emailVerifiedAt,
    "phone_verified_at": phoneVerifiedAt,
    "device_token": deviceToken,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "profile_photo_url": profilePhotoUrl,
  };
}

class Pivot {
  int? doctorId;
  int? prescriptionId;
  int? appointmentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pivot({
    this.doctorId,
    this.prescriptionId,
    this.appointmentId,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    doctorId: json["doctor_id"],
    prescriptionId: json["prescription_id"],
    appointmentId: json["appointment_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "doctor_id": doctorId,
    "prescription_id": prescriptionId,
    "appointment_id": appointmentId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
