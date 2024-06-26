import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/src/app_export.dart';
part 'edit_vendor_profile_req_model.g.dart';

@JsonSerializable()
class EditVendorProfileReqModel {
  final String? name;
  final String? phone;
  final String? countryCode;
  final String? email;
  final String? password;
  final String? country;
  final String? city;
  final String? day;
  final String? month;
  final String? year;
  final String? languages;
  final String? nationality;
  final String? services;
  final String? sex;
  final MultipartFile? identityFace;
  final MultipartFile? identityBack;
  final MultipartFile? image;

  EditVendorProfileReqModel({
    required this.name,
    required this.phone,
    required this.city,
    required this.country,
    required this.password,
    required this.countryCode,
    required this.email,
    required this.identityBack,
    required this.identityFace,
    required this.sex,
    required this.languages,
    required this.nationality,
    required this.services,
    required this.year,
    required this.day,
    required this.month,
    required this.image,
  });

  FormData toJson() => _$EditVendorProfileReqModelToJson(this);
}