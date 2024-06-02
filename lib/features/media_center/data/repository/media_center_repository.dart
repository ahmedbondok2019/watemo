import '../../../../core/src/app_export.dart';
import '../data_source/media_center_data_source.dart';
import '../models/faqs/faqs_res_model.dart';
import '../models/hadith/hadith_res_model.dart';
import '../models/videos/videos_res_model.dart';

class MediaCenterRepository {
  final MediaCenterDataSource _dataSource;

  MediaCenterRepository(this._dataSource);

  /// <<<---- get All Hadith --->>>>
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

  /// <<<---- get All Videos --->>>>
  Future<NetworkService<VideosResModel>> getAllVideos() async {
    try {
      Response response = await _dataSource.getAllVideos();
      VideosResModel videosRes = VideosResModel.fromJson(response.data);
      return NetworkService.succeed(videosRes);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }

  /// <<<---- get All Faqs --->>>>
  Future<NetworkService<FaqsResModel>> getAllFaqs() async {
    try {
      Response response = await _dataSource.getAllFaqs();
      FaqsResModel faqsRes = FaqsResModel.fromJson(response.data);
      return NetworkService.succeed(faqsRes);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}