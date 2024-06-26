// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_orders_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeOrdersDataModel _$HomeOrdersDataModelFromJson(Map<String, dynamic> json) => HomeOrdersDataModel(
      orders: json['orders'] != null
          ? List<OrdersModel>.from(json["orders"].map((x) =>
          OrdersModel.fromJson(x)))
          : [],
      totalOrders: json['total_orders'] as int,
      currentOrders: json['current_orders'] as int,
      vendorTotalProfit: json['vendorTotalProfit'] as int,
    );