// // // To parse this JSON data, do
// // //
// // //     final allDoctorsModel = allDoctorsModelFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // AllDoctorsModel allDoctorsModelFromJson(String str) => AllDoctorsModel.fromJson(json.decode(str));
// //
// // String allDoctorsModelToJson(AllDoctorsModel data) => json.encode(data.toJson());
// //
// // class AllDoctorsModel {
// //   bool? success;
// //   String? message;
// //   List<DoctorsData>? data;
// //
// //   AllDoctorsModel({
// //     this.success,
// //     this.message,
// //     this.data,
// //   });
// //
// //   factory AllDoctorsModel.fromJson(Map<String, dynamic> json) => AllDoctorsModel(
// //     success: json["success"],
// //     message: json["message"],
// //     data: json["data"] == null ? [] : List<DoctorsData>.from(json["data"]!.map((x) => DoctorsData.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "success": success,
// //     "message": message,
// //     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
// //   };
// // }
// //
// // class DoctorsData {
// //   int? id;
// //   String? name;
// //   dynamic doctorCode;
// //   String? email;
// //   String? phone;
// //   String? username;
// //   Usertype? usertype;
// //   String? about;
// //   Gender? gender;
// //   String? bmdcNo;
// //   bool? status;
// //   String? profilePhotoPath;
// //   String? startTimeForSchedule;
// //   String? endTimeForSchedule;
// //   String? startDayForSchedule;
// //   String? endDayForSchedule;
// //   String? startTimeForInstant;
// //   String? endTimeForInstant;
// //   String? startDayForInstant;
// //   String? endDayForInstant;
// //   dynamic appointment;
// //   dynamic instantCall;
// //   dynamic emailVerifiedAt;
// //   dynamic phoneVerifiedAt;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   dynamic avgRatingStars;
// //   String? profilePhotoUrl;
// //   Info? info;
// //   List<Position>? position;
// //   List<dynamic>? reviews;
// //   List<Department>? departments;
// //   List<Position>? symptoms;
// //   List<Experience>? experience;
// //
// //   DoctorsData({
// //     this.id,
// //     this.name,
// //     this.doctorCode,
// //     this.email,
// //     this.phone,
// //     this.username,
// //     this.usertype,
// //     this.about,
// //     this.gender,
// //     this.bmdcNo,
// //     this.status,
// //     this.profilePhotoPath,
// //     this.startTimeForSchedule,
// //     this.endTimeForSchedule,
// //     this.startDayForSchedule,
// //     this.endDayForSchedule,
// //     this.startTimeForInstant,
// //     this.endTimeForInstant,
// //     this.startDayForInstant,
// //     this.endDayForInstant,
// //     this.appointment,
// //     this.instantCall,
// //     this.emailVerifiedAt,
// //     this.phoneVerifiedAt,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.avgRatingStars,
// //     this.profilePhotoUrl,
// //     this.info,
// //     this.position,
// //     this.reviews,
// //     this.departments,
// //     this.symptoms,
// //     this.experience,
// //   });
// //
// //   factory DoctorsData.fromJson(Map<String, dynamic> json) => DoctorsData(
// //     id: json["id"],
// //     name: json["name"],
// //     doctorCode: json["doctor_code"],
// //     email: json["email"],
// //     phone: json["phone"],
// //     username: json["username"],
// //     usertype: usertypeValues.map[json["usertype"]]!,
// //     about: json["about"],
// //     gender: genderValues.map[json["gender"]]!,
// //     bmdcNo: json["bmdc_no"],
// //     status: json["status"],
// //     profilePhotoPath: json["profile_photo_path"],
// //     startTimeForSchedule: json["start_time_for_schedule"],
// //     endTimeForSchedule: json["end_time_for_schedule"],
// //     startDayForSchedule: json["start_day_for_schedule"],
// //     endDayForSchedule: json["end_day_for_schedule"],
// //     startTimeForInstant: json["start_time_for_instant"],
// //     endTimeForInstant: json["end_time_for_instant"],
// //     startDayForInstant: json["start_day_for_instant"],
// //     endDayForInstant: json["end_day_for_instant"],
// //     appointment: json["appointment"],
// //     instantCall: json["instant_call"],
// //     emailVerifiedAt: json["email_verified_at"],
// //     phoneVerifiedAt: json["phone_verified_at"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //     avgRatingStars: json["avg_rating_stars"],
// //     profilePhotoUrl: json["profile_photo_url"],
// //     info: json["info"] == null ? null : Info.fromJson(json["info"]),
// //     position: json["position"] == null ? [] : List<Position>.from(json["position"]!.map((x) => Position.fromJson(x))),
// //     reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
// //     departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
// //     symptoms: json["symptoms"] == null ? [] : List<Position>.from(json["symptoms"]!.map((x) => Position.fromJson(x))),
// //     experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "doctor_code": doctorCode,
// //     "email": email,
// //     "phone": phone,
// //     "username": username,
// //     "usertype": usertypeValues.reverse[usertype],
// //     "about": about,
// //     "gender": genderValues.reverse[gender],
// //     "bmdc_no": bmdcNo,
// //     "status": status,
// //     "profile_photo_path": profilePhotoPath,
// //     "start_time_for_schedule": startTimeForSchedule,
// //     "end_time_for_schedule": endTimeForSchedule,
// //     "start_day_for_schedule": startDayForSchedule,
// //     "end_day_for_schedule": endDayForSchedule,
// //     "start_time_for_instant": startTimeForInstant,
// //     "end_time_for_instant": endTimeForInstant,
// //     "start_day_for_instant": startDayForInstant,
// //     "end_day_for_instant": endDayForInstant,
// //     "appointment": appointment,
// //     "instant_call": instantCall,
// //     "email_verified_at": emailVerifiedAt,
// //     "phone_verified_at": phoneVerifiedAt,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //     "avg_rating_stars": avgRatingStars,
// //     "profile_photo_url": profilePhotoUrl,
// //     "info": info?.toJson(),
// //     "position": position == null ? [] : List<dynamic>.from(position!.map((x) => x.toJson())),
// //     "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
// //     "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
// //     "symptoms": symptoms == null ? [] : List<dynamic>.from(symptoms!.map((x) => x.toJson())),
// //     "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
// //   };
// // }
// //
// // class Department {
// //   int? id;
// //   String? name;
// //   String? slug;
// //   String? icon;
// //   dynamic status;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   Pivot? pivot;
// //
// //   Department({
// //     this.id,
// //     this.name,
// //     this.slug,
// //     this.icon,
// //     this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.pivot,
// //   });
// //
// //   factory Department.fromJson(Map<String, dynamic> json) => Department(
// //     id: json["id"],
// //     name: json["name"],
// //     slug: json["slug"],
// //     icon: json["icon"],
// //     status: json["status"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //     pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "slug": slug,
// //     "icon": icon,
// //     "status": status,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //     "pivot": pivot?.toJson(),
// //   };
// // }
// //
// // class Pivot {
// //   dynamic? doctorAgentId;
// //   dynamic? departmentId;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   dynamic? positionId;
// //   dynamic? symptomId;
// //
// //   Pivot({
// //     this.doctorAgentId,
// //     this.departmentId,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.positionId,
// //     this.symptomId,
// //   });
// //
// //   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
// //     doctorAgentId: json["doctor_agent_id"],
// //     departmentId: json["department_id"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //     positionId: json["position_id"],
// //     symptomId: json["symptom_id"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "doctor_agent_id": doctorAgentId,
// //     "department_id": departmentId,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //     "position_id": positionId,
// //     "symptom_id": symptomId,
// //   };
// // }
// //
// // class Experience {
// //   int? id;
// //   dynamic? doctorId;
// //   dynamic? departmentId;
// //   String? workingPlace;
// //   String? designation;
// //   String? employmentStatus;
// //   String? period;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   Experience({
// //     this.id,
// //     this.doctorId,
// //     this.departmentId,
// //     this.workingPlace,
// //     this.designation,
// //     this.employmentStatus,
// //     this.period,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory Experience.fromJson(Map<String, dynamic> json) => Experience(
// //     id: json["id"],
// //     doctorId: json["doctor_id"],
// //     departmentId: json["department_id"],
// //     workingPlace: json["working_place"],
// //     designation: json["designation"],
// //     employmentStatus: json["employment_status"],
// //     period: json["period"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "doctor_id": doctorId,
// //     "department_id": departmentId,
// //     "working_place": workingPlace,
// //     "designation": designation,
// //     "employment_status": employmentStatus,
// //     "period": period,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //   };
// // }
// //
// // enum Gender {
// //   FAMALE,
// //   GENDER_MALE,
// //   MALE
// // }
// //
// // final genderValues = EnumValues({
// //   "famale": Gender.FAMALE,
// //   "Male": Gender.GENDER_MALE,
// //   "male": Gender.MALE
// // });
// //
// // class Info {
// //   int? id;
// //   dynamic? doctorAgentId;
// //   dynamic? consultationFee;
// //   dynamic? followUpFee;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   Info({
// //     this.id,
// //     this.doctorAgentId,
// //     this.consultationFee,
// //     this.followUpFee,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory Info.fromJson(Map<String, dynamic> json) => Info(
// //     id: json["id"],
// //     doctorAgentId: json["doctor_agent_id"],
// //     consultationFee: json["consultation_fee"],
// //     followUpFee: json["follow_up_fee"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "doctor_agent_id": doctorAgentId,
// //     "consultation_fee": consultationFee,
// //     "follow_up_fee": followUpFee,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //   };
// // }
// //
// // class Position {
// //   int? id;
// //   String? name;
// //   String? icon;
// //   String? slug;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   Pivot? pivot;
// //
// //   Position({
// //     this.id,
// //     this.name,
// //     this.icon,
// //     this.slug,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.pivot,
// //   });
// //
// //   factory Position.fromJson(Map<String, dynamic> json) => Position(
// //     id: json["id"],
// //     name: json["name"],
// //     icon: json["icon"],
// //     slug: json["slug"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //     pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "icon": icon,
// //     "slug": slug,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //     "pivot": pivot?.toJson(),
// //   };
// // }
// //
// // enum Usertype {
// //   DOCTOR
// // }
// //
// // final usertypeValues = EnumValues({
// //   "doctor": Usertype.DOCTOR
// // });
// //
// // class EnumValues<T> {
// //   Map<String, T> map;
// //   late Map<T, String> reverseMap;
// //
// //   EnumValues(this.map);
// //
// //   Map<T, String> get reverse {
// //     reverseMap = map.map((k, v) => MapEntry(v, k));
// //     return reverseMap;
// //   }
// // }
// // To parse this JSON data, do
// //
// //     final allDoctorsModel = allDoctorsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AllDoctorsModel allDoctorsModelFromJson(String str) => AllDoctorsModel.fromJson(json.decode(str));
//
// String allDoctorsModelToJson(AllDoctorsModel data) => json.encode(data.toJson());
//
// class AllDoctorsModel {
//   bool? success;
//   String? message;
//   List<DoctorsData>? data;
//
//   AllDoctorsModel({
//     this.success,
//     this.message,
//     this.data,
//   });
//
//   factory AllDoctorsModel.fromJson(Map<String, dynamic> json) => AllDoctorsModel(
//     success: json["success"],
//     message: json["message"],
//     data: json["data"] == null ? [] : List<DoctorsData>.from(json["data"]!.map((x) => DoctorsData.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }
//
// class DoctorsData {
//   int? id;
//   String? name;
//   int? doctorCode;
//   String? email;
//   String? phone;
//   String? username;
//   Usertype? usertype;
//   String? about;
//   Gender? gender;
//   String? bmdcNo;
//   bool? status;
//   String? profilePhotoPath;
//   String? startTimeForSchedule;
//   String? endTimeForSchedule;
//   String? startDayForSchedule;
//   String? endDayForSchedule;
//   String? startTimeForInstant;
//   String? endTimeForInstant;
//   String? startDayForInstant;
//   String? endDayForInstant;
//   int? appointment;
//   int? instantCall;
//   dynamic emailVerifiedAt;
//   dynamic phoneVerifiedAt;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   dynamic avgRatingStars;
//   String? profilePhotoUrl;
//   Info? info;
//   List<Position>? position;
//   List<dynamic>? reviews;
//   List<Department>? departments;
//   List<Position>? symptoms;
//   List<Experience>? experience;
//
//   DoctorsData({
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
//     this.info,
//     this.position,
//     this.reviews,
//     this.departments,
//     this.symptoms,
//     this.experience,
//   });
//
//   factory DoctorsData.fromJson(Map<String, dynamic> json) => DoctorsData(
//     id: json["id"],
//     name: json["name"],
//     doctorCode: json["doctor_code"],
//     email: json["email"],
//     phone: json["phone"],
//     username: json["username"],
//     usertype: usertypeValues.map[json["usertype"]]!,
//     about: json["about"],
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
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     avgRatingStars: json["avg_rating_stars"],
//     profilePhotoUrl: json["profile_photo_url"],
//     info: json["info"] == null ? null : Info.fromJson(json["info"]),
//     position: json["position"] == null ? [] : List<Position>.from(json["position"]!.map((x) => Position.fromJson(x))),
//     reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
//     departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
//     symptoms: json["symptoms"] == null ? [] : List<Position>.from(json["symptoms"]!.map((x) => Position.fromJson(x))),
//     experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "doctor_code": doctorCode,
//     "email": email,
//     "phone": phone,
//     "username": username,
//     "usertype": usertypeValues.reverse[usertype],
//     "about": about,
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
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "avg_rating_stars": avgRatingStars,
//     "profile_photo_url": profilePhotoUrl,
//     "info": info?.toJson(),
//     "position": position == null ? [] : List<dynamic>.from(position!.map((x) => x.toJson())),
//     "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
//     "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
//     "symptoms": symptoms == null ? [] : List<dynamic>.from(symptoms!.map((x) => x.toJson())),
//     "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
//   };
// }
//
// class Department {
//   int? id;
//   String? name;
//   String? slug;
//   String? icon;
//   int? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Pivot? pivot;
//
//   Department({
//     this.id,
//     this.name,
//     this.slug,
//     this.icon,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.pivot,
//   });
//
//   factory Department.fromJson(Map<String, dynamic> json) => Department(
//     id: json["id"],
//     name: json["name"],
//     slug: json["slug"],
//     icon: json["icon"],
//     status: json["status"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
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
//     "pivot": pivot?.toJson(),
//   };
// }
//
// class Pivot {
//   int? doctorAgentId;
//   int? departmentId;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? positionId;
//   int? symptomId;
//
//   Pivot({
//     this.doctorAgentId,
//     this.departmentId,
//     this.createdAt,
//     this.updatedAt,
//     this.positionId,
//     this.symptomId,
//   });
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//     doctorAgentId: json["doctor_agent_id"],
//     departmentId: json["department_id"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     positionId: json["position_id"],
//     symptomId: json["symptom_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "doctor_agent_id": doctorAgentId,
//     "department_id": departmentId,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "position_id": positionId,
//     "symptom_id": symptomId,
//   };
// }
//
// class Experience {
//   int? id;
//   int? doctorId;
//   int? departmentId;
//   String? workingPlace;
//   String? designation;
//   String? employmentStatus;
//   String? period;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   Experience({
//     this.id,
//     this.doctorId,
//     this.departmentId,
//     this.workingPlace,
//     this.designation,
//     this.employmentStatus,
//     this.period,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Experience.fromJson(Map<String, dynamic> json) => Experience(
//     id: json["id"],
//     doctorId: json["doctor_id"],
//     departmentId: json["department_id"],
//     workingPlace: json["working_place"],
//     designation: json["designation"],
//     employmentStatus: json["employment_status"],
//     period: json["period"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "doctor_id": doctorId,
//     "department_id": departmentId,
//     "working_place": workingPlace,
//     "designation": designation,
//     "employment_status": employmentStatus,
//     "period": period,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
//
// enum Gender {
//   FAMALE,
//   GENDER_MALE,
//   MALE
// }
//
// final genderValues = EnumValues({
//   "famale": Gender.FAMALE,
//   "Male": Gender.GENDER_MALE,
//   "male": Gender.MALE
// });
//
// class Info {
//   int? id;
//   int? doctorAgentId;
//   int? consultationFee;
//   int? followUpFee;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   Info({
//     this.id,
//     this.doctorAgentId,
//     this.consultationFee,
//     this.followUpFee,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Info.fromJson(Map<String, dynamic> json) => Info(
//     id: json["id"],
//     doctorAgentId: json["doctor_agent_id"],
//     consultationFee: json["consultation_fee"],
//     followUpFee: json["follow_up_fee"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "doctor_agent_id": doctorAgentId,
//     "consultation_fee": consultationFee,
//     "follow_up_fee": followUpFee,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
// }
//
// class Position {
//   int? id;
//   String? name;
//   String? icon;
//   String? slug;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Pivot? pivot;
//
//   Position({
//     this.id,
//     this.name,
//     this.icon,
//     this.slug,
//     this.createdAt,
//     this.updatedAt,
//     this.pivot,
//   });
//
//   factory Position.fromJson(Map<String, dynamic> json) => Position(
//     id: json["id"],
//     name: json["name"],
//     icon: json["icon"],
//     slug: json["slug"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "icon": icon,
//     "slug": slug,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "pivot": pivot?.toJson(),
//   };
// }
//
// enum Usertype {
//   AGENT,
//   DOCTOR
// }
//
// final usertypeValues = EnumValues({
//   "agent": Usertype.AGENT,
//   "doctor": Usertype.DOCTOR
// });
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
//     final allDoctorsModel = allDoctorsModelFromJson(jsonString);

