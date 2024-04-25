import 'package:completed/features/auth/data/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final UserModel? user;
  final String? error;
  final bool? status;
  final String? code;

  AuthModel({
    this.code,
    this.error,
    this.user,
    this.status,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}