import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../user_order/orders_model.dart';
part 'home_orders_data_model.g.dart';

@JsonSerializable()
class HomeOrdersDataModel extends Equatable {
  final List<OrdersModel> orders;
  final int totalOrders;
  final int currentOrders;
  final int vendorTotalProfit;

  const HomeOrdersDataModel({
    required this.orders,
    required this.currentOrders,
    required this.totalOrders,
    required this.vendorTotalProfit,
  });

  factory HomeOrdersDataModel.fromJson(Map<String,
      dynamic> json) => _$HomeOrdersDataModelFromJson(json);

  @override
  List<Object> get props => [
    orders,
    currentOrders,
    totalOrders,
    vendorTotalProfit,
  ];
}