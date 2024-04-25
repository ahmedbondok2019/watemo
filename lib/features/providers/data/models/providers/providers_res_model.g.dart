// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvidersResModel _$ProvidersResModelFromJson(
    Map<String, dynamic> json) => ProvidersResModel(
  providers: json['data'] != null
      ? List<ProvidersModel>.from(json["data"].map((x) => ProvidersModel.fromJson(x)))
      : [],
  status: json["status"] as bool,
  error: json["error"] as String,
  code: json["code"] as String,
);