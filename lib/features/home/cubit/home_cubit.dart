import 'dart:developer';
import '../../../core/src/app_export.dart';
import '../../orders/data/models/user_order/orders_model.dart';
import '../../orders/data/models/vendor_order/vendor_orders_res_model.dart';
import '../data/models/hajj_model.dart';
import '../data/models/home_model.dart';
import '../data/models/slider_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepo;
  final OrdersRepository _ordersRepository;
  HomeCubit(this._homeRepo,this._ordersRepository) : super(HomeInitial());
  static HomeCubit get(BuildContext context) =>
      BlocProvider.of<HomeCubit>(context);

  List<OrdersModel> orders = [];
  int totalOrders = 0;
  int currentOrders = 0;
  int vendorTotalProfit = 0;
  List<SliderModel> sliderList = [];
  HajjModel? hajj;
  CarouselController controller = CarouselController();
  int currentIndex = 0;

  void onPageChanged(int index) {
    emit(OnPageChangedLoading());
    currentIndex = index;
    emit(OnPageChangedType(currentIndex: index));
  }

  /// <<<--- get Home user && company Data --->>>>
  Future<void> getHomeData() async {
    log("message ======================>>>>>>>>>>>>333");
    emit(HomeLoading());
    final NetworkService<HomeModel> data = await _homeRepo.getHomeData();
    switch (data) {
      case Succeed<HomeModel>(data: HomeModel data):
        emit(HomeSuccess());
        sliderList.addAll(data.homeData.slider);
        hajj = data.homeData.hajj;
      case Failure<HomeModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(HomeFailed(networkExceptions: error));
    }
  }

  /// <<<--- get Home Vendor Data --->>>>
  Future<void> getHomeVendorData() async {
    log("getHomeVendorData ======================>>>>>>>>>>>>333");
    emit(HomeLoading());
    final NetworkService<VendorOrdersResModel> data =
      await _homeRepo.getHomeVendorData();
    switch (data) {
      case Succeed<VendorOrdersResModel>(data: VendorOrdersResModel data):
        orders.clear();
        orders.addAll(data.homeOrdersData.orders);
        totalOrders = data.homeOrdersData.totalOrders;
        currentOrders = data.homeOrdersData.currentOrders;
        vendorTotalProfit = data.homeOrdersData.vendorTotalProfit;
        emit(HomeSuccess());
      case Failure<VendorOrdersResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(HomeFailed(networkExceptions: error));
    }
  }

  /// <<<--- ACCEPT Orders Vendor --->>>
  Future<void> acceptOrderVendor({required String orderId}) async {
    log("accept Order Vendor ======================>>>>>>>>>>>>$orderId");
    emit(AcceptHomeOrderVendorLoading(orderId: orderId));
    final NetworkService<dynamic> data =
    await _ordersRepository.acceptOrderVendor(orderId: orderId);
    switch (data) {
      case Succeed<void>():
        getHomeVendorData();
        emit(AcceptHomeOrderVendorSuccess());
      case Failure<void>(
          networkExceptions: NetworkExceptions error
      ):emit(AcceptHomeOrderVendorFailed(networkExceptions: error));
    }
  }

  /// <<<--- refuse Orders Vendor --->>>
  Future<void> refuseOrderVendor({required String orderId}) async {
    log("refuse Order Vendor ======================>>>>>>>>>>>>$orderId");
    emit(RefuseHomeOrderVendorLoading(orderId: orderId));
    final NetworkService<dynamic> data = await _ordersRepository.refuseOrderVendor(orderId: orderId);
    switch (data) {
      case Succeed<void>():
        getHomeVendorData();
        emit(RefuseHomeOrderVendorSuccess());
      case Failure<void>(
          networkExceptions: NetworkExceptions error
      ):
        emit(RefuseHomeOrderVendorFailed(
            networkExceptions: error));
    }
  }
}