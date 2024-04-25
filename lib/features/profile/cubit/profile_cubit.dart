import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import '../../../core/src/app_export.dart';
import '../../../core/utils/utils.dart';
import '../../auth/data/models/auth/auth_model.dart';
import '../../auth/data/models/edit_profile/edit_profile_req_model.dart';
import '../../auth/data/models/user/user_model.dart';
import '../data/repository/profile_repository.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _repository;
  ProfileCubit(
      this._repository,
      ) : super(ProfileInitial());

  var formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  File? myImage;
  String? imageProfileNet;
  int reasonIndex = 0;

  List<String> reasons = [
    "هل لديك حساب اخر بالفعل؟",
    "لم اعُد استخدم هذا الحساب مرة اخري",
    "اسباب امنيه",
    "اسباب اخري"
  ];

  static ProfileCubit get(context) => BlocProvider.of<ProfileCubit>(context);

  setGalleryImages(BuildContext context) async {
    emit(SelectGalleryImageLoading());
    var image = await Utils.getImage(false);
    myImage = File(image!.path);
    emit(SelectGalleryImageSuccess());
  }

  setCameraImages(BuildContext context) async {
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

  /// <<--- edit Profile request --->>
  Future editProfile() async {
    emit(ProfileLoading());
    final mimeType = lookupMimeType(myImage!.path);
    final image = await MultipartFile.fromFile(
      myImage!.path,
      filename: myImage!.path.split('/').last,
      contentType: MediaType(mimeType!.split('/').first,
          myImage!.path.split(".").last), //important
    );
    EditProfileReqModel editProfileReqModel = EditProfileReqModel(
        name: fullName.text.trim(),
        phone: phoneNumber.text.trim(),
        password: password.text.trim(),
        email: emailAddress.text.trim(),
      image: image
    );

    log("model =========>>>>>> ${editProfileReqModel.name}");
    log("model =========>>>>>> ${editProfileReqModel.phone}");
    log("model =========>>>>>> ${editProfileReqModel.password}");
    log("model =========>>>>>> ${editProfileReqModel.email}");
    final NetworkService<AuthModel> data =
    await _repository.editProfile(editProfileReqModel: editProfileReqModel);
    data.when(
      succeed: (responseData) {
        getIt<SharedPreferences>().setBool(
            AppConstants.isLoggedIn, responseData.status!);
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

  UserModel? user;

  /// <<--- get User --->>
  Future<void> getUser() async {
    emit(LoadUserDataLoading());
    user = UserModel.fromJson(json
        .decode(getIt<SharedPreferences>().getString(
        AppConstants.userData)!));
    fullName.text = user!.name ?? "";
    imageProfileNet = user!.image;
    phoneNumber.text = user!.phone ?? "";
    emailAddress.text = user!.email ?? "";
    password.text = user!.password ?? "";
    confirmPassword.text = user!.password ?? "";
    emit(LoadUserDataSuccess());
  }
}