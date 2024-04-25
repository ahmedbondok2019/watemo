import '../../../../core/src/app_export.dart';

class OffersDataSource {
  final BaseDioHelper baseDioHelper;

  OffersDataSource(this.baseDioHelper);

  Future<Response> getOffers() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.offers,
        token: getIt<SharedPreferences>().getString(AppConstants.token));
    return response;
  }
}
