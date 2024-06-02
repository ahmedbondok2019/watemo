// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersResModel _$OrdersResModelFromJson(Map<String, dynamic> json) =>
    OrdersResModel(
      orders: json['data'] == "[]" || json['data'] == []
          || json['data'].isEmpty
          ? null : json['data'],
      status: json["status"] as bool,
      error: json["error"] as String,
      code: json["code"] as String,
    );