import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
part 'files_model.g.dart';

@JsonSerializable()
class FilesModel extends Equatable{
  final String? fileName;
  final String? fileType;

  const FilesModel({
    this.fileName,
    this.fileType,
  });

  factory FilesModel.fromJson(Map<String, dynamic> json) =>
      _$FilesFromJson(json);

  @override
  List<Object?> get props => [fileName,fileType];
}