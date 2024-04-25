import 'package:json_annotation/json_annotation.dart';
part 'otp_model.g.dart';

@JsonSerializable()
class OtpModel {
  final String? code;

  OtpModel({
    required this.code,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) =>
      _$OtpModelFromJson(json);
}