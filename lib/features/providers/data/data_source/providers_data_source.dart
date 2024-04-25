import '../../../../core/src/app_export.dart';

class ProvidersDataSource {
  final BaseDioHelper baseDioHelper;

  ProvidersDataSource(this.baseDioHelper);

  /// <<--- get Providers request --->>
  Future<Response> getProviders(
      {required String gender,
        required String languages,
        required String method,
        required String serviceId}) async {
    final Response response = await baseDioHelper.get(
        endPoint: "${EndPoints.providers}$gender&languages=$languages&prove_method=$method&service_id=$serviceId",
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }
}