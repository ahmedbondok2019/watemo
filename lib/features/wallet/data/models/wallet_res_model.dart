import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'wallet_model.dart';
part 'wallet_res_model.g.dart';

@JsonSerializable()
class WalletResModel extends Equatable {
  final WalletModel wallet;
  final String error;
  final bool status;
  final String code;

  const WalletResModel({
    required this.code,
    required this.error,
    required this.wallet,
    required this.status,
  });

  factory WalletResModel.fromJson(Map<String, dynamic> json) =>
      _$WalletResModelFromJson(json);

  @override
  List<Object?> get props => [wallet,error,status,code];
}