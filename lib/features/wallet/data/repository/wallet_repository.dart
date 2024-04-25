import '../../../../core/src/app_export.dart';
import '../data_source/wallet_data_source.dart';
import '../models/wallet_res_model.dart';

class WalletRepository {
  final WalletDataSource _dataSource;

  WalletRepository(this._dataSource);

  /// <<--- get wallet --->>
  Future<NetworkService<WalletResModel>> getWallet() async {
    try {
      Response response = await _dataSource.getWallet();
      WalletResModel wallet = WalletResModel.fromJson(response.data);
      return NetworkService.succeed(wallet);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- get last wallet --->>
  Future<NetworkService<WalletResModel>> getLastWallet() async {
    try {
      Response response = await _dataSource.getLastWallet();
      WalletResModel wallet = WalletResModel.fromJson(response.data);
      return NetworkService.succeed(wallet);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}