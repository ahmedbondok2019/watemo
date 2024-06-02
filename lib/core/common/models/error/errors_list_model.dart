import 'package:json_annotation/json_annotation.dart';

part 'errors_list_model.g.dart';

@JsonSerializable()
class ErrorsListModel {
  final List<dynamic>? password;
  final List<dynamic>? phone;
  final List<dynamic>? email;
  final List<dynamic>? name;

  ErrorsListModel({
    this.password,
    this.phone,
    this.email,
    this.name,
  });

  factory ErrorsListModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorsListModelFromJson(json);
}
