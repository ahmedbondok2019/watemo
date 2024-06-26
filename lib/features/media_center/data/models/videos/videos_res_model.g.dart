// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosResModel _$VideosResModelFromJson(Map<String, dynamic> json) => VideosResModel(
  videos: json['data'] != null
      ? List<VideosModel>.from(json["data"].map((x) =>
      VideosModel.fromJson(x)))
      : [],
  status: json["status"] as bool,
  error: json["error"] as String,
  code: json["code"] as String,
);