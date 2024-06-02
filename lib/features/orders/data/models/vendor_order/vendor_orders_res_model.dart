import 'package:completed/features/orders/data/models/vendor_order/home_orders_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'vendor_orders_res_model.g.dart';

@JsonSerializable()
class VendorOrdersResModel extends Equatable {
  final HomeOrdersDataModel homeOrdersData;
  final String error;
  final bool status;
  final String code;

  const VendorOrdersResModel({
    required this.code,
    required this.error,
    required this.homeOrdersData,
    required this.status,
  });

  factory VendorOrdersResModel.fromJson(
      Map<String, dynamic> json) => _$VendorOrdersResModelFromJson(json);

  @override
  List<Object?> get props => [
    homeOrdersData,error,status,code];
}