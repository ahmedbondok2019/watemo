import '../../../../core/src/app_export.dart';

class HadithDataSource {
  final BaseDioHelper baseDioHelper;

  HadithDataSource(this.baseDioHelper);

  Future<Response> getAllHadith() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.hadeeth,
      token: getIt<SharedPreferences>().getString(AppConstants.token),
    );
    return response;
  }
}