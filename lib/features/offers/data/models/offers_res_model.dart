import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'offer_model.dart';
part 'offers_res_model.g.dart';

@JsonSerializable()
class OffersResModel extends Equatable {
  final List<OffersModel>? offers;
  final String? error;
  final bool? status;
  final String? code;

  const OffersResModel({
    this.code,
    this.error,
    this.offers,
    this.status,
  });

  factory OffersResModel.fromJson(Map<String, dynamic> json) => _$OffersResModelFromJson(json);

  @override
  List<Object?> get props => [offers,error,status,code];
}