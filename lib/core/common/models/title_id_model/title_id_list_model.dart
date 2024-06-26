import 'package:json_annotation/json_annotation.dart';
part 'title_id_list_model.g.dart';

@JsonSerializable()
class TitleIdListModel {
  final int id;
  final String title;
  final String? code;
  final String? flag;

  TitleIdListModel({
    required this.id,
    required this.title,
    this.code,
    this.flag,
  });

  factory TitleIdListModel.fromJson(Map<String, dynamic> json) =>
      _$TitleIdListModelFromJson(json);
}