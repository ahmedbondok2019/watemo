import 'package:completed/features/providers/data/models/providers/providers_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'providers_res_model.g.dart';

@JsonSerializable()
class ProvidersResModel {
  final List<ProvidersModel> providers;
  final String error;
  final bool status;
  final String code;

  ProvidersResModel({
    required this.providers,
    required this.status,
    required this.error,
    required this.code,
  });

  factory ProvidersResModel.fromJson(Map<String, dynamic> json) =>
      _$ProvidersResModelFromJson(json);
}