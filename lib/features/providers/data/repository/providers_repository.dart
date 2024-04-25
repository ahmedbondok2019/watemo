import '../../../../core/src/app_export.dart';
import '../data_source/providers_data_source.dart';
import '../models/providers/providers_res_model.dart';

class ProvidersRepository {
  final ProvidersDataSource _dataSource;

  ProvidersRepository(this._dataSource);

  /// <<--- get Providers request --->>
  Future<NetworkService<ProvidersResModel>> getProviders(
      {required String gender,
      required String languages,
      required String method,
      required String serviceId}) async {
    try {
      Response response = await _dataSource.getProviders(
        gender: gender,
        languages: languages,
        method: method,
        serviceId: serviceId,
      );
      ProvidersResModel providers = ProvidersResModel.fromJson(response.data);
      return NetworkService.succeed(providers);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
