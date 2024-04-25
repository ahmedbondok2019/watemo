// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServicesResModel _$ServicesResModelFromJson(Map<String, dynamic> json) => ServicesResModel(
  services: json['data'] != null
      ? List<ServicesModel>.from(json["data"].map((x) => ServicesModel.fromJson(x)))
      : [],
  status: json["status"] as bool,
  error: json["error"] as String,
  code: json["code"] as String,
);