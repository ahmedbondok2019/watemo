import 'package:completed/features/wallet/data/models/transactions_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/src/app_export.dart';
part 'wallet_model.g.dart';

@JsonSerializable()
class WalletModel extends Equatable {
  final dynamic total;
  final List<TransactionsModel> transactions;

  const WalletModel({
    required this.total,
    required this.transactions,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  @override
  List<Object?> get props => [total, transactions];
}
