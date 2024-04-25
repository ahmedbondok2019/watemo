import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'services_model.g.dart';

@JsonSerializable()
class ServicesModel extends Equatable {
  final int? id;
  final String? title;
  final dynamic price;
  final String? image;

  const ServicesModel({
    this.id,
    this.title,
    this.price,
    this.image,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => _$ServicesModelFromJson(json);

  @override
  List<Object?> get props => [id,title,price,image];
}