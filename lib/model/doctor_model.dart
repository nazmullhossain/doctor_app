// // // To parse this JSON data, do
// // //
// // //     final doctorModel = doctorModelFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));
// //
// // String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());
// //
// // class DoctorModel {
// //   bool? success;
// //   String? message;
// //   dynamic avgRatingStars;
// //   String? statusMessage;
// //   DoctorProfileData? data;
// //
// //   DoctorModel({
// //     this.success,
// //     this.message,
// //     this.avgRatingStars,
// //     this.statusMessage,
// //     this.data,
// //   });
// //
// //   factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
// //     success: json["success"],
// //     message: json["message"],
// //     avgRatingStars: json["avg_rating_stars"],
// //     statusMessage: json["status_message"],
// //     data: json["data"] == null ? null : DoctorProfileData.fromJson(json["data"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "success": success,
// //     "message": message,
// //     "avg_rating_stars": avgRatingStars,
// //     "status_message": statusMessage,
// //     "data": data?.toJson(),
// //   };
// // }
// //
// // class DoctorProfileData {
// //   int? id;
// //   String? name;
// //   String? doctorCode;
// //   String? email;
// //   String? phone;
// //   String? username;
// //   String? usertype;
// //   String? about;
// //   String? gender;
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
// //   String? appointment;
// //   String? instantCall;
// //   dynamic emailVerifiedAt;
// //   dynamic phoneVerifiedAt;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? profilePhotoUrl;
// //   Wallet? wallet;
// //   List<Education>? educations;
// //   List<Department>? departments;
// //   List<Symptom>? symptoms;
// //   Info? info;
// //   List<Experience>? experience;
// //   List<dynamic>? reviews;
// //   DoctorStatus? doctorStatus;
// //
// //   DoctorProfileData({
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
// //     this.profilePhotoUrl,
// //     this.wallet,
// //     this.educations,
// //     this.departments,
// //     this.symptoms,
// //     this.info,
// //     this.experience,
// //     this.reviews,
// //     this.doctorStatus,
// //   });
// //
// //   factory DoctorProfileData.fromJson(Map<String, dynamic> json) => DoctorProfileData(
// //     id: json["id"],
// //     name: json["name"],
// //     doctorCode: json["doctor_code"],
// //     email: json["email"],
// //     phone: json["phone"],
// //     username: json["username"],
// //     usertype: json["usertype"],
// //     about: json["about"],
// //     gender: json["gender"],
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
// //     profilePhotoUrl: json["profile_photo_url"],
// //     wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
// //     educations: json["educations"] == null ? [] : List<Education>.from(json["educations"]!.map((x) => Education.fromJson(x))),
// //     departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
// //     symptoms: json["symptoms"] == null ? [] : List<Symptom>.from(json["symptoms"]!.map((x) => Symptom.fromJson(x))),
// //     info: json["info"] == null ? null : Info.fromJson(json["info"]),
// //     experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
// //     reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
// //     doctorStatus: json["doctor_status"] == null ? null : DoctorStatus.fromJson(json["doctor_status"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "doctor_code": doctorCode,
// //     "email": email,
// //     "phone": phone,
// //     "username": username,
// //     "usertype": usertype,
// //     "about": about,
// //     "gender": gender,
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
// //     "profile_photo_url": profilePhotoUrl,
// //     "wallet": wallet?.toJson(),
// //     "educations": educations == null ? [] : List<dynamic>.from(educations!.map((x) => x.toJson())),
// //     "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
// //     "symptoms": symptoms == null ? [] : List<dynamic>.from(symptoms!.map((x) => x.toJson())),
// //     "info": info?.toJson(),
// //     "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
// //     "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
// //     "doctor_status": doctorStatus?.toJson(),
// //   };
// // }
// //
// // class Department {
// //   dynamic? id;
// //   String? name;
// //   String? slug;
// //   String? icon;
// //   String? status;
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
// //   String? doctorAgentId;
// //   String? departmentId;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? symptomId;
// //
// //   Pivot({
// //     this.doctorAgentId,
// //     this.departmentId,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.symptomId,
// //   });
// //
// //   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
// //     doctorAgentId: json["doctor_agent_id"],
// //     departmentId: json["department_id"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //     symptomId: json["symptom_id"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "doctor_agent_id": doctorAgentId,
// //     "department_id": departmentId,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //     "symptom_id": symptomId,
// //   };
// // }
// //
// // class DoctorStatus {
// //   dynamic? id;
// //   String? doctorId;
// //   String? status;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   DoctorStatus({
// //     this.id,
// //     this.doctorId,
// //     this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory DoctorStatus.fromJson(Map<String, dynamic> json) => DoctorStatus(
// //     id: json["id"],
// //     doctorId: json["doctor_id"],
// //     status: json["status"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "doctor_id": doctorId,
// //     "status": status,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //   };
// // }
// //
// // class Education {
// //   dynamic? id;
// //   String? doctorId;
// //   String? degree;
// //   String? instituteName;
// //   String? image;
// //   String? passingYear;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   Education({
// //     this.id,
// //     this.doctorId,
// //     this.degree,
// //     this.instituteName,
// //     this.image,
// //     this.passingYear,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory Education.fromJson(Map<String, dynamic> json) => Education(
// //     id: json["id"],
// //     doctorId: json["doctor_id"],
// //     degree: json["degree"],
// //     instituteName: json["institute_name"],
// //     image: json["image"],
// //     passingYear: json["passing_year"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "doctor_id": doctorId,
// //     "degree": degree,
// //     "institute_name": instituteName,
// //     "image": image,
// //     "passing_year": passingYear,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //   };
// // }
// //
// // class Experience {
// //   dynamic? id;
// //   String? doctorId;
// //   String? departmentId;
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
// // class Info {
// //   dynamic? id;
// //   String? doctorAgentId;
// //   String? consultationFee;
// //   String? followUpFee;
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
// // class Symptom {
// //   dynamic? id;
// //   String? name;
// //   String? slug;
// //   String? icon;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   Pivot? pivot;
// //
// //   Symptom({
// //     this.id,
// //     this.name,
// //     this.slug,
// //     this.icon,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.pivot,
// //   });
// //
// //   factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
// //     id: json["id"],
// //     name: json["name"],
// //     slug: json["slug"],
// //     icon: json["icon"],
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
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //     "pivot": pivot?.toJson(),
// //   };
// // }
// //
// // class Wallet {
// //   dynamic? id;
// //   String? doctorAgentId;
// //   String? amount;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //
// //   Wallet({
// //     this.id,
// //     this.doctorAgentId,
// //     this.amount,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
// //     id: json["id"],
// //     doctorAgentId: json["doctor_agent_id"],
// //     amount: json["amount"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "doctor_agent_id": doctorAgentId,
// //     "amount": amount,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //   };
// // }
// // To parse this JSON data, do
// //
// //     final doctorModel = doctorModelFromJson(jsonString);
//
// import 'dart:convert';
//
// DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));
//
// String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());
//
// class DoctorModel {
//   bool? success;
//   String? message;
//   dynamic avgRatingStars;
//   String? statusMessage;
//   DoctorProfileData? data;
//
//   DoctorModel({
//     this.success,
//     this.message,
//     this.avgRatingStars,
//     this.statusMessage,
//     this.data,
//   });
//
//   factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
//     success: json["success"],
//     message: json["message"],
//     statusMessage: json["statusMessage"],
//     avgRatingStars: json["avg_rating_stars"],
//     data: json["data"] == null ? null : DoctorProfileData.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "statusMessage": statusMessage,
//     "avg_rating_stars": avgRatingStars,
//     "data": data?.toJson(),
//   };
// }
//
// class DoctorProfileData {
//   int? id;
//   String? name;
//   int? doctorCode;
//   String? email;
//   String? phone;
//   String? username;
//   String? usertype;
//   String? about;
//   String? gender;
//   String? bmdcNo;
//   bool? status;
//   String? profilePhotoPath;
//   dynamic startTimeForSchedule;
//   dynamic endTimeForSchedule;
//   dynamic startDayForSchedule;
//   dynamic endDayForSchedule;
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
//   String? profilePhotoUrl;
//   List<Education>? educations;
//   List<Department>? departments;
//   List<Symptom>? symptoms;
//   Info ?info;
//   List<Experience>? experience;
//   List<dynamic>? reviews;
//
//   DoctorProfileData({
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
//     this.profilePhotoUrl,
//     this.educations,
//     this.departments,
//     this.symptoms,
//     this.info,
//     this.experience,
//     this.reviews,
//   });
//
//   factory DoctorProfileData.fromJson(Map<String, dynamic> json) => DoctorProfileData(
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
//     profilePhotoUrl: json["profile_photo_url"],
//     educations: json["educations"] == null ? [] : List<Education>.from(json["educations"]!.map((x) => Education.fromJson(x))),
//     departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
//     symptoms: json["symptoms"] == null ? [] : List<Symptom>.from(json["symptoms"]!.map((x) => Symptom.fromJson(x))),
//     info: json["info"] == null ? null : Info.fromJson(json["info"]),
//     experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
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
//     "profile_photo_url": profilePhotoUrl,
//     "educations": educations == null ? [] : List<dynamic>.from(educations!.map((x) => x.toJson())),
//     "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
//     "symptoms": symptoms == null ? [] : List<dynamic>.from(symptoms!.map((x) => x.toJson())),
//     "info": info,
//     "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
//     "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
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
//   int? symptomId;
//
//   Pivot({
//     this.doctorAgentId,
//     this.departmentId,
//     this.createdAt,
//     this.updatedAt,
//     this.symptomId,
//   });
//
//   factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
//     doctorAgentId: json["doctor_agent_id"],
//     departmentId: json["department_id"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     symptomId: json["symptom_id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "doctor_agent_id": doctorAgentId,
//     "department_id": departmentId,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "symptom_id": symptomId,
//   };
// }
//
// class Education {
//   int? id;
//   int? doctorId;
//   String? degree;
//   String? instituteName;
//   dynamic image;
//   int? passingYear;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   Education({
//     this.id,
//     this.doctorId,
//     this.degree,
//     this.instituteName,
//     this.image,
//     this.passingYear,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory Education.fromJson(Map<String, dynamic> json) => Education(
//     id: json["id"],
//     doctorId: json["doctor_id"],
//     degree: json["degree"],
//     instituteName: json["institute_name"],
//     image: json["image"],
//     passingYear: json["passing_year"],
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "doctor_id": doctorId,
//     "degree": degree,
//     "institute_name": instituteName,
//     "image": image,
//     "passing_year": passingYear,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
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
// class Symptom {
//   int? id;
//   String? name;
//   String? slug;
//   String? icon;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   Pivot? pivot;
//
//   Symptom({
//     this.id,
//     this.name,
//     this.slug,
//     this.icon,
//     this.createdAt,
//     this.updatedAt,
//     this.pivot,
//   });
//
//   factory Symptom.fromJson(Map<String, dynamic> json) => Symptom(
//     id: json["id"],
//     name: json["name"],
//     slug: json["slug"],
//     icon: json["icon"],
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
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//     "pivot": pivot?.toJson(),
//   };
// }
// class Info {
//   dynamic? id;
//   String? doctorAgentId;
//   String? consultationFee;
//   String? followUpFee;
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
// To parse this JSON data, do
//
//     final doctorModel = doctorModelFromJson(jsonString);
//
// import 'dart:convert';
import 'dart:convert';
DoctorModel doctorModelFromJson(String str) => DoctorModel.fromJson(json.decode(str));

