import 'package:json_annotation/json_annotation.dart';
import 'about_content_model.dart';
part 'about_model.g.dart';

@JsonSerializable()
class AboutModel {
  final AboutContentModel data;
  final String error;
  final bool status;
  final String code;

  AboutModel({
    required this.code,
    required this.error,
    required this.data,
    required this.status,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) =>
      _$AboutModelFromJson(json);
}
