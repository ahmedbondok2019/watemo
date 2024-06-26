// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_orders_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorOrdersResModel _$VendorOrdersResModelFromJson(Map<String, dynamic> json) =>
    VendorOrdersResModel(
      homeOrdersData: HomeOrdersDataModel.fromJson(json['data']),
      status: json["status"] as bool,
      error: json["error"] as String,
      code: json["code"] as String,
    );