// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      id: json['id'] as int?,
      statusId: json['status_id'] as int?,
      status: json['status'] as String?,
      statusText: json['status_text'] as String?,
      image: json['image'] as String?,
      serviceText: json['service_text'] as String?,
      total: json['total'] as dynamic,
      serviceId: json['service_id'] as int?,
      serviceTypeId: json['service_type_id'] as int?,
      dateTo: json['date_to'] as String?,
      dateFrom: json['date_from'] as String?,
      dateToStart: json['date_to_start'] as String?,
      serviceType: json['service_type'] as String?,
      serviceDescription: json['service_description'] as String?,
      dateToStartNumber: json['date_to_start_number'] as int?,
      onBehalfOf: json['on_behalf_of'] as String?,
      notes: json['notes'] as String?,
      accepted: json['accepted'] as bool?,
      hasSteps: json['has_steps'] as bool?,
    );