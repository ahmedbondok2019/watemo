// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionsModel _$TransactionsModelFromJson(Map<String, dynamic> json) =>
    TransactionsModel(
      id: json['id'] as int?,
      paymentMethod: json['payment_method'] as String?,
      transRef: json['trans_ref'] as String?,
      date: json['date'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isPlus: json['isPluse'] as int?,
      percentage: json['percentage'] as String?,
    );