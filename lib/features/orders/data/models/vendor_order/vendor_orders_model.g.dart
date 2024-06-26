// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorOrdersModel _$VendorOrdersModelFromJson(Map<String, dynamic> json) => VendorOrdersModel(
      id: json['id'] as int,
      statusId: json['status_id'] as int,
      status: json['status'] as String,
      image: json['image'] as String,
      statusText: json['status_text'] as String,
      serviceId: json['service_id'] as int,
      serviceText: json['service_text'] as String,
      total: json['total'] as dynamic,
    );