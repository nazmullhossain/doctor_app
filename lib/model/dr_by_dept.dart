// // To parse this JSON data, do
// //
// //     final drByDeptModel = drByDeptModelFromJson(jsonString);
// import 'dart:convert';
//
// DrByDeptModel drByDeptModelFromJson(String str) => DrByDeptModel.fromJson(json.decode(str));
//
// String drByDeptModelToJson(DrByDeptModel data) => json.encode(data.toJson());
//
// class DrByDeptModel {
//   bool? success;
//   String? message;
//   Data? data;
//
//   DrByDeptModel({
//     this.success,
//     this.message,
//     this.data,
//   });
//
//   factory DrByDeptModel.fromJson(Map<String, dynamic> json) => DrByDeptModel(
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
//   int? id;
//   String? name;
//   String? slug;
//   String? icon;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   List<DoctorByDept>? doctors;
//
//   Data({
//     this.id,
//     this.name,
//     this.slug,
//     this.icon,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.doctors,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     name: json["name"],
//     slug: json["slug"],
//     icon: json["icon"],
//     status: json["status"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     doctors: json["doctors"] == null ? [] : List<DoctorByDept>.from(json["doctors"]!.map((x) => DoctorByDept.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "slug": slug,
//     "icon": icon,
//     "status": status,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "doctors": doctors == null ? [] : List<dynamic>.from(doctors!.map((x) => x.toJson())),
//   };
// }
//
// class DoctorByDept {
//   dynamic? id;
//   String? name;
//   String? doctorCode;
//   String? email;
//   String? phone;
//   String? username;
//   String? usertype;
//   String? about;
//   String? gender;
//   String? bmdcNo;
//   bool? status;
//   dynamic profilePhotoPath;
//   String? startTimeForSchedule;
//   String? endTimeForSchedule;
//   String? startDayForSchedule;
//   String? endDayForSchedule;
//   String? startTimeForInstant;
//   String? endTimeForInstant;
//   String? startDayForInstant;
//   String? endDayForInstant;
//   String? appointment;
//   String? instantCall;
//   dynamic emailVerifiedAt;
//   dynamic phoneVerifiedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic avgRatingStars;
//   String? profilePhotoUrl;
//   Pivot? pivot;
//   List<dynamic>? reviews;
//
//   DoctorByDept({
//     this.id,
//     this.name,
//     this.doctorCode,
//     this.email,
//     this.phone,
//     this.username,
//     this.usertype,
//     this.about,
//     this.gender,
//     this.bmdcNo,
//     this.status,
//     this.profilePhotoPath,
//     this.startTimeForSchedule,
//     this.endTimeForSchedule,
//     this.startDayForSchedule,
//     this.endDayForSchedule,
//     this.startTimeForInstant,
//     this.endTimeForInstant,
//     this.startDayForInstant,
//     this.endDayForInstant,
//     this.appointment,
//     this.instantCall,
//     this.emailVerifiedAt,
//     this.phoneVerifiedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.avgRatingStars,
//     this.profilePhotoUrl,
//     this.pivot,
//     this.reviews,
//   });
//
//   factory DoctorByDept.fromJson(Map<String, dynamic> json) => DoctorByDept(
//     id: json["id"],
//     name: json["name"],
//     doctorCode: json["doctor_code"],
//     email: json["email"],
//     phone: json["phone"],
//     username: json["username"],
//     usertype: json["usertype"],
//     about: json["about"],
//     gender: json["gender"],
//     bmdcNo: json["bmdc_no"],
//     status: json["status"],
//     profilePhotoPath: json["profile_photo_path"],
//     startTimeForSchedule: json["start_time_for_schedule"],
//     endTimeForSchedule: json["end_time_for_schedule"],
//     startDayForSchedule: json["start_day_for_schedule"],
//     endDayForSchedule: json["end_day_for_schedule"],
//     startTimeForInstant: json["start_time_for_instant"],
//     endTimeForInstant: json["end_time_for_instant"],
//     startDayForInstant: json["start_day_for_instant"],
//     endDayForInstant: json["end_day_for_instant"],
//     appointment: json["appointment"],
//     instantCall: json["instant_call"],
//     emailVerifiedAt: json["email_verified_at"],
//     phoneVerifiedAt: json["phone_verified_at"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     avgRatingStars: json["avg_rating_stars"],
//     profilePhotoUrl: json["profile_photo_url"],
//     pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
//     reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "doctor_code": doctorCode,
//     "email": email,
//     "phone": phone,
//     "username": username,
//     "usertype": usertype,
//     "about": about,
//     "gender": gender,
//     "bmdc_no": bmdcNo,
//     "status": status,
//     "profile_photo_path": profilePhotoPath,
//     "start_time_for_schedule": startTimeForSchedule,
//     "end_time_for_schedule": endTimeForSchedule,
//     "start_day_for_schedule": startDayForSchedule,
//     "end_day_for_schedule": endDayForSchedule,
//     "start_time_for_instant": startTimeForInstant,
//     "end_time_for_instant": endTimeForInstant,
//     "start_day_for_instant": startDayForInstant,
//     "end_day_for_instant": endDayForInstant,
//     "appointment": appointment,
//     "instant_call": instantCall,
//     "email_verified_at": emailVerifiedAt,
//     "phone_verified_at": phoneVerifiedAt,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "avg_rating_stars": avgRatingStars,
//     "profile_photo_url": profilePhotoUrl,
//     "pivot": pivot?.toJson(),
//     "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
//   };
// }
//
// class Pivot {
//   String? departmentId;
//   String? doctorAgentId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   Pivot({
//     this.departmentId,
//     this.doctorAgentId,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//     departmentId: json["department_id"],
//     doctorAgentId: json["doctor_agent_id"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "department_id": departmentId,
//     "doctor_agent_id": doctorAgentId,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
// To parse this JSON data, do
//
//     final drByDeptModel = drByDeptModelFromJson(jsonString);

