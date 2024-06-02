import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
part 'hajj_model.g.dart';

@JsonSerializable()
class HajjModel extends Equatable{
  final int? id;
  final String? title;
  final dynamic price;
  final String? image;
  final int? type;

  const HajjModel({
    this.id,
    this.image,
    this.title,
    this.price,
    this.type,
  });

  factory HajjModel.fromJson(Map<String, dynamic> json) =>
      _$HajjModelFromJson(json);

  @override
  List<Object?> get props => [id,image,title,price,type];
}