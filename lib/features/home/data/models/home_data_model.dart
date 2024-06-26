import 'package:completed/features/home/data/models/slider_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
import 'hajj_model.dart';
part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel extends Equatable{
  final List<SliderModel> slider;
  final HajjModel? hajj;

 const HomeDataModel({
   required this.slider,
   required this.hajj,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);

  @override
  List<Object?> get props => [slider,hajj];
}