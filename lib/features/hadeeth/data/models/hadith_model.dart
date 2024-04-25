import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hadith_model.g.dart';

@JsonSerializable()
class HadithModel extends Equatable {
  final int? id;
  final String? hadith;

  const HadithModel({
    this.id,
    this.hadith,
  });

  factory HadithModel.fromJson(Map<String, dynamic> json) => _$HadithModelFromJson(json);

  @override
  List<Object?> get props => [id, hadith];
}