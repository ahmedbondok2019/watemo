import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final Map<String, dynamic>? errors;
  final String? error;
  final bool? status;
  final String? code;

  ErrorModel({
    this.errors,
    this.status,
    this.error,
    this.code,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
