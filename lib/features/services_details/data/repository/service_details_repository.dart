import '../../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../../core/src/app_export.dart';
import '../data_source/service_details_data_source.dart';

class ServiceDetailsRepository {
  final ServiceDetailsDataSource _dataSource;

  ServiceDetailsRepository(this._dataSource);

  /// <<--- get Relations request --->>
  Future<NetworkService<TitleIdModel>> getRelations() async {
    try {
      Response response = await _dataSource.getRelations();
      TitleIdModel relationsModel = TitleIdModel.fromJson(response.data);
      return NetworkService.succeed(relationsModel);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}