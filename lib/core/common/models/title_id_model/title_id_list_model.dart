import 'package:json_annotation/json_annotation.dart';
part 'title_id_list_model.g.dart';

@JsonSerializable()
class TitleIdListModel {
  final int? id;
  final String? title;

  TitleIdListModel({
    required this.id,
    required this.title,
  });

  factory TitleIdListModel.fromJson(Map<String, dynamic> json) =>
      _$TitleIdListModelFromJson(json);
}