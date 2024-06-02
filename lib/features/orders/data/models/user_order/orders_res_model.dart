import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'orders_res_model.g.dart';

@JsonSerializable()
class OrdersResModel extends Equatable {
  final Map<String,dynamic>? orders;
  final String error;
  final bool status;
  final String code;

  const OrdersResModel({
    required this.code,
    required this.error,
    required this.orders,
    required this.status,
  });

  factory OrdersResModel.fromJson(Map<String, dynamic> json) => _$OrdersResModelFromJson(json);

  @override
  List<Object?> get props => [orders,error,status,code];
}