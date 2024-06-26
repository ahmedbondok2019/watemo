import '../../../../core/src/app_export.dart';

class OtherPageDataSource {
  final BaseDioHelper baseDioHelper;

  OtherPageDataSource(this.baseDioHelper);

  /// <<--- send Contact request --->>
  Future<Response> sendContact(
      {required String type, required String message}) async {
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.sendMessage,
        data: {
      "contact_message": message,
      "message_type": type,
    },
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<--- get About Us request --->>
  Future<Response> getAboutUs() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.about,
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<--- get Terms request --->>
  Future<Response> getTerms() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.terms,
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<--- get Privacy request --->>
  Future<Response> getPrivacy() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.privacy,
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }
}