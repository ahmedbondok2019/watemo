// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationResModel _$NotificationResModelFromJson(Map<String, dynamic> json) => NotificationResModel(
  notifications: json['data'] != null
      ? List<NotificationModel>.from(json["data"]["notification"].map((x) =>
         NotificationModel.fromJson(x)))
      : [],
  status: json["status"] as bool,
  error: json["error"] as String,
  code: json["code"] as String,
);