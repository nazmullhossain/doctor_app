// To parse this JSON data, do
//
//     final paymentListModel = paymentListModelFromJson(jsonString);

import 'dart:convert';

PaymentListModel paymentListModelFromJson(String str) => PaymentListModel.fromJson(json.decode(str));

String paymentListModelToJson(PaymentListModel data) => json.encode(data.toJson());

class PaymentListModel {
  bool? success;
  String? message;
  List<Datum>? data;

  PaymentListModel({
    this.success,
    this.message,
    this.data,
  });

  factory PaymentListModel.fromJson(Map<String, dynamic> json) => PaymentListModel(
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
  dynamic? id;
  dynamic? doctorAgentId;
  String? paymentMethod;
  dynamic currency;
  dynamic bankName;
  dynamic branchName;
  dynamic bankCountry;
  dynamic accountHolderName;
  dynamic accountNumber;
  dynamic bicSwift;
  dynamic notes;
  String? mobileBankingAccountType;
  String? mobileBankingProviderName;
  String? mobileBankingMobileNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.doctorAgentId,
    this.paymentMethod,
    this.currency,
    this.bankName,
    this.branchName,
    this.bankCountry,
    this.accountHolderName,
    this.accountNumber,
    this.bicSwift,
    this.notes,
    this.mobileBankingAccountType,
    this.mobileBankingProviderName,
    this.mobileBankingMobileNumber,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    doctorAgentId: json["doctor_agent_id"],
    paymentMethod: json["payment_method"],
    currency: json["currency"],
    bankName: json["bank_name"],
    branchName: json["branch_name"],
    bankCountry: json["bank_country"],
    accountHolderName: json["account_holder_name"],
    accountNumber: json["account_number"],
    bicSwift: json["bic_swift"],
    notes: json["notes"],
    mobileBankingAccountType: json["mobile_banking_account_type"],
    mobileBankingProviderName: json["mobile_banking_provider_name"],
    mobileBankingMobileNumber: json["mobile_banking_mobile_number"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_agent_id": doctorAgentId,
    "payment_method": paymentMethod,
    "currency": currency,
    "bank_name": bankName,
    "branch_name": branchName,
    "bank_country": bankCountry,
    "account_holder_name": accountHolderName,
    "account_number": accountNumber,
    "bic_swift": bicSwift,
    "notes": notes,
    "mobile_banking_account_type": mobileBankingAccountType,
    "mobile_banking_provider_name": mobileBankingProviderName,
    "mobile_banking_mobile_number": mobileBankingMobileNumber,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
