import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'contact_type_model.g.dart';

@JsonSerializable()
class ContactTypeModel extends Equatable {
  final int id;
  final String nameAr;
  final String nameEn;

  const ContactTypeModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  factory ContactTypeModel.fromJson(Map<String, dynamic> json) => _$ContactTypeModelFromJson(json);

  @override
  List<Object> get props => [id,nameAr,nameEn];
}