import 'dart:developer';
import '../../../core/src/app_export.dart';
import '../data/models/faqs/faqs_model.dart';
import '../data/models/faqs/faqs_res_model.dart';
import '../data/models/hadith/hadith_model.dart';
import '../data/models/hadith/hadith_res_model.dart';
import '../data/models/videos/videos_model.dart';
import '../data/models/videos/videos_res_model.dart';
import '../data/repository/media_center_repository.dart';
part 'media_center_state.dart';

class MediaCenterCubit extends Cubit<MediaCenterState> {
  final MediaCenterRepository _repository;
  MediaCenterCubit(
      this._repository,
      ) : super(MediaCenterInitial());

  static MediaCenterCubit get(context) => BlocProvider.of<MediaCenterCubit>(context);
  List<HadithModel> hadithList = [];
  List<VideosModel> videos = [];
  List<FaqsModel> faqs = [];

  /// <<<---- get All Hadith --->>>>
  Future<void> getAllHadith() async {
    log("getAllServices ======================>>>>>>>>>>>>333");
    emit(HadithLoading());
    final NetworkService<HadithResModel> data =
    await _repository.getAllHadith();
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

  /// <<<---- get All Videos --->>>>
  Future<void> getAllVideos() async {
    log("getAllVideos ======================>>>>>>>>>>>>333");
    emit(GetAllVideosLoading());
    final NetworkService<VideosResModel> data =
    await _repository.getAllVideos();
    switch (data) {
      case Succeed<VideosResModel>(data: VideosResModel data):
        videos.addAll(data.videos);
        emit(GetAllVideosSuccess());
      case Failure<VideosResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(GetAllVideosFailed(networkExceptions: error));
    }
  }

  /// <<<---- get All Faqs --->>>>
  Future<void> getAllFaqs() async {
    log("getAllFaqs ======================>>>>>>>>>>>>333");
    emit(GetAllFaqsLoading());
    final NetworkService<FaqsResModel> data =
    await _repository.getAllFaqs();
    switch (data) {
      case Succeed<FaqsResModel>(data: FaqsResModel data):
        faqs.addAll(data.faqs);
        emit(GetAllFaqsSuccess());
      case Failure<FaqsResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(GetAllFaqsFailed(networkExceptions: error));
    }
  }
}