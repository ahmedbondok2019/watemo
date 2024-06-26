import '../../../../../core/src/app_export.dart';
part 'create_order_req_model.g.dart';

@JsonSerializable()
class CreateOrderReqModel {
  List<List<String>>? services;
  final String? onBehalfOf;
  final String? userRelation;
  final String? notes;
  String? sex;
  String? paymentMethod;
  String? languages;

  CreateOrderReqModel({
    this.services,
    required this.onBehalfOf,
    required this.notes,
    required this.userRelation,
    this.sex,
    this.languages,
    this.paymentMethod,
  });

  FormData toJson() => _$CreateOrderReqModelToJson(this);
}