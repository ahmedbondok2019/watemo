import '../../../../../core/src/app_export.dart';
part 'steps_model.g.dart';

@JsonSerializable()
class StepsModel extends Equatable{
  final int? id;
  final String? text;
  final String? description;
  final bool? status;
  final String? video;
  final int? fileType;
  final String? lat;
  final String? lng;
  final String? time;
  final String? date;

  const StepsModel({
    this.id,
    this.text,
    this.description,
    this.status,
    this.video,
    this.lng,
    this.lat,
    this.date,
    this.time,
    this.fileType,
  });

  factory StepsModel.fromJson(Map<String, dynamic> json) =>
      _$StepsModelFromJson(json);

  @override
  List<Object?> get props => [
    id,
    text,
    description,
    status,
    video,
    lng,
    lat,
    date,
    time,
    fileType,
  ];
}