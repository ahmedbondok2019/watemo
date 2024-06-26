import '../../../../features/auth/data/models/user/user_model.dart';
import '../../../src/app_export.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserModel? user;

  Future<void> getUser() async {
    emit(LoadUserDataLoading());
    user = UserModel.fromJson(json
        .decode(getIt<SharedPreferences>().getString(
        AppConstants.userData)!));
    emit(LoadUserDataSuccess());
  }

  Future<void> clearUser() async {
    emit(ClearUserDataLoading());
    user = null;
    emit(ClearUserDataSuccess());
  }
}
