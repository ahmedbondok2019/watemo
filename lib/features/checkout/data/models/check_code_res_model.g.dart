// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_code_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCodeResModel _$CheckCodeResModelFromJson(Map<String, dynamic> json) => CheckCodeResModel(
  codeDetails: CheckCodeModel.fromJson(json["data"]),
  status: json["status"] as bool,
  error: json["error"] as String,
  code: json["code"] as String,
);