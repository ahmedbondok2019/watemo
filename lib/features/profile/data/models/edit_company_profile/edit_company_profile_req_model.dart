import '../../../../../core/src/app_export.dart';
part 'edit_company_profile_req_model.g.dart';

@JsonSerializable()
class EditCompanyProfileReqModel {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? countryCode;
  final String? address;
  final String? taxId;
  final String? country;
  final String? city;
  final String? ibanNumber;
  final String? expectCount;
  final MultipartFile? taxImage;
  final MultipartFile? licenseImage;
  final MultipartFile? image;

  EditCompanyProfileReqModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
    required this.countryCode,
    required this.country,
    required this.address,
    required this.city,
    required this.licenseImage,
    required this.taxImage,
    required this.ibanNumber,
    required this.expectCount,
    required this.taxId,
  });

  FormData toJson() => _$EditCompanyProfileReqModelToJson(this);
}