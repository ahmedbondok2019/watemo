// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TitleIdModel _$TitleIdModelFromJson(Map<String, dynamic> json) =>
    TitleIdModel(
      listData: json['data'] != null
          ? List<TitleIdListModel>.from(json["data"].map((x) =>
              TitleIdListModel.fromJson(x)))
          : [],
      error: json['error'] as String?,
      status: json['status'] as bool?,
      code: json['code'] as String?,
    );
