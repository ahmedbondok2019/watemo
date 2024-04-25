import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
part 'transactions_model.g.dart';

@JsonSerializable()
class TransactionsModel extends Equatable{
  final int? id;
  final String? paymentMethod;
  final String? transRef;
  final String? date;
  final int? isPluse;
  final String? percentage;

  const TransactionsModel({
    required this.date,
    required this.isPluse,
    required this.id,
    required this.paymentMethod,
    required this.percentage,
    required this.transRef,
  });

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsModelFromJson(json);

  @override
  List<Object?> get props => [id,date,isPluse,paymentMethod,percentage,transRef];
}