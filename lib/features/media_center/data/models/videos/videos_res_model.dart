import 'package:completed/features/media_center/data/models/videos/videos_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'videos_res_model.g.dart';

@JsonSerializable()
class VideosResModel {
  final List<VideosModel> videos;
  final String error;
  final bool status;
  final String code;

  VideosResModel({
    required this.videos,
    required this.status,
    required this.error,
    required this.code,
  });

  factory VideosResModel.fromJson(Map<String, dynamic> json) =>
      _$VideosResModelFromJson(json);
}