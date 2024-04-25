// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
ProvidersModel _$ProvidersModelFromJson(Map<String, dynamic> json) =>
    ProvidersModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as dynamic,
      lang: json['lang'].cast<String>(),
      image: json['image'] as String,
      rate: json['rate'] as int,
    );