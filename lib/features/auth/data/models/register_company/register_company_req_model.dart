import '../../../../../core/src/app_export.dart';
part 'register_company_req_model.g.dart';

@JsonSerializable()
class RegisterCompanyReqModel {
  final String? name;
  final String? countryCode;
  final String? phone;
  final String? address;
  final String? taxId;
  final String? email;
  final String? password;
  final String? country;
  final String? city;
  final String? ibanNumber;
  final String? expectCount;
  final MultipartFile? taxImage;
  final MultipartFile? licenseImage;
  final MultipartFile? image;

  RegisterCompanyReqModel({
    required this.name,
    required this.phone,
    required this.city,
    required this.taxId,
    required this.address,
    required this.country,
    required this.password,
    required this.countryCode,
    required this.email,
    required this.ibanNumber,
    required this.expectCount,
    required this.taxImage,
    required this.licenseImage,
    required this.image,
  });

  FormData toJson() => _$RegisterCompanyReqModelToJson(this);
}