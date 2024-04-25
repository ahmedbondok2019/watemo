import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/src/app_export.dart';
part 'edit_profile_req_model.g.dart';

@JsonSerializable()
class EditProfileReqModel {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final MultipartFile? image;

  EditProfileReqModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
  });

  FormData toJson() => _$EditProfileReqModelToJson(this);
}