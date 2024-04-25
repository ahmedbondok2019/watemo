import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel extends Equatable{
  final int? id;
  final String? image;
  final String? link;

  const SliderModel({
    this.id,
    this.image,
    this.link,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);

  @override
  List<Object?> get props => [id,image,link];
}