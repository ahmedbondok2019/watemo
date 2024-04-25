// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingDataModel _$TrackingDataModelFromJson(Map<String, dynamic> json) =>
    TrackingDataModel(
      trackingOrder: TrackingOrderModel.fromJson(json['data']),
      status: json["status"] as bool,
      error: json["error"] as String,
      code: json["code"] as String,
    );