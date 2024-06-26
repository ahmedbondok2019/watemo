import 'package:completed/features/orders/data/models/order_step/step_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_steps_res_model.g.dart';

@JsonSerializable()
class OrderStepsResModel extends Equatable {
  final List<StepModel> steps;
  final String error;
  final bool status;
  final String code;

  const OrderStepsResModel({
    required this.code,
    required this.error,
    required this.steps,
    required this.status,
  });

  factory OrderStepsResModel.fromJson(
      Map<String, dynamic> json) => _$OrderStepsResModelFromJson(json);

  @override
  List<Object> get props => [steps,error,status,code];
}