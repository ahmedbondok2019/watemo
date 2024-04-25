import 'package:json_annotation/json_annotation.dart';

import 'notification_model.dart';
part 'notifications_res_model.g.dart';

@JsonSerializable()
class NotificationResModel {
  final List<NotificationModel> notifications;
  final String error;
  final bool status;
  final String code;

  NotificationResModel({
    required this.notifications,
    required this.status,
    required this.error,
    required this.code,
  });

  factory NotificationResModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationResModelFromJson(json);
}