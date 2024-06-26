import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../user_order/orders_model.dart';
part 'vendor_all_orders_res_model.g.dart';

@JsonSerializable()
class VendorAllOrdersResModel extends Equatable {
  final List<OrdersModel> orders;
  final String error;
  final bool status;
  final String code;

  const VendorAllOrdersResModel({
    required this.code,
    required this.error,
    required this.orders,
    required this.status,
  });

  factory VendorAllOrdersResModel.fromJson(
      Map<String, dynamic> json) => _$VendorAllOrdersResModelFromJson(json);

  @override
  List<Object?> get props => [orders,error,status,code];
}