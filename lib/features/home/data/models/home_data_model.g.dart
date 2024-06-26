// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataModel _$HomeDataModelFromJson(Map<String, dynamic> json) =>
    HomeDataModel(
      slider: json['slider'] != null
          ? List<SliderModel>.from(json["slider"].map((x) =>
            SliderModel.fromJson(x)))
          : [],
      hajj: json['hajj'] != null
          ? HajjModel.fromJson(json["hajj"])
          : null
    );