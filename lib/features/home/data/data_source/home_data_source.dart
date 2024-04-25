import '../../../../core/src/app_export.dart';

class HomeDataSource {
  final BaseDioHelper baseDioHelper;

  HomeDataSource(this.baseDioHelper);

  Future<Response> getHomeData() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.home,
      token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }
}