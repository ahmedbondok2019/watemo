import 'package:completed/features/services/data/models/services/services_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'services_res_model.g.dart';

@JsonSerializable()
class ServicesResModel {
  final List<ServicesModel> services;
  final String error;
  final bool status;
  final String code;

  ServicesResModel({
    required this.services,
    required this.status,
    required this.error,
    required this.code,
  });

  factory ServicesResModel.fromJson(Map<String, dynamic> json) =>
      _$ServicesResModelFromJson(json);
}