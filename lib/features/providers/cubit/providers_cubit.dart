import '../../../core/src/app_export.dart';
import '../data/models/providers/providers_model.dart';
import '../data/models/providers/providers_res_model.dart';
import '../data/repository/providers_repository.dart';
part 'providers_state.dart';

class ProvidersCubit extends Cubit<ProvidersState> {
  final ProvidersRepository _repository;

  ProvidersCubit(this._repository) : super(ProvidersInitial());

  static ProvidersCubit get(context) =>
      BlocProvider.of<ProvidersCubit>(context);
  int pageNumber = 1;
  String? selectDate;
  int? provider;

  List<ProvidersModel> providersList = [];

  void changeProvider(int id) {
    emit(ChangeProviderLoading());
    provider = id;
    emit(ChangeProviderSuccess(provider: id));
  }

  /// <<--- get Providers request --->>
  Future<void> getProviders(
      {required String serviceId,
      required String selectMethod,
      required List<int> selectL,
      required String genderSelect}) async {
    String lang = "";
    for (var element in selectL) {
      lang += "$element,";
    }
    emit(ProvidersLoading());
    final NetworkService<ProvidersResModel> data =
        await _repository.getProviders(
      gender: genderSelect,
      languages: lang,
      method: selectMethod,
      serviceId: serviceId,
    );
    switch (data) {
      case Succeed<ProvidersResModel>(data: ProvidersResModel data):
        providersList.addAll(data.providers);
        emit(ProvidersSuccess());
      case Failure<ProvidersResModel>(
          networkExceptions: NetworkExceptions error
        ):
        emit(ProvidersFailed(networkExceptions: error));
    }
  }
}
