// To parse this JSON data, do
//
//     final walletModel = walletModelFromJson(jsonString);

import 'dart:convert';

WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));

String walletModelToJson(WalletModel data) => json.encode(data.toJson());

class WalletModel {
  bool? success;
  String? message;
  dynamic? amount;

  WalletModel({
    this.success,
    this.message,
    this.amount,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    success: json["success"],
    message: json["message"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "amount": amount,
  };
}
