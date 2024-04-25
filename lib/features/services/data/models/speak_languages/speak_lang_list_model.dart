import 'package:json_annotation/json_annotation.dart';
part 'speak_lang_list_model.g.dart';

@JsonSerializable()
class SpeakLangListModel {
  final int? id;
  final String? title;

  SpeakLangListModel({
    required this.id,
    required this.title,
  });

  factory SpeakLangListModel.fromJson(Map<String, dynamic> json) =>
      _$SpeakLangListModelFromJson(json);
}