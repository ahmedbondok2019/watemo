import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final int? status;
  final bool? showApprovalScreen;
  final String? userType;
  final int? active;
  final int? type;
  final String? token;
  final int? countryCode;
  final int? nationality;
  final String? address;
  final int? sex;
  final int? day;
  final int? month;
  final int? year;
  final int? country;
  final int? city;
  final String? taxId;
  final int? identityFaceStatus;
  final int? identityBackStatus;
  final int? expectCount;
  final String? languages;
  final String? services;
  final String? ibanNumber;
  final String? image;
  final String? taxImage;
  final String? identityFace;
  final String? identityBack;
  final String? licenseImage;
  String? password;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.showApprovalScreen,
    required this.image,
    required this.password,
    required this.token,
    required this.userType,
    required this.nationality,
    required this.active,
    required this.expectCount,
    required this.city,
    required this.country,
    required this.licenseImage,
    required this.taxImage,
    required this.ibanNumber,
    required this.taxId,
    required this.address,
    required this.type,
    required this.countryCode,
    required this.status,
    required this.month,
    required this.day,
    required this.year,
    required this.languages,
    required this.services,
    required this.identityBack,
    required this.identityBackStatus,
    required this.identityFace,
    required this.identityFaceStatus,
    required this.sex,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}