import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
import 'files_model.dart';
import 'location_model.dart';
part 'tracking_order_model.g.dart';

@JsonSerializable()
class TrackingOrderModel extends Equatable{
  final List<LocationModel> locations;
  final List<FilesModel> files;

  const TrackingOrderModel({
    required this.locations,
    required this.files,
  });

  factory TrackingOrderModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingOrderModelFromJson(json);

  @override
  List<Object> get props => [locations,files];
}