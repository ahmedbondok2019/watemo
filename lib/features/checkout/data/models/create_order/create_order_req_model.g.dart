// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_req_model.dart';

FormData _$CreateOrderReqModelToJson(CreateOrderReqModel instance) =>
    FormData.fromMap({
          'on_behalf_of': instance.onBehalfOf,
          'user_relation': instance.userRelation,
          'payment_method': instance.paymentMethod,
          'notes': instance.notes,
          'languages': instance.languages,
          'sex': instance.sex,
          'services': instance.services.toString(),
    });