import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/src/app_export.dart';
part 'create_order_req_model.g.dart';

@JsonSerializable()
class CreateOrderReqModel {
  final String? serviceId;
  final String? onBehalfOf;
  final String? userRelation;
  final String? requiredDate;
  String? code;
  String? paymentMethod;
  String? vendorId;
  final String? notes;

  CreateOrderReqModel({
    required this.serviceId,
    required this.onBehalfOf,
    required this.userRelation,
    this.paymentMethod,
    required this.requiredDate,
     this.code,
    this.vendorId,
    required this.notes,
  });

  FormData toJson() => _$CreateOrderReqModelToJson(this);
}