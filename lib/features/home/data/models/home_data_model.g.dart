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
          hadith: json['hadeeth'] != null
              ? List<HadithModel>.from(json["hadeeth"].map((x) =>
                 HadithModel.fromJson(x)))
              : [],
          services: json['services'] != null
              ? List<ServicesModel>.from(json["services"].map((x) =>
                ServicesModel.fromJson(x)))
              : [],
    );
