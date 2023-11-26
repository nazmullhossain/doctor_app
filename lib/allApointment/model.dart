// To parse this JSON data, do
//
//     final appointmentHistoryModel = appointmentHistoryModelFromJson(jsonString);

import 'dart:convert';

List<AppointmentHistoryModel> appointmentHistoryModelFromJson(String str) => List<AppointmentHistoryModel>.from(json.decode(str).map((x) => AppointmentHistoryModel.fromJson(x)));

String appointmentHistoryModelToJson(List<AppointmentHistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppointmentHistoryModel {
  int? id;
  String? appointmentableType;
  int? appointmentableId;
  int? doctorId;
  int? isScheduled;
  dynamic time;
  bool? callAvailability;
  int? status;
  int? callerId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Doctor? doctor;
  Consultation? consultation;

  AppointmentHistoryModel({
    this.id,
    this.appointmentableType,
    this.appointmentableId,
    this.doctorId,
    this.isScheduled,
    this.time,
    this.callAvailability,
    this.status,
    this.callerId,
    this.createdAt,
    this.updatedAt,
    this.doctor,
    this.consultation,
  });

  factory AppointmentHistoryModel.fromJson(Map<String, dynamic> json) => AppointmentHistoryModel(
    id: json["id"],
    appointmentableType: json["appointmentable_type"],
    appointmentableId: json["appointmentable_id"],
    doctorId: json["doctor_id"],
    isScheduled: json["is_scheduled"],
    time: json["time"],
    callAvailability: json["call_availability"],
    status: json["status"],
    callerId: json["caller_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    consultation: json["consultation"] == null ? null : Consultation.fromJson(json["consultation"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "appointmentable_type": appointmentableType,
    "appointmentable_id": appointmentableId,
    "doctor_id": doctorId,
    "is_scheduled": isScheduled,
    "time": time,
    "call_availability": callAvailability,
    "status": status,
    "caller_id": callerId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "doctor": doctor?.toJson(),
    "consultation": consultation?.toJson(),
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
  DateTime? age;
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
    age: json["age"] == null ? null : DateTime.parse(json["age"]),
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
    "age": age?.toIso8601String(),
    "weight": weight,
    "main_reason": mainReason,
    "descriptions": descriptions,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Doctor {
  int? id;
  int? doctorCode;
  int? countryId;
  String? name;
  String? email;
  String? phone;
  String? username;
  String? usertype;
  String? about;
  String? gender;
  String? bmdcNo;
  bool? status;
  String? profilePhotoPath;
  dynamic startTimeForSchedule;
  dynamic endTimeForSchedule;
  dynamic startDayForSchedule;
  dynamic endDayForSchedule;
  String? startTimeForInstant;
  String? endTimeForInstant;
  String? startDayForInstant;
  String? endDayForInstant;
  int? appointment;
  int? instantCall;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  String? deviceToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profilePhotoUrl;

  Doctor({
    this.id,
    this.doctorCode,
    this.countryId,
    this.name,
    this.email,
    this.phone,
    this.username,
    this.usertype,
    this.about,
    this.gender,
    this.bmdcNo,
    this.status,
    this.profilePhotoPath,
    this.startTimeForSchedule,
    this.endTimeForSchedule,
    this.startDayForSchedule,
    this.endDayForSchedule,
    this.startTimeForInstant,
    this.endTimeForInstant,
    this.startDayForInstant,
    this.endDayForInstant,
    this.appointment,
    this.instantCall,
    this.emailVerifiedAt,
    this.phoneVerifiedAt,
    this.deviceToken,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    doctorCode: json["doctor_code"],
    countryId: json["country_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    usertype: json["usertype"],
    about: json["about"],
    gender: json["gender"],
    bmdcNo: json["bmdc_no"],
    status: json["status"],
    profilePhotoPath: json["profile_photo_path"],
    startTimeForSchedule: json["start_time_for_schedule"],
    endTimeForSchedule: json["end_time_for_schedule"],
    startDayForSchedule: json["start_day_for_schedule"],
    endDayForSchedule: json["end_day_for_schedule"],
    startTimeForInstant: json["start_time_for_instant"],
    endTimeForInstant: json["end_time_for_instant"],
    startDayForInstant: json["start_day_for_instant"],
    endDayForInstant: json["end_day_for_instant"],
    appointment: json["appointment"],
    instantCall: json["instant_call"],
    emailVerifiedAt: json["email_verified_at"],
    phoneVerifiedAt: json["phone_verified_at"],
    deviceToken: json["device_token"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_code": doctorCode,
    "country_id": countryId,
    "name": name,
    "email": email,
    "phone": phone,
    "username": username,
    "usertype": usertype,
    "about": about,
    "gender": gender,
    "bmdc_no": bmdcNo,
    "status": status,
    "profile_photo_path": profilePhotoPath,
    "start_time_for_schedule": startTimeForSchedule,
    "end_time_for_schedule": endTimeForSchedule,
    "start_day_for_schedule": startDayForSchedule,
    "end_day_for_schedule": endDayForSchedule,
    "start_time_for_instant": startTimeForInstant,
    "end_time_for_instant": endTimeForInstant,
    "start_day_for_instant": startDayForInstant,
    "end_day_for_instant": endDayForInstant,
    "appointment": appointment,
    "instant_call": instantCall,
    "email_verified_at": emailVerifiedAt,
    "phone_verified_at": phoneVerifiedAt,
    "device_token": deviceToken,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "profile_photo_url": profilePhotoUrl,
  };
}
