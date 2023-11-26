// // To parse this JSON data, do
// //
// //     final prescriptionSentByUserAgent = prescriptionSentByUserAgentFromJson(jsonString);
//
// import 'dart:convert';
//
// PrescriptionSentByUserAgent prescriptionSentByUserAgentFromJson(String str) => PrescriptionSentByUserAgent.fromJson(json.decode(str));
//
// String prescriptionSentByUserAgentToJson(PrescriptionSentByUserAgent data) => json.encode(data.toJson());
//
// class PrescriptionSentByUserAgent {
//   bool success;
//   String message;
//   List<PrescriptionsData> data;
//
//   PrescriptionSentByUserAgent({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//
//   factory PrescriptionSentByUserAgent.fromJson(Map<String, dynamic> json) => PrescriptionSentByUserAgent(
//     success: json["success"],
//     message: json["message"],
//     data: List<PrescriptionsData>.from(json["data"].map((x) => PrescriptionsData.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "data": List<dynamic>.from(data.map((x) => x.toJson())),
//   };
// }
//
// class PrescriptionsData {
//   int id;
//   String prescriptionableType;
//   String prescriptionableId;
//   String photo;
//   String descriptions;
//   DateTime createdAt;
//   DateTime updatedAt;
//   UserAgent userAgent;
//   Pivot pivot;
//   UserAgent datumUserAgent;
//
//   PrescriptionsData({
//     required this.id,
//     required this.prescriptionableType,
//     required this.prescriptionableId,
//     required this.photo,
//     required this.descriptions,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.userAgent,
//     required this.pivot,
//     required this.datumUserAgent,
//   });
//
//   factory PrescriptionsData.fromJson(Map<String, dynamic> json) => PrescriptionsData(
//     id: json["id"],
//     prescriptionableType: json["prescriptionable_type"],
//     prescriptionableId: json["prescriptionable_id"],
//     photo: json["photo"],
//     descriptions: json["descriptions"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     userAgent: UserAgent.fromJson(json["userAgent"]),
//     pivot: Pivot.fromJson(json["pivot"]),
//     datumUserAgent: UserAgent.fromJson(json["user_agent"]),
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
//     "userAgent": userAgent.toJson(),
//     "pivot": pivot.toJson(),
//     "user_agent": datumUserAgent.toJson(),
//   };
// }
//
// class UserAgent {
//   int id;
//   Name name;
//   String? doctorCode;
//   Email email;
//   String phone;
//   Username username;
//   Usertype usertype;
//   About about;
//   Gender gender;
//   dynamic bmdcNo;
//   bool status;
//   String profilePhotoPath;
//   dynamic startTimeForSchedule;
//   dynamic endTimeForSchedule;
//   dynamic startDayForSchedule;
//   dynamic endDayForSchedule;
//   dynamic startTimeForInstant;
//   dynamic endTimeForInstant;
//   dynamic startDayForInstant;
//   dynamic endDayForInstant;
//   String? appointment;
//   String? instantCall;
//   dynamic emailVerifiedAt;
//   dynamic phoneVerifiedAt;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String profilePhotoUrl;
//
//   UserAgent({
//     required this.id,
//     required this.name,
//     this.doctorCode,
//     required this.email,
//     required this.phone,
//     required this.username,
//     required this.usertype,
//     required this.about,
//     required this.gender,
//     this.bmdcNo,
//     required this.status,
//     required this.profilePhotoPath,
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
//     required this.createdAt,
//     required this.updatedAt,
//     required this.profilePhotoUrl,
//   });
//
//   factory UserAgent.fromJson(Map<String, dynamic> json) => UserAgent(
//     id: json["id"],
//     name: nameValues.map[json["name"]]!,
//     doctorCode: json["doctor_code"],
//     email: emailValues.map[json["email"]]!,
//     phone: json["phone"],
//     username: usernameValues.map[json["username"]]!,
//     usertype: usertypeValues.map[json["usertype"]]!,
//     about: aboutValues.map[json["about"]]!,
//     gender: genderValues.map[json["gender"]]!,
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
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     profilePhotoUrl: json["profile_photo_url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": nameValues.reverse[name],
//     "doctor_code": doctorCode,
//     "email": emailValues.reverse[email],
//     "phone": phone,
//     "username": usernameValues.reverse[username],
//     "usertype": usertypeValues.reverse[usertype],
//     "about": aboutValues.reverse[about],
//     "gender": genderValues.reverse[gender],
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
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "profile_photo_url": profilePhotoUrl,
//   };
// }
//
// enum About { ABOUT_AGENT, ABCD4477 }
//
// final aboutValues = EnumValues({
//   "Abcd4477": About.ABCD4477,
//   "About Agent": About.ABOUT_AGENT
// });
//
// enum Email { NAGENT_MAIL_COM, NUSER_MAIL_COM }
//
// final emailValues = EnumValues({
//   "nagent@mail.com": Email.NAGENT_MAIL_COM,
//   "nuser@mail.com": Email.NUSER_MAIL_COM
// });
//
// enum Gender { MALE }
//
// final genderValues = EnumValues({
//   "male": Gender.MALE
// });
//
// enum Name { NAGENT, NUSER }
//
// final nameValues = EnumValues({
//   "Nagent": Name.NAGENT,
//   "Nuser": Name.NUSER
// });
//
// enum Username { NAGENT, NUSER }
//
// final usernameValues = EnumValues({
//   "nagent": Username.NAGENT,
//   "nuser": Username.NUSER
// });
//
// enum Usertype { AGENT, USER }
//
// final usertypeValues = EnumValues({
//   "agent": Usertype.AGENT,
//   "user": Usertype.USER
// });
//
// class Pivot {
//   String doctorId;
//   String prescriptionId;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   Pivot({
//     required this.doctorId,
//     required this.prescriptionId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//     doctorId: json["doctor_id"],
//     prescriptionId: json["prescription_id"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "doctor_id": doctorId,
//     "prescription_id": prescriptionId,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//   };
// }
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
// To parse this JSON data, do
//
//     final prescriptionSentByUserAgent = prescriptionSentByUserAgentFromJson(jsonString);

import 'dart:convert';

PrescriptionSentByUserAgent prescriptionSentByUserAgentFromJson(String str) => PrescriptionSentByUserAgent.fromJson(json.decode(str));

String prescriptionSentByUserAgentToJson(PrescriptionSentByUserAgent data) => json.encode(data.toJson());

class PrescriptionSentByUserAgent {
  bool? success;
  String? message;
  List<PrescriptionsData>? data;

  PrescriptionSentByUserAgent({
    this.success,
    this.message,
    this.data,
  });

  factory PrescriptionSentByUserAgent.fromJson(Map<String, dynamic> json) => PrescriptionSentByUserAgent(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PrescriptionsData>.from(json["data"]!.map((x) => PrescriptionsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PrescriptionsData {
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

  PrescriptionsData({
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

  factory PrescriptionsData.fromJson(Map<String, dynamic> json) => PrescriptionsData(
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
  String? email;
  String? phone;
  String? username;
  String? usertype;
  dynamic about;
  dynamic gender;
  bool? status;
  dynamic profilePhotoPath;
  dynamic emailVerifiedAt;
  DateTime? phoneVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profilePhotoUrl;

  UserAgent({
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

  factory UserAgent.fromJson(Map<String, dynamic> json) => UserAgent(
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
    phoneVerifiedAt: json["phone_verified_at"] == null ? null : DateTime.parse(json["phone_verified_at"]),
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
    "phone_verified_at": phoneVerifiedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "profile_photo_url": profilePhotoUrl,
  };
}

class Pivot {
  int? doctorId;
  int? prescriptionId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Pivot({
    this.doctorId,
    this.prescriptionId,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    doctorId: json["doctor_id"],
    prescriptionId: json["prescription_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "doctor_id": doctorId,
    "prescription_id": prescriptionId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
