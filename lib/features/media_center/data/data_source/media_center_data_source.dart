import '../../../../core/src/app_export.dart';

class MediaCenterDataSource {
  final BaseDioHelper baseDioHelper;

  MediaCenterDataSource(this.baseDioHelper);

  /// <<<---- get All Hadith --->>>>
  Future<Response> getAllHadith() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.hadeeth,
      token: getIt<SharedPreferences>().getString(AppConstants.token),
    );
    return response;
  }

  /// <<<---- get All Videos --->>>>
  Future<Response> getAllVideos() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.videos,
      token: getIt<SharedPreferences>().getString(AppConstants.token),
    );
    return response;
  }

  /// <<<---- get All Faqs --->>>>
  Future<Response> getAllFaqs() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.faqs,
      token: getIt<SharedPreferences>().getString(AppConstants.token),
    );
    return response;
  }
}
