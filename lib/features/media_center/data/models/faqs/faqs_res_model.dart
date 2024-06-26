import 'package:completed/features/media_center/data/models/videos/videos_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'faqs_model.dart';
part 'faqs_res_model.g.dart';

@JsonSerializable()
class FaqsResModel {
  final List<FaqsModel> faqs;
  final String error;
  final bool status;
  final String code;

  FaqsResModel({
    required this.faqs,
    required this.status,
    required this.error,
    required this.code,
  });

  factory FaqsResModel.fromJson(Map<String, dynamic> json) =>
      _$FaqsResModelFromJson(json);
}