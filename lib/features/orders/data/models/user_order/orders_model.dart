import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'orders_model.g.dart';

@JsonSerializable()
class OrdersModel extends Equatable {
  final int? id;
  final int? statusId;
  final String? status;
  final String? statusText;
  final String? image;
  final int? serviceId;
  final String? serviceType;
  final int? serviceTypeId;
  final String? serviceText;
  final String? serviceDescription;
  final dynamic total;
  final String? onBehalfOf;
  final String? dateFrom;
  final String? dateTo;
  final String? dateToStart;
  final int? dateToStartNumber;
  final bool? accepted;
  final String? notes;
  final bool? hasSteps;

  const OrdersModel({
    required this.id,
    required this.statusId,
    required this.statusText,
    required this.status,
    required this.image,
    required this.serviceText,
    required this.serviceTypeId,
    required this.total,
    required this.serviceId,
    required this.dateToStart,
    required this.dateFrom,
    required this.dateTo,
    required this.dateToStartNumber,
    required this.serviceType,
    required this.accepted,
    required this.onBehalfOf,
    required this.hasSteps,
    required this.notes,
    required this.serviceDescription,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  @override
  List<Object?> get props => [
    id,
    statusId,
    statusText,
    status,
    image,
    serviceText,
    total,
    serviceId,
    serviceTypeId,
    dateToStart,
    dateFrom,
    dateTo,
    dateToStartNumber,
    serviceType,
    hasSteps,
    onBehalfOf,
    serviceDescription,
    accepted,
    ];
}