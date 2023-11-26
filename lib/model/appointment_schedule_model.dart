// To parse this JSON data, do
//
//     final scheduleModel = scheduleModelFromJson(jsonString);

import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) => ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
  bool? success;
  String? message;
  List<Datum>? data;

  ScheduleModel({
    this.success,
    this.message,
    this.data,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
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
  bool? callAvailability;
  String? appointmentableType;
  int? appointmentableId;
  int? doctorId;
  int? isScheduled;
  String? time;
  int? status;
  int? callerId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Appointmentable? appointmentable;
  Consultation? consultation;

  Datum({
    this.id,
    this.callAvailability,
    this.appointmentableType,
    this.appointmentableId,
    this.doctorId,
    this.isScheduled,
    this.time,
    this.status,
    this.callerId,
    this.createdAt,
    this.updatedAt,
    this.appointmentable,
    this.consultation,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    callAvailability: json["call_availability"],
    appointmentableType: json["appointmentable_type"],
    appointmentableId: json["appointmentable_id"],
    doctorId: json["doctor_id"],
    isScheduled: json["is_scheduled"],
    time: json["time"],
    status: json["status"],
    callerId: json["caller_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    appointmentable: json["appointmentable"] == null ? null : Appointmentable.fromJson(json["appointmentable"]),
    consultation: json["consultation"] == null ? null : Consultation.fromJson(json["consultation"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "appointmentable_type": appointmentableType,
    "appointmentable_id": appointmentableId,
    "doctor_id": doctorId,
    "is_scheduled": isScheduled,
    "time": time,
    "status": status,
    "caller_id": callerId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "appointmentable": appointmentable?.toJson(),
    "consultation": consultation?.toJson(),
  };
}

class Appointmentable {
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

  Appointmentable({
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
  });

  factory Appointmentable.fromJson(Map<String, dynamic> json) => Appointmentable(
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
  };
}

class Consultation {
  int? id;
  String? consulableType;
  int? consulableId;
  int? doctorId;
  int? appointmentId;
  String? fullName;
  String? fullAddress;
  String? age;
  int? weight;
  String? mainReason;
  String? descriptions;
  DateTime? createdAt;
  DateTime? updatedAt;

  Consultation({
    this.id,
    this.consulableType,
    this.consulableId,
    this.doctorId,
    this.appointmentId,
    this.fullName,
    this.fullAddress,
    this.age,
    this.weight,
    this.mainReason,
    this.descriptions,
    this.createdAt,
    this.updatedAt,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
    id: json["id"],
    consulableType: json["consulable_type"],
    consulableId: json["consulable_id"],
    doctorId: json["doctor_id"],
    appointmentId: json["appointment_id"],
    fullName: json["full_name"],
    fullAddress: json["full_address"],
    age: json["age"],
    weight: json["weight"],
    mainReason: json["main_reason"],
    descriptions: json["descriptions"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "consulable_type": consulableType,
    "consulable_id": consulableId,
    "doctor_id": doctorId,
    "appointment_id": appointmentId,
    "full_name": fullName,
    "full_address": fullAddress,
    "age": age,
    "weight": weight,
    "main_reason": mainReason,
    "descriptions": descriptions,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
