import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'about_content_model.g.dart';

@JsonSerializable()
class AboutContentModel extends Equatable {
  final String content;

  const AboutContentModel({
    required this.content,
  });

  factory AboutContentModel.fromJson(Map<String, dynamic> json) => _$AboutContentModelFromJson(json);

  @override
  List<Object> get props => [content];
}