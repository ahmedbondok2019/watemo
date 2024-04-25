// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingOrderModel _$TrackingOrderModelFromJson(
    Map<String, dynamic> json) => TrackingOrderModel(
  locations: json['locations'] != null
      ? List<LocationModel>.from(json["locations"].map((x) => LocationModel.fromJson(x)))
      : [],
  files: json['files'] != null
      ? List<FilesModel>.from(json["files"].map((x) => FilesModel.fromJson(x)))
      : [],
);