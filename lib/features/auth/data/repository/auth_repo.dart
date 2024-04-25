import 'dart:developer';
import '../../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../../core/src/app_export.dart';
import '../models/auth/auth_model.dart';
import '../models/forget_password/forget_password_model.dart';
import '../models/register/register_req_model.dart';

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

  /// <<--- get Nationality request --->>
  Future<NetworkService<TitleIdModel>> getNationality() async {
    try {
      Response response = await _authDataSource.getNationality();
      TitleIdModel nationalityModel =
      TitleIdModel.fromJson(response.data);
      return NetworkService.succeed(nationalityModel);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- get Residence request --->>
  Future<NetworkService<TitleIdModel>> getResidence() async {
    try {
      Response response = await _authDataSource.getResidence();
      TitleIdModel residenceModel = TitleIdModel.fromJson(response.data);
      return NetworkService.succeed(residenceModel);
    } catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}
