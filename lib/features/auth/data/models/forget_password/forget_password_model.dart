import 'package:completed/features/auth/data/models/otp/otp_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forget_password_model.g.dart';

@JsonSerializable()
class ForgetPasswordModel {
  final OtpModel? date;
  final String? error;
  final bool? status;
  final String? code;

  ForgetPasswordModel({
    this.error,
    this.code,
    this.date,
    this.status,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordModelFromJson(json);
}