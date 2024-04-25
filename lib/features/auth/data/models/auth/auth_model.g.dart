// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
  user: json["data"] != null ? UserModel.fromJson(json["data"]) : null,
  status: json["status"] as bool?,
  error: json["error"] as String?,
  code: json["code"] as String?,
);