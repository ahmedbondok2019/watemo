import 'dart:developer';
import '../../../../core/src/app_export.dart';
import '../models/register/register_req_model.dart';
import '../models/register_company/register_company_req_model.dart';
import '../models/register_vendor/register_vendor_req_model.dart';

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
    await baseDioHelper.post(endPoint:
    AppConstants.userType == AppConstants.user
        ? EndPoints.login
        : AppConstants.userType == AppConstants.vendor
           ? EndPoints.login
           : EndPoints.login ,
        data: {
      "phone": phone,
      "password": password,
      "country_code": countryCode,
    });
    return response;
  }

  /// <<--- social login request --->>
  Future<Response> socialLogin({
    required String name,
    required String email,
    required String phone,
  }) async {
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.socialCheck,
        data: {
      "name": name,
      "email": email,
      "phone": phone,
    });
    return response;
  }

  /// <<--- register request --->>
  Future<Response> register({required RegisterReqModel registerReqModel}) async {
    log("register =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(endPoint: EndPoints.register,
        data: registerReqModel.toJson()
    );
    return response;
  }

  /// <<--- register Company request --->>
  Future<Response> registerCompany({
    required RegisterCompanyReqModel registerReqModel}) async {
    log("register Company =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.registerCompany,
        data: registerReqModel.toJson()
    );
    return response;
  }

  /// <<--- register Vendor request --->>
  Future<Response> registerVendor({
    required RegisterVendorReqModel registerReqModel}) async {
    log("register Vendor =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.registerVendor,
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

  /// <<--- valid Code request --->>
  Future<Response> validCode({
    required String phone,
    required String code,
  }) async {
    final Response response =
    await baseDioHelper.post(endPoint: EndPoints.validCode,
        data: {
      "phone": phone,
      "code": code,
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

  /// <<--- get Countries request --->>
  Future<Response> getCountries() async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.countries,
    );
    return response;
  }

  /// <<--- get Cities request --->>
  Future<Response> getCities({required String countryId}) async {
    final Response response = await baseDioHelper.get(
      endPoint: EndPoints.cities + countryId,
    );
    return response;
  }

  /// <<--- get Spoken Languages request --->>
  Future<Response> getSpokenLanguages() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.spokenLanguages);
    return response;
  }
}