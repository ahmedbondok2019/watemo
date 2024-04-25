// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json["id"] as int?,
  name: json["name"] as String?,
  email: json["email"] as String?,
  phone: json["phone"] as String?,
  userType: json["user_type"] as String?,
  password: json["password"] as String?,
  token: json["token"] as String?,
  image: json["image"] as String?,
  active: json["active"] as int?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'user_type': instance.userType,
      'token': instance.token,
      'image': instance.image,
      'active': instance.active,
    };
