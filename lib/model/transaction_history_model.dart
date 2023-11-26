// To parse this JSON data, do
//
//     final transactionHistoryModel = transactionHistoryModelFromJson(jsonString);

import 'dart:convert';

TransactionHistoryModel transactionHistoryModelFromJson(String str) => TransactionHistoryModel.fromJson(json.decode(str));

String transactionHistoryModelToJson(TransactionHistoryModel data) => json.encode(data.toJson());

class TransactionHistoryModel {
  bool? success;
  String? message;
  List<Datum>? data;

  TransactionHistoryModel({
    this.success,
    this.message,
    this.data,
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) => TransactionHistoryModel(
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
  String? doctorAgentId;
  String? paymentMethodId;
  String? amount;
  String? status;
  String? isActive;
  dynamic rejectReason;
  DateTime? createdAt;
  DateTime? updatedAt;
  PaymentMethods? paymentMethods;

  Datum({
    this.id,
    this.doctorAgentId,
    this.paymentMethodId,
    this.amount,
    this.status,
    this.isActive,
    this.rejectReason,
    this.createdAt,
    this.updatedAt,
    this.paymentMethods,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    doctorAgentId: json["doctor_agent_id"],
    paymentMethodId: json["payment_method_id"],
    amount: json["amount"],
    status: json["status"],
    isActive: json["is_active"],
    rejectReason: json["reject_reason"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    paymentMethods: json["payment_methods"] == null ? null : PaymentMethods.fromJson(json["payment_methods"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_agent_id": doctorAgentId,
    "payment_method_id": paymentMethodId,
    "amount": amount,
    "status": status,
    "is_active": isActive,
    "reject_reason": rejectReason,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "payment_methods": paymentMethods?.toJson(),
  };
}

class PaymentMethods {
  dynamic? id;
  String? doctorAgentId;
  String? paymentMethod;
  String? currency;
  String? bankName;
  String? branchName;
  String? bankCountry;
  String? accountHolderName;
  String? accountNumber;
  String? bicSwift;
  String? notes;
  dynamic mobileBankingAccountType;
  dynamic mobileBankingProviderName;
  dynamic mobileBankingMobileNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  PaymentMethods({
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

  factory PaymentMethods.fromJson(Map<String, dynamic> json) => PaymentMethods(
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
