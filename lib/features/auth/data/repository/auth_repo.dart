import 'dart:developer';
import '../../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../../core/src/app_export.dart';
import '../models/auth/auth_model.dart';
import '../models/forget_password/forget_password_model.dart';
import '../models/register/register_req_model.dart';
import '../models/register_company/register_company_req_model.dart';
import '../models/register_vendor/register_vendor_req_model.dart';

class AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepo(this._authDataSource);

  /// <<--- login request --->>
  Future<NetworkService<AuthModel>> login(
      {required String phone,
        required String password,
        required String countryCode,
      }) async {
    try {
      Response? responseData =
          await _authDataSource.login(
              phone: phone,
              password: password,
              countryCode: countryCode,
          );
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      authModel.user!.password = password;
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- social login request --->>
  Future<NetworkService<AuthModel>> socialLogin({
    required String name,
    required String email,
    required String phone,
    }) async {
    try {
      Response? responseData =
      await _authDataSource.socialLogin(
        name: name,
        email: email,
        phone: phone,
      );
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- register request --->>
  Future<NetworkService<AuthModel>> register(
      {required RegisterReqModel registerReqModel}) async {
    try {
      Response? responseData =
          await _authDataSource.register(registerReqModel: registerReqModel);
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      authModel.user!.password = registerReqModel.password;
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- register Company request --->>
  Future<NetworkService<AuthModel>> registerCompany(
      {required RegisterCompanyReqModel registerReqModel}) async {
    try {
      Response? responseData =
      await _authDataSource.registerCompany(
          registerReqModel: registerReqModel);
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      authModel.user!.password = registerReqModel.password;
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- register Vendor request --->>
  Future<NetworkService<AuthModel>> registerVendor(
      {required RegisterVendorReqModel registerReqModel}) async {
    try {
      Response? responseData =
      await _authDataSource.registerVendor(registerReqModel: registerReqModel);
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      authModel.user!.password = registerReqModel.password;
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("error =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- forget Password request --->>
  Future<NetworkService<ForgetPasswordModel>> forgetPassword(
      {required String phone}) async {
    try {
      Response? responseData =
          await _authDataSource.forgetPassword(phone: phone);
      ForgetPasswordModel authModel =
          ForgetPasswordModel.fromJson(responseData.data);
      log("otp =====>>>>>>>${authModel.date!.code}");
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- valid Code request --->>
  Future<NetworkService<ForgetPasswordModel>> validCode({
    required String phone,
    required String code}) async {
    try {
      Response? responseData =
      await _authDataSource.validCode(
          phone: phone,
          code: code,
      );
      ForgetPasswordModel authModel =
      ForgetPasswordModel.fromJson(responseData.data);
      log("otp =====>>>>>>>${authModel.date!.code}");
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- logout request --->>
  Future<NetworkService<AuthModel>> logout() async {
    try {
      Response responseData = await _authDataSource.logout();
      log("token =====>>>>>>>${responseData.data}");
      log("token =====>>>>>>>${responseData.statusCode}");
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      return NetworkService.succeed(authModel);
    } on DioException catch (e) {
      return NetworkService.failure(NetworkExceptions.getDioException(e));
    }
  }

  /// <<--- get Countries request --->>
  Future<NetworkService<TitleIdModel>> getCountries() async {
    try {
      Response response = await _authDataSource.getCountries();
      TitleIdModel countries = TitleIdModel.fromJson(response.data);
      return NetworkService.succeed(countries);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- get Cities request --->>
  Future<NetworkService<TitleIdModel>> getCities(
      {required String countryId}) async {
    try {
      Response response = await _authDataSource.getCities(countryId: countryId);
      TitleIdModel cities = TitleIdModel.fromJson(response.data);
      return NetworkService.succeed(cities);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- get Spoken Languages request --->>
  Future<NetworkService<TitleIdModel>> getSpokenLanguages() async {
    try {
      Response response = await _authDataSource.getSpokenLanguages();
      TitleIdModel lang = TitleIdModel.fromJson(response.data);
      return NetworkService.succeed(lang);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
