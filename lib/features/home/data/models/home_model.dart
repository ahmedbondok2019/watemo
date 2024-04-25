import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'home_data_model.dart';
part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends Equatable {
  final HomeDataModel homeData;
  final String error;
  final bool status;
  final String code;

  const HomeModel({
    required this.code,
    required this.error,
    required this.homeData,
    required this.status,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

  @override
  List<Object> get props => [homeData,error,status,code];
}