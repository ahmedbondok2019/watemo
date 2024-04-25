import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {
  final dynamic data;
  final String error;
  final bool status;
  final String code;

  ContactModel({
    required this.code,
    required this.error,
    required this.data,
    required this.status,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
}
