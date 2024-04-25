import '../../../../core/src/app_export.dart';
import '../data_source/offers_data_source.dart';
import '../models/offers_res_model.dart';

class OffersRepository {
  final OffersDataSource _dataSource;

  OffersRepository(this._dataSource);

  Future<NetworkService<OffersResModel>> getOffers() async {
    try {
      Response response = await _dataSource.getOffers();
      OffersResModel offersResModel = OffersResModel.fromJson(response.data);
      return NetworkService.succeed(offersResModel);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}