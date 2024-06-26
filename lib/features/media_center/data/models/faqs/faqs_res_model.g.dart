// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faqs_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqsResModel _$FaqsResModelFromJson(Map<String, dynamic> json) => FaqsResModel(
  faqs: json['data'] != null
      ? List<FaqsModel>.from(json["data"].map((x) =>
      FaqsModel.fromJson(x)))
      : [],
  status: json["status"] as bool,
  error: json["error"] as String,
  code: json["code"] as String,
);