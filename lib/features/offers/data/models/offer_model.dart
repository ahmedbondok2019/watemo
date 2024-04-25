import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
part 'offer_model.g.dart';

@JsonSerializable()
class OffersModel extends Equatable{
  final int? id;
  final String? title;
  final String? slug;
  final String? image;
  final String? link;

  const OffersModel({
    this.image,
    this.title,
    this.id,
    this.slug,
    this.link,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) =>
      _$OffersModelFromJson(json);

  @override
  List<Object?> get props => [id,title,slug,image,link];
}