String doctorModelToJson(DoctorModel data) => json.encode(data.toJson());

class DoctorModel {
  bool? success;
  String? message;
  dynamic avgRatingStars;
  String? statusMessage;
  DoctorProfileData? data;

  DoctorModel({
    this.success,
    this.message,
    this.avgRatingStars,
    this.statusMessage,
    this.data,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    success: json["success"],
    message: json["message"],
    avgRatingStars: json["avg_rating_stars"],
    statusMessage: json["status_message"],
    data: json["data"] == null ? null : DoctorProfileData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "avg_rating_stars": avgRatingStars,
    "status_message": statusMessage,
    "data": data?.toJson(),
  };
}

class DoctorProfileData {
  int? id;
  String? name;
  int? doctorCode;
  int? countryId;
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
  String? startDayForSchedule;
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
  dynamic startDayForSchedul;
  String? profilePhotoUrl;
  Wallet? wallet;
  List<Education>? educations;
  List<Department>? departments;
  List<Symptom>? symptoms;
  Info? info;
  List<Experience>? experience;
  List<dynamic>? reviews;
  DoctorStatus? doctorStatus;

  DoctorProfileData({
    this.id,
    this.name,
    this.doctorCode,
    this.countryId,
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
    this.startDayForSchedul,
    this.profilePhotoUrl,
    this.wallet,
    this.educations,
    this.departments,
    this.symptoms,
    this.info,
    this.experience,
    this.reviews,
    this.doctorStatus,
  });