import 'dart:convert';

AllDoctorsModel allDoctorsModelFromJson(String str) => AllDoctorsModel.fromJson(json.decode(str));

String allDoctorsModelToJson(AllDoctorsModel data) => json.encode(data.toJson());

class AllDoctorsModel {
  bool? success;
  String? message;
  List<DoctorsData>? data;

  AllDoctorsModel({
    this.success,
    this.message,
    this.data,
  });

  factory AllDoctorsModel.fromJson(Map<String, dynamic> json) => AllDoctorsModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<DoctorsData>.from(json["data"]!.map((x) => DoctorsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DoctorsData {
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
  String? startTimeForSchedule;
  String? endTimeForSchedule;
  String? startDayForSchedule;
  String? endDayForSchedule;
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
  Info? info;
  List<dynamic>? position;
  List<dynamic>? reviews;
  List<Department>? departments;
  List<Symptom>? symptoms;
  List<Experience>? experience;

  DoctorsData({
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
    this.info,
    this.position,
    this.reviews,
    this.departments,
    this.symptoms,
    this.experience,
  });

  factory DoctorsData.fromJson(Map<String, dynamic> json) => DoctorsData(
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
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    position: json["position"] == null ? [] : List<dynamic>.from(json["position"]!.map((x) => x)),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
    symptoms: json["symptoms"] == null ? [] : List<Symptom>.from(json["symptoms"]!.map((x) => Symptom.fromJson(x))),
    experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
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
    "info": info?.toJson(),
    "position": position == null ? [] : List<dynamic>.from(position!.map((x) => x)),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
    "symptoms": symptoms == null ? [] : List<dynamic>.from(symptoms!.map((x) => x.toJson())),
    "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
  };
}

class Department {
  int? id;
  String? name;
  String? slug;
  String? icon;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  Department({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  int? doctorAgentId;
  int? departmentId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? symptomId;

  Pivot({
    this.doctorAgentId,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
    this.symptomId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    doctorAgentId: json["doctor_agent_id"],
    departmentId: json["department_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    symptomId: json["symptom_id"],
  );

  Map<String, dynamic> toJson() => {
    "doctor_agent_id": doctorAgentId,
    "department_id": departmentId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "symptom_id": symptomId,
  };
}

class Experience {
  int? id;
  int? doctorId;
  int? departmentId;
  String? workingPlace;
  String? designation;
  String? employmentStatus;
  String? period;
  DateTime? createdAt;
  DateTime? updatedAt;

  Experience({
    this.id,
    this.doctorId,
    this.departmentId,
    this.workingPlace,
    this.designation,
    this.employmentStatus,
    this.period,
    this.createdAt,
    this.updatedAt,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    id: json["id"],
    doctorId: json["doctor_id"],
    departmentId: json["department_id"],
    workingPlace: json["working_place"],
    designation: json["designation"],
    employmentStatus: json["employment_status"],
    period: json["period"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "department_id": departmentId,
    "working_place": workingPlace,
    "designation": designation,
    "employment_status": employmentStatus,
    "period": period,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Info {
  int? id;
  int? doctorAgentId;
  int? consultationFee;
  int? followUpFee;
  DateTime? createdAt;
  DateTime? updatedAt;

  Info({
    this.id,
    this.doctorAgentId,
    this.consultationFee,
    this.followUpFee,
    this.createdAt,
    this.updatedAt,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    id: json["id"],
    doctorAgentId: json["doctor_agent_id"],
    consultationFee: json["consultation_fee"],
    followUpFee: json["follow_up_fee"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_agent_id": doctorAgentId,
    "consultation_fee": consultationFee,
    "follow_up_fee": followUpFee,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Symptom {
  int? id;
  String? name;
  String? slug;
  String? icon;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  Symptom({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}
