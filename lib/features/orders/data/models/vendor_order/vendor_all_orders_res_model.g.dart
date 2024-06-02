// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_all_orders_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorAllOrdersResModel _$VendorAllOrdersResModelFromJson(Map<String, dynamic> json) =>
    VendorAllOrdersResModel(
      orders: json['data'] != null
          ? List<OrdersModel>.from(json["data"].map((x) =>
          OrdersModel.fromJson(x)))
          : [],
      status: json["status"] as bool,
      error: json["error"] as String,
      code: json["code"] as String,
    );