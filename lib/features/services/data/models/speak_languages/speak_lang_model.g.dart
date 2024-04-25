// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speak_lang_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeakLangModel _$SpeakLangModelFromJson(Map<String, dynamic> json) =>
    SpeakLangModel(
      languages: json['data'] != null
          ? List<SpeakLangListModel>.from(json["data"].map((x) => SpeakLangListModel.fromJson(x)))
          : [],
      error: json['error'] as String,
      status: json['status'] as bool,
      code: json['code'] as String,
    );