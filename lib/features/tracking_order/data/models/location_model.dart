import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends Equatable{
  final String? lat;
  final String? lng;

  const LocationModel({
    this.lat,
    this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  @override
  List<Object?> get props => [lat,lng];
}