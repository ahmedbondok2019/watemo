import 'dart:developer';

import '../../../../core/src/app_export.dart';
import '../../../auth/data/models/edit_profile/edit_profile_req_model.dart';

class ProfileDataSource {
  final BaseDioHelper baseDioHelper;

  ProfileDataSource(this.baseDioHelper);

  /// <<--- edit Profile request --->>
  Future<Response> editProfile({
    required EditProfileReqModel editProfileReqModel
  }) async {
    log("editProfile =====>>>>>>>");
    final Response response =
    await baseDioHelper.post(
        endPoint: EndPoints.editUser,
        data: editProfileReqModel.toJson(),
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