import 'package:completed/features/tracking_order/data/models/tracking_order_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tracking_data_model.g.dart';

@JsonSerializable()
class TrackingDataModel extends Equatable {
  final TrackingOrderModel trackingOrder;
  final String error;
  final bool status;
  final String code;

  const TrackingDataModel({
    required this.code,
    required this.error,
    required this.trackingOrder,
    required this.status,
  });

  factory TrackingDataModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingDataModelFromJson(json);

  @override
  List<Object> get props => [trackingOrder,error,status,code];
}