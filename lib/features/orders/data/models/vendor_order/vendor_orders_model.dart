import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'vendor_orders_model.g.dart';

@JsonSerializable()
class VendorOrdersModel extends Equatable {
  final int id;
  final int statusId;
  final String status;
  final String statusText;
  final String image;
  final int serviceId;
  final String serviceText;
  final dynamic total;

  const VendorOrdersModel({
    required this.id,
    required this.serviceId,
    required this.serviceText,
    required this.statusId,
    required this.image,
    required this.statusText,
    required this.total,
    required this.status,
  });

  factory VendorOrdersModel.fromJson(Map<String, dynamic> json) => _$VendorOrdersModelFromJson(json);

  @override
  List<Object> get props => [id,serviceId,image,serviceText,statusId,statusText,
    total,status];
}