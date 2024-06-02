import 'dart:developer';
import '../../../../core/src/app_export.dart';
import '../../../auth/data/models/auth/auth_model.dart';
import '../../../auth/data/models/edit_profile/edit_profile_req_model.dart';
import '../data_source/profile_data_source.dart';
import '../models/edit_company_profile/edit_company_profile_req_model.dart';
import '../models/edit_vendor_profile/edit_vendor_profile_req_model.dart';

class ProfileRepository {
  final ProfileDataSource _dataSource;

  ProfileRepository(this._dataSource);

  /// <<--- edit user Profile request --->>
  Future<NetworkService<AuthModel>> editUserProfile(
      {required EditProfileReqModel editUser}) async {
    try {
      Response? responseData =
      await _dataSource.editUserProfile(editUser: editUser);
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      authModel.user!.password = editUser.password;
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- edit Company Profile request --->>
  Future<NetworkService<AuthModel>> editCompanyProfile(
      {required EditCompanyProfileReqModel editCompany}) async {
    try {
      Response? responseData =
      await _dataSource.editCompanyProfile(editCompany: editCompany);
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      authModel.user!.password = editCompany.password;
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      return NetworkService.failure(NetworkExceptions.getDioException(error));
    }
  }

  /// <<--- edit vendor Profile request --->>
  Future<NetworkService<AuthModel>> editVendorProfile(
      {required EditVendorProfileReqModel editVendor}) async {
    try {
      Response? responseData =
      await _dataSource.editVendorProfile(editVendor: editVendor);
      AuthModel authModel = AuthModel.fromJson(responseData.data);
      authModel.user!.password = editVendor.password;
      return NetworkService.succeed(authModel);
    } on DioException catch (error) {
      log("first step =====>>>>>>>$error");
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