import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? userType;
  String? password;
  final String? phone;
  final int? active;
  final String? image;
  final String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.password,
    required this.token,
    required this.userType,
    required this.active,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}