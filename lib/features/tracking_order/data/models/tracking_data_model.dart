import 'package:completed/features/tracking_order/data/models/steps/steps_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tracking_data_model.g.dart';

@JsonSerializable()
class TrackingDataModel extends Equatable {
  final List<StepsModel> steps;
  final String error;
  final bool status;
  final String code;

  const TrackingDataModel({
    required this.code,
    required this.error,
    required this.steps,
    required this.status,
  });

  factory TrackingDataModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingDataModelFromJson(json);

  @override
  List<Object> get props => [steps,error,status,code];
}