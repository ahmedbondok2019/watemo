import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
part 'transactions_model.g.dart';

@JsonSerializable()
class TransactionsModel extends Equatable{
  final int? id;
  final String? paymentMethod;
  final String? transRef;
  final String? date;
  final String? title;
  final String? description;
  final int? isPlus;
  final String? percentage;

  const TransactionsModel({
    required this.date,
    required this.isPlus,
    required this.id,
    required this.title,
    required this.description,
    required this.paymentMethod,
    required this.percentage,
    required this.transRef,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);

  @override
  List<Object?> get props => [id,date,title,description,isPlus,paymentMethod,percentage,transRef];
}