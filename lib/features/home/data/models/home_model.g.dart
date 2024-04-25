// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) =>
    HomeModel(
      homeData: HomeDataModel.fromJson(json["data"]),
      status: json["status"] as bool,
      error: json["error"] as String,
      code: json["code"] as String,
    );