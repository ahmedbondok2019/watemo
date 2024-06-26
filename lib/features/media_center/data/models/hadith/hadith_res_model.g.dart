// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadithResModel _$HadithResModelFromJson(Map<String, dynamic> json) => HadithResModel(
  hadith: json['data'] != null
      ? List<HadithModel>.from(json["data"].map((x) => HadithModel.fromJson(x)))
      : [],
  status: json["status"] as bool,
  error: json["error"] as String,
  code: json["code"] as String,
);