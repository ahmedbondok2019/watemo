import 'dart:developer';
import '../../../core/common/models/title_id_model/title_id_list_model.dart';
import '../../../core/common/models/title_id_model/title_id_model.dart';
import '../../../core/src/app_export.dart';
import '../data/repository/service_details_repository.dart';
part 'service_details_state.dart';

class ServiceDetailsCubit extends Cubit<ServiceDetailsState> {
  final ServiceDetailsRepository _repository;
  ServiceDetailsCubit(this._repository) : super(ServiceDetailsIdle());

  static ServiceDetailsCubit get(context) => BlocProvider.of<ServiceDetailsCubit>(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  String? selectDate;

  List<TitleIdListModel> relations = [];
  TitleIdListModel? relation;

  void changeRelations(TitleIdListModel? rel) {
    emit(ChangeRelationsLoading());
    relation = rel;
    emit(ChangeRelationsSuccess(relation: rel!));
  }

  void changeDate(String date) {
    emit(DateLoading());
    selectDate = date;
    emit(DateState(date: date));
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
}