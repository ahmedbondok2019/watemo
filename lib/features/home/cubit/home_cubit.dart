import 'dart:convert';
import 'dart:developer';
import '../../../core/src/app_export.dart';
import '../../auth/data/models/user/user_model.dart';
import '../../hadeeth/data/models/hadith_model.dart';
import '../../services/data/models/services/services_model.dart';
import '../data/models/home_model.dart';
import '../data/models/slider_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());
  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);

  List<SliderModel> sliderList = [];
  List<HadithModel> hadithList = [];
  List<ServicesModel> servicesList = [];

  Future<void> getHomeData() async {
    log("message ======================>>>>>>>>>>>>333");
    emit(HomeLoading());
    final NetworkService<HomeModel> data = await _homeRepo.getHomeData();
    switch (data) {
      case Succeed<HomeModel>(data: HomeModel data):
        emit(HomeSuccess());
        sliderList.addAll(data.homeData.slider);
        hadithList.addAll(data.homeData.hadith);
        servicesList.addAll(data.homeData.services);
      case Failure<HomeModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(HomeFailed(networkExceptions: error));
    }
  }

  UserModel? user;

  Future<void> getUser() async {
    emit(LoadUserDataLoading());
    user = UserModel.fromJson(json
        .decode(getIt<SharedPreferences>().getString(
        AppConstants.userData)!));
    emit(LoadUserDataSuccess());
  }
}