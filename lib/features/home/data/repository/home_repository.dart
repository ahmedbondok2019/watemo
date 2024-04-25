import '../../../../core/src/app_export.dart';
import '../models/home_model.dart';

class HomeRepository {
  final HomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  Future<NetworkService<HomeModel>> getHomeData() async {
    try {
      Response response = await _homeDataSource.getHomeData();
      HomeModel homeData = HomeModel.fromJson(response.data);
      return NetworkService.succeed(homeData);
    } catch (error) {
      return NetworkService.failure(
          NetworkExceptions.getDioException(error));
    }
  }
}
