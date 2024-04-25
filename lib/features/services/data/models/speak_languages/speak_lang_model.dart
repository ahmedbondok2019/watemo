import 'package:completed/features/services/data/models/speak_languages/speak_lang_list_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'speak_lang_model.g.dart';

@JsonSerializable()
class SpeakLangModel {
  final List<SpeakLangListModel> languages;
  final String error;
  final bool status;
  final String code;

  SpeakLangModel({
    required this.languages,
    required this.status,
    required this.error,
    required this.code,
  });

  factory SpeakLangModel.fromJson(Map<String, dynamic> json) =>
      _$SpeakLangModelFromJson(json);
}
