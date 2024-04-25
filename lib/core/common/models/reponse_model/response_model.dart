import 'package:json_annotation/json_annotation.dart';
part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  final dynamic data;
  final String? error;
  final bool? status;
  final String? code;

  ResponseModel({
    this.data,
    this.status,
    this.error,
    this.code,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
}