import 'dart:convert';

DrByDeptModel drByDeptModelFromJson(String str) => DrByDeptModel.fromJson(json.decode(str));

String drByDeptModelToJson(DrByDeptModel data) => json.encode(data.toJson());

class DrByDeptModel {
  bool? success;
  String? message;
  Data? data;

  DrByDeptModel({
    this.success,
    this.message,
    this.data,
  });

  factory DrByDeptModel.fromJson(Map<String, dynamic> json) => DrByDeptModel(
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
  String? slug;
  String? icon;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<DoctorByDept>? doctors;

  Data({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.doctors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    doctors: json["doctors"] == null ? [] : List<DoctorByDept>.from(json["doctors"]!.map((x) => DoctorByDept.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "doctors": doctors == null ? [] : List<dynamic>.from(doctors!.map((x) => x.toJson())),
  };
}

class DoctorByDept {
  int? id;
  String? name;
  int? doctorCode;
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
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic avgRatingStars;
  String? profilePhotoUrl;
  Pivot? pivot;
  List<dynamic>? reviews;

  DoctorByDept({
    this.id,
    this.name,
    this.doctorCode,
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
    this.createdAt,
    this.updatedAt,
    this.avgRatingStars,
    this.profilePhotoUrl,
    this.pivot,
    this.reviews,
  });

  factory DoctorByDept.fromJson(Map<String, dynamic> json) => DoctorByDept(
    id: json["id"],
    name: json["name"],
    doctorCode: json["doctor_code"],
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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    avgRatingStars: json["avg_rating_stars"],
    profilePhotoUrl: json["profile_photo_url"],
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "doctor_code": doctorCode,
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "avg_rating_stars": avgRatingStars,
    "profile_photo_url": profilePhotoUrl,
    "pivot": pivot?.toJson(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
  };
}

class Pivot {
  int? departmentId;
  int? doctorAgentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pivot({
    this.departmentId,
    this.doctorAgentId,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    departmentId: json["department_id"],
    doctorAgentId: json["doctor_agent_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "department_id": departmentId,
    "doctor_agent_id": doctorAgentId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
