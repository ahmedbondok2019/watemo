import 'dart:developer';

import '../../../../core/src/app_export.dart';
import '../../../auth/data/models/edit_profile/edit_profile_req_model.dart';
import '../models/edit_company_profile/edit_company_profile_req_model.dart';
import '../models/edit_vendor_profile/edit_vendor_profile_req_model.dart';

class ProfileDataSource {
  final BaseDioHelper baseDioHelper;

  ProfileDataSource(this.baseDioHelper);

  /// <<--- edit User Profile request --->>
  Future<Response> editUserProfile({
    required EditProfileReqModel editUser
  }) async {
    log("edit User Profile =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.editUser,
        data: editUser.toJson(),
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<--- edit Company Profile request --->>
    Future<Response> editCompanyProfile({
    required EditCompanyProfileReqModel editCompany
  }) async {
    log("edit Company Profile =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.editCompany,
        data: editCompany.toJson(),
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<--- edit Vendor Profile request --->>
  Future<Response> editVendorProfile({
    required EditVendorProfileReqModel editVendor
  }) async {
    log("edit Vendor =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.editVendor,
        data: editVendor.toJson(),
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<--- remove Account request --->>
  Future<Response> removeAccount(String reason) async {
    log("removeAccount =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.deleteAccount,
        data: {
          "reason": reason
        },
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }
}