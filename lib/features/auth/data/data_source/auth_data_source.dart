import 'dart:developer';
import '../../../../core/src/app_export.dart';
import '../models/register/register_req_model.dart';

class AuthDataSource {
  final BaseDioHelper baseDioHelper;

  AuthDataSource(this.baseDioHelper);

  /// <<--- login request --->>
  Future<Response> login(
      {required String phone,
        required String password,
        required String countryCode,
      }) async {
    final Response response =
    await baseDioHelper.post(endPoint: EndPoints.login, data: {
      "phone": phone,
      "password": password,
      "country_code": countryCode,
    });
    return response;
  }

  /// <<--- register request --->>
  Future<Response> register({
    required RegisterReqModel registerReqModel
  }) async {
    log("register =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(endPoint: EndPoints.register,
        data: registerReqModel.toJson()
    );
    return response;
  }

  /// <<--- forget Password request --->>
  Future<Response> forgetPassword({required String phone}) async {
    final Response response =
    await baseDioHelper.post(endPoint: EndPoints.forgetPassword, data: {
      "phone": phone,
    });
    return response;
  }

  /// <<--- logout request --->>
  Future<Response> logout() async {
    final Response response =
    await baseDioHelper.post(endPoint: EndPoints.logOut,
        token:getIt<SharedPreferences>().getString(
      AppConstants.token));
    return response;
  }

  /// <<--- get Nationality request --->>
  Future<Response> getNationality() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.nationality,
    );
    return response;
  }

  /// <<--- get Residence request --->>
  Future<Response> getResidence() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.residence,
    );
    return response;
  }
}