part 'services_model.g.dart';

class ServicesModel {
  final int? id;
  final String? title;
  final dynamic price;
  final String? image;
  int counter;

  ServicesModel({
    this.id,
    this.title,
    this.price,
    this.image,
    this.counter = 0,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => _$ServicesModelFromJson(json);
}