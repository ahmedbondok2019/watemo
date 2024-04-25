import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final String? readAt;
  final String? createdAt;
  final bool? isRead;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.readAt,
    required this.createdAt,
    required this.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  @override
  List<Object?> get props => [id, title,description,image,readAt,createdAt,isRead];
}