import 'dart:developer';
import 'dart:io';
import 'package:completed/features/auth/data/models/auth/auth_model.dart';
import 'package:completed/features/auth/data/models/forget_password/forget_password_model.dart';
import 'package:completed/features/auth/data/models/register/register_req_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import '../../../core/common/general_cubit/user/user_cubit.dart';
import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../core/src/app_export.dart';
import '../../../core/utils/utils.dart';
import '../data/models/register_company/register_company_req_model.dart';
import '../data/models/register_vendor/register_vendor_req_model.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());
  bool isLogin = true;
  bool remember = false;
  bool visibility = true;
  String? otpPhoneNumber;
  TitleIdListModel? gender;
  List<TitleIdListModel> selectLang = [];
  TitleIdListModel? selectL;
  String selectedLang = "";
  String selectedId = "";
  TitleIdListModel? country;
  TitleIdListModel? countryCode;
  TitleIdListModel? city;

  var formKey = GlobalKey<FormState>();
  List<TitleIdListModel> genders = [
    TitleIdListModel(
      title: "male",
      id: 1,
    ),
    TitleIdListModel(
      title: "female",
      id: 2,
    ),
  ];

  List<TitleIdListModel> servicesType = [
    TitleIdListModel(
      title: "hajj",
      id: 1,
    ),
    TitleIdListModel(
      title: "amra",
      id: 2,
    ),
  ];
  List<TitleIdListModel> selectServices = [];
  String selectedIdServices = "";
  String selectedService = "";
  TitleIdListModel? selectS;

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  int secondsRemaining = 60;
  bool termsAndConditionCheckBoxValue = false;
  String? otp;

  /// user
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController optController = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController otpController = TextEditingController();

  /// company
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController expectCountController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController faxNumberController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  File? taxNoImage;
  File? commercialNoImage;


  /// company
  TextEditingController vendorNameController = TextEditingController();
  File? identityFace;
  File? identityBack;
  File? imageVendor;
  String? day;
  String? month;
  String? year;


  List<String> days = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
  ];
  List<String> months = [
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
  ];
  List<String> years = [];

  setGalleryIdentityFaceImages() async {
    emit(SelectGalleryIdentityFaceImageLoading());
    var image = await Utils.getImage(false);
    identityFace = File(image!.path);
    emit(SelectGalleryIdentityFaceImageSuccess());
  }
  setCameraIdentityFaceImages() async {
    emit(SelectCameraIdentityFaceImageLoading());
    var images = await Utils.getImage(true);
    identityFace = File(images!.path);
    emit(SelectCameraIdentityFaceImageSuccess());
  }

  setGalleryIdentityBackImages() async {
    emit(SelectGalleryIdentityBackImageLoading());
    var image = await Utils.getImage(false);
    identityBack = File(image!.path);
    emit(SelectGalleryIdentityBackImageSuccess());
  }
  setCameraIdentityBackImages() async {
    emit(SelectCameraIdentityBackImageLoading());
    var images = await Utils.getImage(true);
    identityBack = File(images!.path);
    emit(SelectCameraIdentityBackImageSuccess());
  }

  setGalleryVendorImages() async {
    emit(SelectGalleryVendorImageLoading());
    var image = await Utils.getImage(false);
    imageVendor = File(image!.path);
    emit(SelectGalleryVendorImageSuccess());
  }
  setCameraVendorImages() async {
    emit(SelectCameraVendorImageLoading());
    var images = await Utils.getImage(true);
    imageVendor = File(images!.path);
    emit(SelectCameraVendorImageSuccess());
  }

  setGalleryTaxNoImages() async {
    emit(SelectGalleryTaxNoImageLoading());
    var image = await Utils.getImage(false);
    taxNoImage = File(image!.path);
    emit(SelectGalleryTaxNoImageSuccess());
  }
  setCameraTaxNoImages() async {
    emit(SelectCameraTaxNoImageLoading());
    var images = await Utils.getImage(true);
    taxNoImage = File(images!.path);
    emit(SelectCameraTaxNoImageSuccess());
  }

  setGalleryCommercialNoImages() async {
    emit(SelectGalleryCommercialNoImagesLoading());
    var image = await Utils.getImage(false);
    commercialNoImage = File(image!.path);
    emit(SelectGalleryCommercialNoImagesSuccess());
  }
  setCameraCommercialNoImages() async {
    emit(SelectCameraCommercialNoImagesLoading());
    var images = await Utils.getImage(true);
    commercialNoImage = File(images!.path);
    emit(SelectCameraCommercialNoImagesSuccess());
  }

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

  void changeCountry(TitleIdListModel? val) {
    emit(ChangeCountryLoading());
    country = val;
    emit(ChangeCountrySuccess(country: val));
  }

  void changeCountryCode(TitleIdListModel? val) {
    emit(ChangeCountryCodeLoading());
    countryCode = val;
    emit(ChangeCountryCodeSuccess(country: val));
  }

  void changeGender(TitleIdListModel? val) {
    emit(ChangeGenderLoading());
    gender = val;
    emit(ChangeGenderSuccess(gender: val));
  }

  void changeLang(TitleIdListModel? val) {
    emit(ChangeLangLoading());
    log("message changeLang ===========>> ${val!.title}");
    log("message changeLang ===========>> ${val.id}");
    if(selectLang.isEmpty){
      selectLang.add(val);
    }
    else{
     int index = selectLang.indexOf(val);
     if(index == -1){
       selectLang.add(val);
     }
     else{
       selectLang.removeAt(index);
     }
  }
    selectedLang = "";
    selectedId = "";
    for (var element in selectLang) {
      selectedLang += "${element.title}-";
      selectedId += "${element.id},";
    }
    emit(ChangeLangSuccess(lang: val));
  }

  void changeServices(TitleIdListModel? val) {
    emit(ChangeServicesLoading());
    log("message changeServices ===========>> ${val!.title}");
    log("message changeServices ===========>> ${val.id}");
    if(selectServices.isEmpty){
      selectServices.add(val);
    }
    else{
      int index = selectServices.indexOf(val);
      if(index == -1){
        selectServices.add(val);
      }
      else{
        selectServices.removeAt(index);
      }
    }
    selectedService = "";
    selectedIdServices = "";
    for (var element in selectServices) {
      selectedService += "${element.title}-";
      selectedIdServices += "${element.id},";
    }
    emit(ChangeServicesSuccess(service: val));
  }

  void changeCity(TitleIdListModel? val) {
    emit(ChangeCityLoading());
    city = val;
    emit(ChangeCitySuccess(city: val));
  }
  void changeYear(String? val) {
    emit(ChangeYearLoading());
    year = val;
    emit(ChangeYearSuccess(year: val));
  }
  void changeMonth(String? val) {
    emit(ChangeMonthLoading());
    month = val;
    emit(ChangeMonthSuccess(month: val));
  }
  void changeDay(String? val) {
    emit(ChangeDayLoading());
    day = val;
    emit(ChangeDaySuccess(day: val));
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
      countryCode: countryCode!.code.toString(),
    );
    data.when(
      succeed: (responseData) {
        emit(LoginSuccess(user: responseData.user));
      },
      failure: (error) {
        emit(LoginFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- register user request --->>
  Future registerUser() async {
    emit(RegisterUserLoading());
    RegisterReqModel registerReqModel = RegisterReqModel(
      name: fullName.text.trim(),
      phone: phoneNumberController.text.trim(),
      password: passwordController.text.trim(),
      email: emailAddress.text.trim(),
      countryCode: countryCode!.code.toString(),
      city: city!.id.toString(),
      country: country!.id.toString(),
    );
    final NetworkService<AuthModel> data =
        await _authRepo.register(registerReqModel: registerReqModel);
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>()
            .setBool(AppConstants.isLoggedIn, responseData.status!);
        getIt<SharedPreferences>()
            .setString(AppConstants.token, responseData.user!.token!);
        getIt<SharedPreferences>().setString(
            AppConstants.userData, json.encode(responseData.user?.toJson()));
        emit(RegisterUserSuccess());
      },
      failure: (error) {
        emit(RegisterUserFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- register company request --->>
  Future registerCompany() async {
    emit(RegisterCompanyLoading());
    final mimeTypeTaxNo = lookupMimeType(taxNoImage!.path);
    final imageTaxNo = await MultipartFile.fromFile(
      taxNoImage!.path,
      filename: taxNoImage!.path.split('/').last,
      contentType: MediaType(mimeTypeTaxNo!.split('/').first,
          taxNoImage!.path.split(".").last), //important
    );

    final mimeTypeCommercialNo = lookupMimeType(taxNoImage!.path);
    final imageCommercialNo = await MultipartFile.fromFile(
      commercialNoImage!.path,
      filename: commercialNoImage!.path.split('/').last,
      contentType: MediaType(mimeTypeCommercialNo!.split('/').first,
          commercialNoImage!.path.split(".").last), //important
    );
    RegisterCompanyReqModel registerReqModel = RegisterCompanyReqModel(
      name: companyNameController.text.trim(),
      phone: faxNumberController.text.trim(),
      password: passwordController.text.trim(),
      email: emailAddress.text.trim(),
      countryCode: countryCode!.code.toString(),
      country: country!.id.toString(),
      city: city!.id.toString(),
      taxId: taxNumberController.text.trim(),
      address: companyAddressController.text.trim(),
      expectCount: expectCountController.text.trim(),
      ibanNumber: bankNumberController.text.trim(),
      taxImage: imageTaxNo,
      licenseImage: imageCommercialNo,
      image: null,
    );
    final NetworkService<AuthModel> data =
        await _authRepo.registerCompany(registerReqModel: registerReqModel);
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>()
            .setBool(AppConstants.isLoggedIn, responseData.status!);
        getIt<SharedPreferences>()
            .setString(AppConstants.token, responseData.user!.token!);
        getIt<SharedPreferences>().setString(
            AppConstants.userData, json.encode(responseData.user?.toJson()));
        emit(RegisterCompanySuccess());
      },
      failure: (error) {
        emit(RegisterCompanyFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- register vendor request --->>
  Future registerVendor() async {
    emit(RegisterVendorLoading());

    final mimeTypeFace = lookupMimeType(identityFace!.path);
    final imageFace = await MultipartFile.fromFile(
      identityFace!.path,
      filename: identityFace!.path.split('/').last,
      contentType: MediaType(mimeTypeFace!.split('/').first,
          identityFace!.path.split(".").last), //important
    );

    final mimeTypeBack = lookupMimeType(identityBack!.path);
    final imageBack = await MultipartFile.fromFile(
      identityBack!.path,
      filename: identityBack!.path.split('/').last,
      contentType: MediaType(mimeTypeBack!.split('/').first,
          identityBack!.path.split(".").last), //important
    );

    final mimeTypeImageVendor = lookupMimeType(imageVendor!.path);
    final imageImageVendor = await MultipartFile.fromFile(
      imageVendor!.path,
      filename: imageVendor!.path.split('/').last,
      contentType: MediaType(mimeTypeImageVendor!.split('/').first,
          imageVendor!.path.split(".").last), //important
    );

    RegisterVendorReqModel registerReqModel = RegisterVendorReqModel(
        name: vendorNameController.text.trim(),
        phone: phoneNumberController.text.trim(),
        password: passwordController.text.trim(),
        email: emailAddress.text.trim(),
        countryCode: countryCode!.code.toString(),
        country: country!.id.toString(),
        city: city!.id.toString(),
        image: imageImageVendor,
        identityFace: imageFace,
        identityBack: imageBack,
        sex: gender!.id.toString(),
        languages: selectedId,
        services: selectedIdServices,
        year: year,
        day: day,
        month: month
    );
    final NetworkService<AuthModel> data =
        await _authRepo.registerVendor(registerReqModel: registerReqModel);
    data.when(
      succeed: (responseData) {
        emit(RegisterVendorSuccess(
          user: responseData.user
        ));
      },
      failure: (error) {
        emit(RegisterVendorFailure(networkExceptions: error));
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
        getIt<SharedPreferences>().remove(AppConstants.userData);
        getIt<SharedPreferences>().clear();
        getIt<UserCubit>().clearUser();
        emit(LogoutSuccess(message: responseData.error ?? ""));
      },
      failure: (error) {
        emit(LogoutFailure(networkExceptions: error));
      },
    );
  }

  /// <<<-------- countries && cities -------------->>>
  late List<TitleIdListModel> _countriesList = [];

  List<TitleIdListModel> get countriesList => _countriesList;

  late List<TitleIdListModel> _citiesList = [];

  List<TitleIdListModel> get citiesList => _citiesList;
  List<TitleIdListModel> languages = [];

  /// <<--- get Countries request --->>
  Future<void> getCountries() async {
    log("getCountries ======================>>>>>>>>>>>>333");
    emit(GetCountriesLoading());
    final NetworkService<TitleIdModel> data = await _authRepo.getCountries();
    switch (data) {
      case Succeed<TitleIdModel>(data: TitleIdModel countries):
        emit(GetCountriesSuccess());
        _countriesList = countries.listData ?? [];

        /// SET DEFault counry code
        for (var element in _countriesList) {
          if(element.code == "966"){
            countryCode = element;
          }
        }

        /// SET YEARS
        int startVal = DateTime.now().year - 100;
        for(int y = startVal;y <= startVal + 100;y++){
          years.add(y.toString());
        }
      case Failure<TitleIdModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(GetCountriesFailed(networkExceptions: error));
    }
  }

  /// <<--- get Cities request --->>
  Future<void> getCities({required String countryId}) async {
    log("getCities ======================>>>>>>>>>>>>333");
    emit(GetCitiesLoading());
    final NetworkService<TitleIdModel> data = await _authRepo.getCities(
        countryId: countryId);
    switch (data) {
      case Succeed<TitleIdModel>(data: TitleIdModel cities):
        emit(GetCitiesSuccess());
        _citiesList = cities.listData ?? [];
      case Failure<TitleIdModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(GetCitiesFailed(networkExceptions: error));
    }
  }

  /// <<--- get spoken Languages request --->>
  Future<void> getSpokenLanguages() async {
    log("getSpokenLanguages ======================>>>>>>>>>>>>333");
    emit(SpokenLanguagesLoading());
    final NetworkService<TitleIdModel> data = await _authRepo.getSpokenLanguages();
    switch (data) {
      case Succeed<TitleIdModel>(data: TitleIdModel data):
        emit(SpokenLanguagesSuccess());
        languages.addAll(data.listData ?? []);
      case Failure<TitleIdModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(SpokenLanguagesFailed(networkExceptions: error));
    }
  }

  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  GoogleSignInAuthentication? auth;
  Map? userData;

  /// <<--- google Login request --->>
  Future googleLogin() async {
    emit(GoogleLoginLoading());
    googleAccount = await googleSignIn.signIn();
    auth = await googleAccount!.authentication;
    final NetworkService<AuthModel> data =
    await _authRepo.socialLogin(
        name: googleAccount!.displayName ?? "",
        email: googleAccount!.email,
        phone: "",
    );
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>()
            .setBool(AppConstants.isLoggedIn, responseData.status!);
        getIt<SharedPreferences>()
            .setString(AppConstants.token, responseData.user!.token!);
        getIt<SharedPreferences>().setString(
            AppConstants.userData, json.encode(responseData.user?.toJson()));
        emit(GoogleLoginSuccess());
      },
      failure: (error) {
        emit(GoogleLoginFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- log Out Google --->>
  logOutGoogle() async {
    googleAccount = await googleSignIn.signOut();
  }

  /// <<---clear data --->>
  Future clearData() async {
    emit(ClearDataLoading());
    emailAddress.clear();
    fullName.clear();
    phoneNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    termsAndConditionCheckBoxValue = false;
    country = null;
    city = null;
    emit(ClearDataSuccess());
  }
}