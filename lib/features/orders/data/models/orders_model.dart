import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'orders_model.g.dart';

@JsonSerializable()
class OrdersModel extends Equatable {
  final int id;
  final int statusId;
  final String status;
  final String statusText;
  final String image;
  final int serviceId;
  final String serviceText;
  final dynamic total;

  const OrdersModel({
    required this.id,
    required this.serviceId,
    required this.serviceText,
    required this.statusId,
    required this.image,
    required this.statusText,
    required this.total,
    required this.status,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => _$OrdersModelFromJson(json);

  @override
  List<Object> get props => [id,serviceId,image,serviceText,statusId,statusText,
    total,status];
}