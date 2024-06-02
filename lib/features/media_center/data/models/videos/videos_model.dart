import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'videos_model.g.dart';

@JsonSerializable()
class VideosModel extends Equatable {
  final int? id;
  final String? url;

  const VideosModel({
    this.id,
    this.url,
  });

  factory VideosModel.fromJson(Map<String, dynamic> json) => _$VideosModelFromJson(json);

  @override
  List<Object?> get props => [id, url];
}