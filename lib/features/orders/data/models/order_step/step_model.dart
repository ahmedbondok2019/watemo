import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'step_model.g.dart';

@JsonSerializable()
class StepModel extends Equatable {
  final int? id;
  final String? text;
  final String? description;
  final bool? status;
  final String? video;
  final String? lat;
  final String? lng;
  final String? time;
  final String? date;

  const StepModel({
    required this.id,
    required this.text,
    required this.time,
    required this.date,
    required this.lat,
    required this.lng,
    required this.description,
    required this.status,
    required this.video,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) =>
      _$StepModelFromJson(json);

  @override
  List<Object?> get props => [
    id,
    text,
    time,
    date,
    lat,
    lng,
    description,
    status,
    video,
  ];
}