// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletResModel _$WalletResModelFromJson(Map<String, dynamic> json) =>
    WalletResModel(
      wallet: WalletModel.fromJson(json['data']),
      status: json["status"] as bool,
      error: json["error"] as String,
      code: json["code"] as String,
    );