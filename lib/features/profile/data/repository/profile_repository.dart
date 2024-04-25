import 'dart:developer';
import '../../../../core/src/app_export.dart';
import '../../../auth/data/models/auth/auth_model.dart';
import '../../../auth/data/models/edit_profile/edit_profile_req_model.dart';
import '../data_source/profile_data_source.dart';

class ProfileRepository {
  final ProfileDataSource _dataSource;

  ProfileRepository(this._dataSource);

  /// <<--- edit Profile request --->>
  Future<NetworkService<AuthModel>> editProfile(
      {required EditProfileReqModel editProfileReqModel}) async {
    try {
      Response? responseData =
      await _dataSource.editProfile(editProfileReqModel: editProfileReqModel);
      log("token =====>>>>>>>${responseData.data}");
      log("token =====>>>>>>>${responseData.statusCode}");
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      log("token =====>>>>>>>${authModel.user!.token}");
      log("name =====>>>>>>>${authModel.user!.name}");
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>${error}");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- remove Account request --->>
  Future<NetworkService<AuthModel>> removeAccount(String reason) async {
    try {
      Response? responseData = await _dataSource.removeAccount(reason);
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("error =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }
}