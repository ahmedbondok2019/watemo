// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormData _$CreateOrderReqModelToJson(CreateOrderReqModel instance) =>
    FormData.fromMap({
          'service_id': instance.serviceId,
          'on_behalf_of': instance.onBehalfOf,
          'user_relation': instance.userRelation,
          'required_date': instance.requiredDate,
          'code': instance.code,
          'payment_method': instance.paymentMethod,
          'vendor_id': instance.vendorId,
          'notes': instance.notes,
    });