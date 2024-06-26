import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/src/app_export.dart';
part 'register_req_model.g.dart';

@JsonSerializable()
class RegisterReqModel {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? countryCode;
  final String? nationality;
  final String? city;
  final String? country;

  RegisterReqModel({
    required this.name,
    required this.phone,
    required this.country,
    required this.city,
    required this.password,
    required this.nationality,
    required this.countryCode,
    required this.email,
  });

  FormData toJson() => _$RegisterReqModelToJson(this);
}