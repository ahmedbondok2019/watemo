import 'dart:developer';
import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../core/src/app_export.dart';
import '../data/models/services/services_model.dart';
import '../data/models/services/services_res_model.dart';
import '../data/models/speak_languages/speak_lang_list_model.dart';
import '../data/models/speak_languages/speak_lang_model.dart';
import '../data/repository/services_repository.dart';
part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepository _repository;
  ServicesCubit(this._repository) : super(ServicesIdle());

  static ServicesCubit get(context) =>
      BlocProvider.of<ServicesCubit>(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<TitleIdListModel> relations = [];
  List<SpeakLangListModel> languages = [];
  List<ServicesModel> servicesList = [];
  List<ServicesModel> selectServicesList = [];
  List<int> selectLang = [];
  TitleIdListModel? relation;
  int pageNumber = 1;
  int counter = 1;
  int paymentType = 0;
  String? selectDate;
  bool gender = true;

  void changeStatusGender() {
    emit(ChangeStatusGenderLoading());
    gender = !gender;
    emit(ChangeStatusGender(gender: gender));
  }

  void changeSelectService(List<ServicesModel> select) {
    emit(ChangeSelectServiceLoading());
    selectServicesList = [];
    selectServicesList.addAll(select);
    emit(ChangeSelectServiceSuccess(selectServicesList: selectServicesList));
  }

  void incrementCounter() {
    emit(IncrementCounterLoading());
    counter += 1;
    emit(CounterSuccess(counter: counter));
  }

  void decrementCounter() {
    emit(DecrementCounterLoading());
    if(counter > 1){
      counter -= 1;
    }
    emit(CounterSuccess(counter: counter));
  }

  void changeRelations(TitleIdListModel? rel) {
    emit(ChangeRelationsLoading());
    relation = rel;
    emit(ChangeRelationsSuccess(relation: rel!));
  }

  void changeDate(String date) {
    emit(DateLoading());
    selectDate = date;
    emit(DateSuccess(date: date));
  }

  /// <<--- get relations request --->>
  Future<void> getRelations() async {
    log("getRelations ======================>>>>>>>>>>>>333");
    emit(RelationsLoading());
    final NetworkService<TitleIdModel> data = await _repository.getRelations();
    switch (data) {
      case Succeed<TitleIdModel>(data: TitleIdModel data):
        emit(RelationsSuccess());
        relations.addAll(data.listData ?? []);
      case Failure<TitleIdModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(RelationsFailed(networkExceptions: error));
    }
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

  /// <<--- get spoken Languages request --->>
  Future<void> getSpokenLanguages() async {
    log("getSpokenLanguages ======================>>>>>>>>>>>>333");
    emit(SpokenLanguagesLoading());
    final NetworkService<SpeakLangModel> data =
    await _repository.getSpokenLanguages();
    switch (data) {
      case Succeed<SpeakLangModel>(data: SpeakLangModel data):
        emit(LanguagesSuccess());
        languages.addAll(data.languages);
      case Failure<SpeakLangModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(SpokenLanguagesFailed(networkExceptions: error));
    }
  }

  /// <<--- get All Services request --->>
  Future<void> getAllServices({required String id}) async {
    log("getAllServices ======================>>>>>>>>>>>>$id");
    emit(ServicesLoading());
    final NetworkService<ServicesResModel> data =
    await _repository.getAllServices(
        id: id,
        pageNumber: pageNumber.toString());
    switch (data) {
      case Succeed<ServicesResModel>(
          data: ServicesResModel data):
        servicesList.addAll(data.services);
        emit(ServicesSuccess());
      case Failure<ServicesResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(ServicesFailed(networkExceptions: error));
    }
  }

  /// <<---clear data --->>
  Future clearData() async {
    emit(ClearDataLoading());
    selectServicesList = [];
    selectLang = [];
    emit(ClearDataSuccess());
  }
}