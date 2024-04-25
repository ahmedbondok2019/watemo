// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
          description: json['description'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      readAt: json['read_at'] as String?,
      isRead: json['isRead'] as bool?,
    );