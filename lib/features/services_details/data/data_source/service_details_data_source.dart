import '../../../../core/src/app_export.dart';

class ServiceDetailsDataSource {
  final BaseDioHelper baseDioHelper;

  ServiceDetailsDataSource(this.baseDioHelper);

  /// <<--- get Relations request --->>
  Future<Response> getRelations() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.relations,
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }
}
