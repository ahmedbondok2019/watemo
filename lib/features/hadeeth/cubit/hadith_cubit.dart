import 'dart:developer';
import '../../../core/src/app_export.dart';
import '../data/models/hadith_model.dart';
import '../data/models/hadith_res_model.dart';
import '../data/repository/hadith_repository.dart';
part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  final HadithRepository _hadithRepository;
  HadithCubit(
      this._hadithRepository,
      ) : super(HadithIdle());

  static HadithCubit get(context) => BlocProvider.of<HadithCubit>(context);

  List<HadithModel> hadithList = [];

  Future<void> getAllHadith() async {
    log("getAllServices ======================>>>>>>>>>>>>333");
    emit(HadithLoading());
    final NetworkService<HadithResModel> data =
    await _hadithRepository.getAllHadith();
    switch (data) {
      case Succeed<HadithResModel>(data: HadithResModel data):
        hadithList.addAll(data.hadith);
        emit(HadithSuccess());
      case Failure<HadithResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(HadithFailed(networkExceptions: error));
    }
  }
}