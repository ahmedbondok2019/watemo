// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutModel _$CheckoutModelFromJson(Map<String, dynamic> json) =>
    CheckoutModel(
      checkout: CheckoutUrlModel.fromJson(json['data']),
      error: json['error'] as String?,
      status: json['status'] as bool?,
      code: json['code'] as String?,
    );
