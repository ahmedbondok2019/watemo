// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordModel _$ForgetPasswordModelFromJson(Map<String, dynamic> json) => ForgetPasswordModel(
  status: json["status"] as bool?,
  date: json["data"] != null ? OtpModel.fromJson(json["data"]) : null,
  error: json["error"] as String?,
  code: json["code"] as String?,
);