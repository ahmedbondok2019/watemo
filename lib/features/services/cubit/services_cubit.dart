import 'dart:developer';
import '../../../core/src/app_export.dart';
import '../data/models/services/services_model.dart';
import '../data/models/services/services_res_model.dart';
import '../data/models/speak_languages/speak_lang_list_model.dart';
import '../data/models/speak_languages/speak_lang_model.dart';
import '../data/repository/services_repository.dart';
part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository _repository;
  ServicesCubit(
      this._repository,
      ) : super(ServicesIdle());

  static ServicesCubit get(context) => BlocProvider.of<ServicesCubit>(context);
  bool gender = true;
  int selectMethod = 1;
  int pageNumber = 1;
  int paymentType = 0;
  List<int> selectLang = [];

  List<ServicesModel> servicesList = [];
  List<SpeakLangListModel> languages = [];

  void changeStatusGender() {
    emit(ChangeStatusGenderLoading());
    gender = !gender;
    emit(ChangeStatusGender(gender: gender));
  }

  void changeStatusLang(int lang) {
    emit(ChangeStatusLangLoading());
    selectLang.add(lang);
    emit(ChangeStatusLang(selectLang: selectLang));
  }

  void removeLang(int index) {
    emit(ChangeStatusLangLoading());
    selectLang.removeAt(index);
    emit(ChangeStatusLang(selectLang: selectLang));
  }

  void changeStatusMethod(int id) {
    emit(ChangeStatusMethodLoading());
    selectMethod = id;
    emit(ChangeStatusMethod(selectMethod: id));
  }

  void changePaymentType(int type) {
    emit(ChangePaymentTypeLoading());
    paymentType = type;
    emit(ChangePaymentType(paymentType: paymentType));
  }

  /// <<--- get All Services request --->>
  Future<void> getAllServices() async {
    log("getAllServices ======================>>>>>>>>>>>>333");
    emit(ServicesLoading());
    final NetworkService<ServicesResModel> data =
    await _repository.getAllServices(pageNumber.toString());
    switch (data) {
      case Succeed<ServicesResModel>(data: ServicesResModel data):
        servicesList.addAll(data.services);
        emit(ServicesSuccess());
      case Failure<ServicesResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(ServicesFailed(networkExceptions: error));
    }
  }

  /// <<--- get spoken Languages request --->>
  Future<void> getSpokenLanguages() async {
    log("getSpokenLanguages ======================>>>>>>>>>>>>333");
    emit(SpokenLanguagesLoading());
    final NetworkService<SpeakLangModel> data = await _repository.getSpokenLanguages();
    switch (data) {
      case Succeed<SpeakLangModel>(data: SpeakLangModel data):
        emit(SpokenLanguagesSuccess());
        languages.addAll(data.languages);
      case Failure<SpeakLangModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(SpokenLanguagesFailed(networkExceptions: error));
    }
  }
}
