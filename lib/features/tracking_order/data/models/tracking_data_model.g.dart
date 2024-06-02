// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingDataModel _$TrackingDataModelFromJson(Map<String, dynamic> json) =>
    TrackingDataModel(
      steps: json['data'] != null
          ? List<StepsModel>.from(json["data"].map((x) => StepsModel.fromJson(x)))
          : [],
      status: json["status"] as bool,
      error: json["error"] as String,
      code: json["code"] as String,
    );