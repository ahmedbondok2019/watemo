import 'package:completed/features/auth/data/models/auth/auth_model.dart';
import 'package:completed/features/auth/data/models/forget_password/forget_password_model.dart';
import 'package:completed/features/auth/data/models/register/register_req_model.dart';
import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../core/src/app_export.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());
  bool isLogin = true;
  bool remember = false;
  bool visibility = true;
  bool isObscureText = true;
  bool isRemembered = false;
  bool isNameValid = true;
  bool isPhoneNumberValid = false;
  bool isEmailAddressValid = false;
  bool isPasswordValid = false;
  bool isReAddedPasswordValid = false;
  String? otpPhoneNumber;
  TitleIdListModel? nationality;
  TitleIdListModel? residence;
  var formKey = GlobalKey<FormState>();
  late List<TitleIdListModel> _nationalityList = [];
  List<TitleIdListModel> get nationalityList => _nationalityList;

  late List<TitleIdListModel> _residenceList = [];
  List<TitleIdListModel> get residenceList => _residenceList;

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  int secondsRemaining = 60;
  bool termsAndConditionCheckBoxValue = false;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController optController = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController otpController = TextEditingController();
  String? otp;
  String countryCode = "966";

  void switchRememberFunction() {
    emit(SwitchRememberLoading());
    remember = !remember;
    emit(SwitchRememberState(switchRemember: remember));
  }

  void changeStatusAuth() {
    emit(ChangeStatusAuthLoading());
    isLogin = !isLogin;
    emit(ChangeStatusAuth(isLogin: isLogin));
  }

  void changeNationality(TitleIdListModel? nat) {
    emit(ChangeNationalityLoading());
    nationality = nat;
    emit(ChangeNationality(nationality: nat));
  }

  void changeResidence(TitleIdListModel? res) {
    emit(ChangeNationalityLoading());
    residence = res;
    emit(ChangeResidence(residence: res));
  }

  void switchVisibilityFunction() {
    emit(SwitchRememberLoading());
    visibility = !visibility;
    emit(SwitchVisibility(visibility: visibility));
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      emit(TimerLoading());
      if (secondsRemaining > 0) {
        secondsRemaining--;
      } else {
        timer.cancel();
      }
      emit(TimerLoaded());
    });
  }

  void updateTermsAndConditionCheckBox(bool? newValue) {
    emit(TermsAndConditionUpdateLoading());
    termsAndConditionCheckBoxValue = newValue!;
    emit(TermsAndConditionUpdateState());
  }

  /// <<--- login request --->>
  Future login() async {
    emit(LoginLoading());
    final NetworkService<AuthModel> data = await _authRepo.login(
      phone: phoneNumberController.text.trim(),
      password: passwordController.text.trim(),
      countryCode: countryCode,
    );
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>()
            .setBool(AppConstants.isLoggedIn, responseData.status!);
        getIt<SharedPreferences>()
            .setString(AppConstants.token, responseData.user!.token!);
        getIt<SharedPreferences>().setString(
            AppConstants.userData, json.encode(responseData.user?.toJson()));
        emit(LoginSuccess());
      },
      failure: (error) {
        emit(LoginFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- register request --->>
  Future register() async {
    emit(RegisterLoading());
    RegisterReqModel registerReqModel = RegisterReqModel(
        name: fullName.text.trim(),
        phone: phoneNumberController.text.trim(),
        password: passwordController.text.trim(),
        email: emailAddress.text.trim(),
        countryCode: countryCode,
        residencePlace: residence!.id.toString(),
        nationality: nationality!.id.toString(),
    );
    final NetworkService<AuthModel> data =
        await _authRepo.register(registerReqModel: registerReqModel);
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>().setBool(
            AppConstants.isLoggedIn, responseData.status!);
        getIt<SharedPreferences>()
            .setString(AppConstants.token, responseData.user!.token!);
        getIt<SharedPreferences>().setString(
            AppConstants.userData, json.encode(responseData.user?.toJson()));
        emit(RegisterSuccess());
      },
      failure: (error) {
        emit(RegisterFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- forget Password request step 1 --->>
  Future forgetPassword() async {
    emit(ForgetPasswordLoading());
    final NetworkService<ForgetPasswordModel> data =
    await _authRepo.forgetPassword(
      phone: phoneNumberController.text.trim(),
    );
    data.when(
      succeed: (responseData) {
        otpPhoneNumber = phoneNumberController.text.isEmpty
            ? otpPhoneNumber ?? ""
            : phoneNumberController.text.trim();
        otp = responseData.date!.code;
        emit(ForgetPasswordSuccess(
          otpPhoneNumber: otpPhoneNumber,
          otp: otp,
        ));
      },
      failure: (error) {
        emit(ForgetPasswordFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- logout request --->>
  Future<void> logout() async {
    emit(LogoutLoading());
    final NetworkService<AuthModel> data = await _authRepo.logout();
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>().setBool(AppConstants.isLoggedIn, false);
        getIt<SharedPreferences>().remove(AppConstants.token);
        getIt<SharedPreferences>().clear();
        emit(LogoutSuccess(message: responseData.error ?? ""));
      },
      failure: (error) {
        emit(LogoutFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- get Nationality && Residence request --->>
  Future<void> getNationalityResidence() async {
    emit(NationalityResidenceLoading());
    try {
      await Future.wait([
        getNationality(),
        getResidence(),
      ]);
      emit(NationalityResidenceSuccess());
    } catch (error) {
      emit(NationalityResidenceFailure(
          networkExceptions: error as NetworkExceptions));
    }
  }

  /// <<--- get Nationality request --->>
  Future<void> getNationality() async {
    NetworkService<TitleIdModel> data = await _authRepo.getNationality();
    switch (data) {
      case Succeed<TitleIdModel>(
          data: TitleIdModel nationalityModel
      ):
        _nationalityList = nationalityModel.listData ?? [];
      case Failure<TitleIdModel>(
          networkExceptions: NetworkExceptions error
      ):throw error;
    }
  }

  /// <<--- get Residence request --->>
  Future<void> getResidence() async {
    NetworkService<TitleIdModel> data = await _authRepo.getResidence();
    switch (data) {
      case Succeed<TitleIdModel>(
          data: TitleIdModel residenceModel
      ):
        _residenceList = residenceModel.listData ?? [];

      case Failure<TitleIdModel>(
          networkExceptions: NetworkExceptions error
      ):
        throw error;
    }
  }
}