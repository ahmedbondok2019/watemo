// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) => WalletModel(
      total: json['total'] as dynamic,
      transactions: json['transactions'] != null
          ? List<TransactionsModel>.from(
              json["transactions"].map((x) => TransactionsModel.fromJson(x)))
          : [],
    );
