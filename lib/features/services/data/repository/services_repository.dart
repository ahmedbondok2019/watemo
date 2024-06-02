import '../../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../../core/src/app_export.dart';
import '../data_source/services_data_source.dart';
import '../models/services/services_res_model.dart';
import '../models/speak_languages/speak_lang_model.dart';

class ServicesRepository {
  final ServicesDataSource _dataSource;

  ServicesRepository(this._dataSource);

  /// <<--- get All Services request --->>
  getAllServices({required String id,required String pageNumber}) async {
    try {
      Response response = await _dataSource.getAllServices(
          id: id, pageNumber: pageNumber);
      ServicesResModel services = ServicesResModel.fromJson(response.data);
      return NetworkService.succeed(services);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }

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

  /// <<--- get Spoken Languages request --->>
  Future<NetworkService<SpeakLangModel>> getSpokenLanguages() async {
    try {
      Response response = await _dataSource.getSpokenLanguages();
      SpeakLangModel nationalityModel = SpeakLangModel.fromJson(response.data);
      return NetworkService.succeed(nationalityModel);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}