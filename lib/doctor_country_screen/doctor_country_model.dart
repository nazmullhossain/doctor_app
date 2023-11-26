// To parse this JSON data, do
//
//     final doctorCountryModel = doctorCountryModelFromJson(jsonString);

import 'dart:convert';

DoctorCountryModel doctorCountryModelFromJson(String str) => DoctorCountryModel.fromJson(json.decode(str));

String doctorCountryModelToJson(DoctorCountryModel data) => json.encode(data.toJson());

class DoctorCountryModel {
  bool? success;
  String? message;
  Data? data;

  DoctorCountryModel({
    this.success,
    this.message,
    this.data,
  });

  factory DoctorCountryModel.fromJson(Map<String, dynamic> json) => DoctorCountryModel(
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
  String? countryCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Doctor>? doctors;

  Data({
    this.id,
    this.name,
    this.countryCode,
    this.createdAt,
    this.updatedAt,
    this.doctors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    countryCode: json["country_code"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    doctors: json["doctors"] == null ? [] : List<Doctor>.from(json["doctors"]!.map((x) => Doctor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country_code": countryCode,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "doctors": doctors == null ? [] : List<dynamic>.from(doctors!.map((x) => x.toJson())),
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
  Usertype? usertype;
  String? about;
  Gender? gender;
  String? bmdcNo;
  bool? status;
  String? profilePhotoPath;
  String? startTimeForSchedule;
  String? endTimeForSchedule;
  String? startDayForSchedule;
  String? endDayForSchedule;
  StartTimeForInstant? startTimeForInstant;
  EndTimeForInstant? endTimeForInstant;
  StartDayForInstant? startDayForInstant;
  EndDayForInstant? endDayForInstant;
  int? appointment;
  int? instantCall;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  String? deviceToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic avgRatingStars;
  String? profilePhotoUrl;
  List<dynamic>? reviews;

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
    this.avgRatingStars,
    this.profilePhotoUrl,
    this.reviews,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    doctorCode: json["doctor_code"],
    countryId: json["country_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    username: json["username"],
    usertype: usertypeValues.map[json["usertype"]]!,
    about: json["about"],
    gender: genderValues.map[json["gender"]]!,
    bmdcNo: json["bmdc_no"],
    status: json["status"],
    profilePhotoPath: json["profile_photo_path"],
    startTimeForSchedule: json["start_time_for_schedule"],
    endTimeForSchedule: json["end_time_for_schedule"],
    startDayForSchedule: json["start_day_for_schedule"],
    endDayForSchedule: json["end_day_for_schedule"],
    // startTimeForInstant: startTimeForInstantValues.map[json["start_time_for_instant"]]!,
    // endTimeForInstant: endTimeForInstantValues.map[json["end_time_for_instant"]]!,
    // startDayForInstant: startDayForInstantValues.map[json["start_day_for_instant"]]!,
    // endDayForInstant: endDayForInstantValues.map[json["end_day_for_instant"]]!,
    appointment: json["appointment"],
    instantCall: json["instant_call"],
    emailVerifiedAt: json["email_verified_at"],
    phoneVerifiedAt: json["phone_verified_at"],
    deviceToken: json["device_token"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    avgRatingStars: json["avg_rating_stars"],
    profilePhotoUrl: json["profile_photo_url"],
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_code": doctorCode,
    "country_id": countryId,
    "name": name,
    "email": email,
    "phone": phone,
    "username": username,
    "usertype": usertypeValues.reverse[usertype],
    "about": about,
    "gender": genderValues.reverse[gender],
    "bmdc_no": bmdcNo,
    "status": status,
    "profile_photo_path": profilePhotoPath,
    "start_time_for_schedule": startTimeForSchedule,
    "end_time_for_schedule": endTimeForSchedule,
    "start_day_for_schedule": startDayForSchedule,
    "end_day_for_schedule": endDayForSchedule,
    "start_time_for_instant": startTimeForInstantValues.reverse[startTimeForInstant],
    "end_time_for_instant": endTimeForInstantValues.reverse[endTimeForInstant],
    "start_day_for_instant": startDayForInstantValues.reverse[startDayForInstant],
    "end_day_for_instant": endDayForInstantValues.reverse[endDayForInstant],
    "appointment": appointment,
    "instant_call": instantCall,
    "email_verified_at": emailVerifiedAt,
    "phone_verified_at": phoneVerifiedAt,
    "device_token": deviceToken,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "avg_rating_stars": avgRatingStars,
    "profile_photo_url": profilePhotoUrl,
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
  };
}

enum EndDayForInstant {
  SUN
}

final endDayForInstantValues = EnumValues({
  "Sun": EndDayForInstant.SUN
});

enum EndTimeForInstant {
  THE_0900_PM,
  THE_1000_PM,
  THE_1100_AM
}

final endTimeForInstantValues = EnumValues({
  "09:00 PM": EndTimeForInstant.THE_0900_PM,
  "10:00 PM": EndTimeForInstant.THE_1000_PM,
  "11:00 AM": EndTimeForInstant.THE_1100_AM
});

enum Gender {
  FAMALE,
  MALE
}

final genderValues = EnumValues({
  "famale": Gender.FAMALE,
  "male": Gender.MALE
});

enum StartDayForInstant {
  MON
}

final startDayForInstantValues = EnumValues({
  "Mon": StartDayForInstant.MON
});

enum StartTimeForInstant {
  THE_0900_AM,
  THE_1000_AM
}

final startTimeForInstantValues = EnumValues({
  "09:00 AM": StartTimeForInstant.THE_0900_AM,
  "10:00 AM": StartTimeForInstant.THE_1000_AM
});

enum Usertype {
  DOCTOR
}

final usertypeValues = EnumValues({
  "doctor": Usertype.DOCTOR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
