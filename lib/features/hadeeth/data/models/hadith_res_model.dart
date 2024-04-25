import 'package:json_annotation/json_annotation.dart';

import 'hadith_model.dart';
part 'hadith_res_model.g.dart';

@JsonSerializable()
class HadithResModel {
  final List<HadithModel> hadith;
  final String error;
  final bool status;
  final String code;

  HadithResModel({
    required this.hadith,
    required this.status,
    required this.error,
    required this.code,
  });

  factory HadithResModel.fromJson(Map<String, dynamic> json) =>
      _$HadithResModelFromJson(json);
}