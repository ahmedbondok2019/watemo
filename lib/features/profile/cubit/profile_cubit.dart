import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../core/src/app_export.dart';
import '../../../core/utils/utils.dart';
import '../../auth/data/models/auth/auth_model.dart';
import '../../auth/data/models/edit_profile/edit_profile_req_model.dart';
import '../../auth/data/models/user/user_model.dart';
import '../data/models/edit_company_profile/edit_company_profile_req_model.dart';
import '../data/models/edit_vendor_profile/edit_vendor_profile_req_model.dart';
import '../data/repository/profile_repository.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;
  final AuthRepo _authRepo;

  ProfileCubit(
    this._repository,
    this._authRepo,
  ) : super(ProfileInitial());

  UserModel? user;
  var formKey = GlobalKey<FormState>();
  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  File? myImage;
  String? imageProfileNet;
  int reasonIndex = 0;
  int? day;
  int? month;
  int? year;
  TitleIdListModel? country;
  TitleIdListModel? city;
  List<String> days = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
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
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  List<String> years = [];
  File? identityFace;
  String? imageIdentityFace;
  File? identityBack;
  String? imageIdentityBack;
  List<String> reasons = [
    "have_another_account",
    "no_use_account",
    "security_reasons",
    "other_reasons"
  ];

  /// <<--- get User --->>
  Future<void> getUser() async {
    emit(LoadUserDataLoading());
    user = UserModel.fromJson(json
        .decode(getIt<SharedPreferences>().getString(AppConstants.userData)!));
    if(AppConstants.userType == AppConstants.user){
      imageProfileNet = user!.image;
      fullName.text = user!.name ?? "";
      phoneNumber.text = user!.phone ?? "";
      emailAddress.text = user!.email ?? "";
      password.text = user!.password ?? "";
      confirmPassword.text = user!.password ?? "";
    }
    else if(AppConstants.userType == AppConstants.company){
      imageProfileNet = user!.image;
      companyNameController.text = user!.name ?? "";
      companyAddressController.text = user!.address ?? "";
      taxNumberController.text = user!.taxId ?? "";
      faxNumberController.text = user!.phone ?? "";
      emailAddress.text = user!.email ?? "";
      expectCountController.text = (user!.expectCount ?? "").toString();
      bankNumberController.text = user!.ibanNumber ?? "";
      password.text = user!.password ?? "";
      confirmPassword.text = user!.password ?? "";
      taxNoImageNet = user!.taxImage ?? "";
      commercialNoImageNet = user!.licenseImage ?? "";
    }
    else if(AppConstants.userType == AppConstants.vendor){
      fullName.text = user!.name ?? "";
      imageProfileNet = user!.image;
      imageIdentityFace = user!.identityFace;
      imageIdentityBack = user!.identityBack;
      phoneNumber.text = user!.phone ?? "";
      emailAddress.text = user!.email ?? "";
      password.text = user!.password ?? "";
      confirmPassword.text = user!.password ?? "";
      day = user!.day;
      month = user!.month;
      year = user!.year;
      if (AppConstants.userType == AppConstants.vendor) {
        gender = TitleIdListModel(
          title: user!.sex == 1 ? "ذكر" : "انثي",
          id: user!.sex!,
        );
      }

      if (user!.services != null && user!.services!.isNotEmpty) {
        selectedIdServices = user!.services!;
        List<String> ids = user!.services!.split(',');
        for (var id in ids) {
          selectServices.add(servicesType
              .singleWhere((element) => id == element.id.toString()));
        }

        selectedService = "";
        for (var element in selectServices) {
          selectedService += "${element.title},";
        }
      }

      int startVal = DateTime.now().year - 100;
      for (int y = startVal; y <= startVal + 100; y++) {
        years.add(y.toString());
      }
    }
    emit(LoadUserDataSuccess());
  }

  /// <<--- edit user Profile request --->>
  Future editProfile() async {
    emit(ProfileLoading());
    MultipartFile? image;
    if (myImage != null) {
      final mimeType = lookupMimeType(myImage!.path);
      image = await MultipartFile.fromFile(
        myImage!.path,
        filename: myImage!.path.split('/').last,
        contentType: MediaType(mimeType!.split('/').first,
            myImage!.path.split(".").last), //important
      );
    }
    EditProfileReqModel editUser = EditProfileReqModel(
        name: fullName.text.trim(),
        phone: phoneNumber.text.trim(),
        password: password.text.trim(),
        email: emailAddress.text.trim(),
        image: image);
    final NetworkService<AuthModel> data =
        await _repository.editUserProfile(editUser: editUser);
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>()
            .setBool(AppConstants.isLoggedIn, responseData.status!);
        getIt<SharedPreferences>()
            .setString(AppConstants.token, responseData.user!.token!);
        getIt<SharedPreferences>().setString(
            AppConstants.userData, json.encode(responseData.user?.toJson()));
        emit(ProfileSuccess());
      },
      failure: (error) {
        emit(ProfileFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- edit Company Profile request --->>
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController expectCountController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController faxNumberController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  File? taxNoImage;
  File? commercialNoImage;
  String? taxNoImageNet;
  String? commercialNoImageNet;

  /// request edit Company Profile
  Future editCompanyProfile() async {
    emit(ProfileLoading());
    MultipartFile? image;
    if (myImage != null) {
      final mimeType = lookupMimeType(myImage!.path);
      image = await MultipartFile.fromFile(
        myImage!.path,
        filename: myImage!.path.split('/').last,
        contentType: MediaType(mimeType!.split('/').first,
            myImage!.path.split(".").last), //important
      );
    }

    MultipartFile? imageTaxNo;
    if (taxNoImage != null) {
      final mimeTypeTaxNo = lookupMimeType(taxNoImage!.path);
      image = await MultipartFile.fromFile(
        taxNoImage!.path,
        filename: taxNoImage!.path.split('/').last,
        contentType: MediaType(mimeTypeTaxNo!.split('/').first,
            taxNoImage!.path.split(".").last), //important
      );
    }

    MultipartFile? imageCommercialNo;
    if (commercialNoImage != null) {
      final mimeTypeCommercialNo = lookupMimeType(commercialNoImage!.path);
      imageCommercialNo =await MultipartFile.fromFile(
        commercialNoImage!.path,
        filename: commercialNoImage!.path.split('/').last,
        contentType: MediaType(mimeTypeCommercialNo!.split('/').first,
            commercialNoImage!.path.split(".").last), //important
      );
    }

    EditCompanyProfileReqModel editCompany = EditCompanyProfileReqModel(
      name: companyNameController.text.trim(),
      phone: faxNumberController.text.trim(),
      password: password.text.trim(),
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
      image: image,
    );

    final NetworkService<AuthModel> data =
        await _repository.editCompanyProfile(editCompany: editCompany);
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>()
            .setBool(AppConstants.isLoggedIn, responseData.status!);
        getIt<SharedPreferences>()
            .setString(AppConstants.token, responseData.user!.token!);
        getIt<SharedPreferences>().setString(
            AppConstants.userData, json.encode(responseData.user?.toJson()));
        emit(ProfileSuccess());
      },
      failure: (error) {
        emit(ProfileFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- edit vendor Profile request --->>
  Future editVendorProfile() async {
    emit(ProfileLoading());
    final mimeType = lookupMimeType(myImage!.path);
    final image = await MultipartFile.fromFile(
      myImage!.path,
      filename: myImage!.path.split('/').last,
      contentType: MediaType(mimeType!.split('/').first,
          myImage!.path.split(".").last), //important
    );

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

    EditVendorProfileReqModel editVendor = EditVendorProfileReqModel(
        name: fullName.text.trim(),
        phone: phoneNumber.text.trim(),
        password: password.text.trim(),
        email: emailAddress.text.trim(),
        countryCode: countryCode!.code.toString(),
        country: country!.id.toString(),
        city: city!.id.toString(),
        image: image,
        identityFace: imageFace,
        identityBack: imageBack,
        sex: gender!.id.toString(),
        languages: selectedId,
        services: selectedIdServices,
        year: year.toString(),
        day: day.toString(),
        month: month.toString());
    final NetworkService<AuthModel> data =
        await _repository.editVendorProfile(editVendor: editVendor);
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>()
            .setBool(AppConstants.isLoggedIn, responseData.status!);
        getIt<SharedPreferences>()
            .setString(AppConstants.token, responseData.user!.token!);
        getIt<SharedPreferences>().setString(
            AppConstants.userData, json.encode(responseData.user?.toJson()));
        emit(ProfileSuccess());
      },
      failure: (error) {
        emit(ProfileFailure(networkExceptions: error));
      },
    );
  }

  /// <<--- remove account --->>
  Future removeAccount() async {
    emit(RemoveAccountLoading());
    final NetworkService<AuthModel> data =
        await _repository.removeAccount(reasonIndex.toString());
    data.when(
      succeed: (responseData) {
        emit(RemoveAccountSuccess());
      },
      failure: (error) {
        emit(RemoveAccountFailure(networkExceptions: error));
      },
    );
  }

  /// <<<-------- countries && cities -------------->>>
  late List<TitleIdListModel> _countriesList = [];
  TitleIdListModel? countryCode;
  void changeCountryCode(TitleIdListModel? val) {
    emit(ChangeCountryCodeLoading());
    countryCode = val;
    emit(ChangeCountryCodeSuccess(countryCode: val));
  }

  List<TitleIdListModel> get countriesList => _countriesList;
  TitleIdListModel? gender;
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
  late List<TitleIdListModel> _citiesList = [];
  List<TitleIdListModel> get citiesList => _citiesList;

  /// <<--- get Countries request --->>
  Future<void> getCountries() async {
    emit(GetCountriesLoading());
    final NetworkService<TitleIdModel> data = await _authRepo.getCountries();
    switch (data) {
      case Succeed<TitleIdModel>(data: TitleIdModel countries):
        emit(GetCountriesSuccess());
        _countriesList = countries.listData ?? [];

        /// SET country code
        for (var element in _countriesList) {
          if (element.code.toString() == user!.countryCode.toString()) {
            countryCode = element;
          }
        }
        if (user!.country != null) {
          country = _countriesList
              .singleWhere((element) => user!.country == element.id);
          getCities(countryId: user!.country.toString());
        }
      case Failure<TitleIdModel>(networkExceptions: NetworkExceptions error):
        emit(GetCountriesFailed(networkExceptions: error));
    }
  }

  /// <<--- get Cities request --->>
  Future<void> getCities({required String countryId}) async {
    emit(GetCitiesLoading());
    final NetworkService<TitleIdModel> data =
        await _authRepo.getCities(countryId: countryId);
    switch (data) {
      case Succeed<TitleIdModel>(data: TitleIdModel cities):
        emit(GetCitiesSuccess());
        _citiesList = cities.listData ?? [];
        if (user!.city != null) {
          city = _citiesList.singleWhere((element) => user!.city == element.id);
        }
      case Failure<TitleIdModel>(networkExceptions: NetworkExceptions error):
        emit(GetCitiesFailed(networkExceptions: error));
    }
  }

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

  void changeServices(TitleIdListModel? val) {
    emit(ChangeServicesLoading());
    if (selectServices.isEmpty) {
      selectServices.add(val!);
    } else {
      int index = selectServices.indexOf(val!);
      if (index == -1) {
        selectServices.add(val);
      } else {
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

  /// <<--- get spoken Languages request --->>
  List<TitleIdListModel> languages = [];
  List<TitleIdListModel> selectLang = [];
  TitleIdListModel? selectL;
  String selectedLang = "";
  String selectedId = "";

  /// <<<--- get Spoken Languages --->>>
  Future<void> getSpokenLanguages() async {
    emit(SpokenLanguagesLoading());
    final NetworkService<TitleIdModel> data =
        await _authRepo.getSpokenLanguages();
    switch (data) {
      case Succeed<TitleIdModel>(data: TitleIdModel data):
        emit(SpokenLanguagesSuccess());
        languages.addAll(data.listData ?? []);
        if (user!.languages != null && user!.languages!.isNotEmpty) {
          selectedId = user!.languages!;
          List<String> ids = user!.languages!.split(',');
          for (var id in ids) {
            selectLang.add(languages
                .singleWhere((element) => id == element.id.toString()));
          }
          selectedLang = "";
          for (var element in selectLang) {
            selectedLang += "${element.title},";
          }
        }
      case Failure<TitleIdModel>(networkExceptions: NetworkExceptions error):
        emit(SpokenLanguagesFailed(networkExceptions: error));
    }
  }

  void changeCountry(TitleIdListModel? val) {
    emit(ChangeCountryLoading());
    country = val;
    emit(ChangeCountrySuccess(country: val));
  }

  void changeGender(TitleIdListModel? val) {
    emit(ChangeGenderLoading());
    gender = val;
    emit(ChangeGenderSuccess(gender: val));
  }

  void changeLang(TitleIdListModel? val) {
    emit(ChangeLangLoading());
    if (selectLang.isEmpty) {
      selectLang.add(val!);
    } else {
      int index = selectLang.indexOf(val!);
      if (index == -1) {
        selectLang.add(val);
      } else {
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

  void changeCity(TitleIdListModel? val) {
    emit(ChangeCityLoading());
    city = val;
    emit(ChangeCitySuccess(city: val));
  }

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

  void changeYear(String? val) {
    emit(ChangeYearLoading());
    year = int.parse(val!);
    emit(ChangeYearSuccess(year: year));
  }

  void changeMonth(String? val) {
    emit(ChangeMonthLoading());
    month = int.parse(val!);
    emit(ChangeMonthSuccess(month: month));
  }

  void changeDay(String? val) {
    emit(ChangeDayLoading());
    day = int.parse(val!);
    emit(ChangeDaySuccess(day: day));
  }

  setGalleryImages() async {
    emit(SelectGalleryImageLoading());
    var image = await Utils.getImage(false);
    myImage = File(image!.path);
    emit(SelectGalleryImageSuccess());
  }

  setCameraImages() async {
    emit(SelectCameraImageLoading());
    var images = await Utils.getImage(true);
    myImage = File(images!.path);
    emit(SelectCameraImageSuccess());
  }

  changeReason(int index) async {
    emit(ChangeReasonLoading());
    reasonIndex = index;
    emit(ChangeReasonSuccess());
  }
}
