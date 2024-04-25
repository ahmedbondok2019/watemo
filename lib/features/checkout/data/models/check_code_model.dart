import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'check_code_model.g.dart';

@JsonSerializable()
class CheckCodeModel extends Equatable {
  final int? id;
  final String? value;
  final String? type;
  final bool? oneUse;
  final String? maxValue;

  const CheckCodeModel({
    this.id,
    this.type,
    this.value,
    this.maxValue,
    this.oneUse,
  });

  factory CheckCodeModel.fromJson(Map<String, dynamic> json) => _$CheckCodeModelFromJson(json);

  @override
  List<Object?> get props => [id, type,value,maxValue,oneUse];
}