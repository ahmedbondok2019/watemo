// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersResModel _$OffersResModelFromJson(Map<String, dynamic> json) =>
    OffersResModel(
      offers: json['data'] != null
          ? List<OffersModel>.from(json["data"].map((x) => OffersModel.fromJson(x)))
          : [],
      status: json["status"] as bool?,
      error: json["error"] as String?,
      code: json["code"] as String?,
    );