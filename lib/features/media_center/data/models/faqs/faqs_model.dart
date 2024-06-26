import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'faqs_model.g.dart';

@JsonSerializable()
class FaqsModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;

  const FaqsModel({
    this.id,
    this.title,
    this.description,
  });

  factory FaqsModel.fromJson(Map<String, dynamic> json) => _$FaqsModelFromJson(json);

  @override
  List<Object?> get props => [id, title,description];
}