import '../../../../core/src/app_export.dart';
import '../data_source/hadith_data_source.dart';
import '../models/hadith_res_model.dart';

class HadithRepository {
  final HadithDataSource _dataSource;

  HadithRepository(this._dataSource);

  Future<NetworkService<HadithResModel>> getAllHadith() async {
    try {
      Response response = await _dataSource.getAllHadith();
      HadithResModel hadithResModel = HadithResModel.fromJson(response.data);
      return NetworkService.succeed(hadithResModel);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}