  factory DoctorProfileData.fromJson(Map<String, dynamic> json) => DoctorProfileData(
    id: json["id"],
    name: json["name"],
    doctorCode: json["doctor_code"],
    countryId: json["country_id"],

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
    startDayForSchedul: json["start_day_for_schedul"],
    profilePhotoUrl: json["profile_photo_url"],
    wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
    educations: json["educations"] == null ? [] : List<Education>.from(json["educations"]!.map((x) => Education.fromJson(x))),
    departments: json["departments"] == null ? [] : List<Department>.from(json["departments"]!.map((x) => Department.fromJson(x))),
    symptoms: json["symptoms"] == null ? [] : List<Symptom>.from(json["symptoms"]!.map((x) => Symptom.fromJson(x))),
    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    experience: json["experience"] == null ? [] : List<Experience>.from(json["experience"]!.map((x) => Experience.fromJson(x))),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    doctorStatus: json["doctor_status"] == null ? null : DoctorStatus.fromJson(json["doctor_status"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "doctor_code": doctorCode,
    "country_id": countryId,
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
    "start_day_for_schedul": startDayForSchedul,
    "profile_photo_url": profilePhotoUrl,
    "wallet": wallet?.toJson(),
    "educations": educations == null ? [] : List<dynamic>.from(educations!.map((x) => x.toJson())),
    "departments": departments == null ? [] : List<dynamic>.from(departments!.map((x) => x.toJson())),
    "symptoms": symptoms == null ? [] : List<dynamic>.from(symptoms!.map((x) => x)),
    "info": info?.toJson(),
    "experience": experience == null ? [] : List<dynamic>.from(experience!.map((x) => x.toJson())),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "doctor_status": doctorStatus?.toJson(),
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

  Pivot({
    this.doctorAgentId,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    doctorAgentId: json["doctor_agent_id"],
    departmentId: json["department_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "doctor_agent_id": doctorAgentId,
    "department_id": departmentId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class DoctorStatus {
  int? id;
  int? doctorId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  DoctorStatus({
    this.id,
    this.doctorId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory DoctorStatus.fromJson(Map<String, dynamic> json) => DoctorStatus(
    id: json["id"],
    doctorId: json["doctor_id"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Education {
  int? id;
  int? doctorId;
  String? degree;
  String? instituteName;
  dynamic image;
  int? passingYear;
  DateTime? createdAt;
  DateTime? updatedAt;

  Education({
    this.id,
    this.doctorId,
    this.degree,
    this.instituteName,
    this.image,
    this.passingYear,
    this.createdAt,
    this.updatedAt,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    id: json["id"],
    doctorId: json["doctor_id"],
    degree: json["degree"],
    instituteName: json["institute_name"],
    image: json["image"],
    passingYear: json["passing_year"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "degree": degree,
    "institute_name": instituteName,
    "image": image,
    "passing_year": passingYear,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
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