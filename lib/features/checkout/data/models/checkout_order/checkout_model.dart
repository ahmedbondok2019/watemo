import 'package:json_annotation/json_annotation.dart';

import 'checkout_url_model.dart';
part 'checkout_model.g.dart';

@JsonSerializable()
class CheckoutModel {
  final CheckoutUrlModel? checkout;
  final String? error;
  final bool? status;
  final String? code;

  CheckoutModel({
    this.checkout,
    this.status,
    this.error,
    this.code,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutModelFromJson(json);
}