import 'package:json_annotation/json_annotation.dart';

import 'check_code_model.dart';
part 'check_code_res_model.g.dart';

@JsonSerializable()
class CheckCodeResModel {
  final CheckCodeModel codeDetails;
  final String error;
  final bool status;
  final String code;

  CheckCodeResModel({
    required this.codeDetails,
    required this.status,
    required this.error,
    required this.code,
  });

  factory CheckCodeResModel.fromJson(Map<String, dynamic> json) =>
      _$CheckCodeResModelFromJson(json);
}