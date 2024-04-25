import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final dynamic data;
  final String? error;
  final bool? status;
  final String? code;

  ErrorModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
