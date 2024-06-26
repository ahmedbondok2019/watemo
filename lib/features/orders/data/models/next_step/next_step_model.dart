import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/src/app_export.dart';
part 'next_step_model.g.dart';

@JsonSerializable()
class NextStepModel {
  final String? orderId;
  final String? stepId;
  final MultipartFile? video;
  final String? lat;
  final String? lng;

  NextStepModel({
    required this.orderId,
    required this.stepId,
    required this.video,
    required this.lng,
    required this.lat,
  });

  FormData toJson() => _$NextStepModelToJson(this);
}