import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'providers_model.g.dart';

@JsonSerializable()
class ProvidersModel extends Equatable {
  final int id;
  final String name;
  final dynamic price;
  final List<String> lang;
  final String image;
  final int rate;

  const ProvidersModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.lang,
    required this.rate,
  });

  factory ProvidersModel.fromJson(Map<String, dynamic> json) => _$ProvidersModelFromJson(json);

  @override
  List<Object?> get props => [id,name,price,image,lang,rate];
}