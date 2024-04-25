import 'package:json_annotation/json_annotation.dart';
import 'title_id_list_model.dart';
part 'title_id_model.g.dart';

@JsonSerializable()
class TitleIdModel {
  final List<TitleIdListModel>? listData;
  final String? error;
  final bool? status;
  final String? code;

  TitleIdModel({
    this.listData,
    this.status,
    this.error,
    this.code,
  });

  factory TitleIdModel.fromJson(Map<String, dynamic> json) =>
      _$TitleIdModelFromJson(json);
}