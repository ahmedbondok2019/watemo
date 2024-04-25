import '../../../../core/src/app_export.dart';

class ServicesDataSource {
  final BaseDioHelper baseDioHelper;

  ServicesDataSource(this.baseDioHelper);

  /// <<--- get All Services request --->>
  Future<Response> getAllServices(String pageNumber) async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.services + pageNumber,
      token: getIt<SharedPreferences>().getString(AppConstants.token),
    );
    return response;
  }

  /// <<--- get Spoken Languages request --->>
  Future<Response> getSpokenLanguages() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.spokenLanguages,
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }
}