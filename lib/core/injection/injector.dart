import 'package:completed/core/common/general_cubit/user/user_cubit.dart';
import 'package:completed/features/media_center/cubit/media_center_cubit.dart';
import '../../features/checkout/cubit/checkout_cubit.dart';
import '../../features/checkout/data/data_source/checkout_data_source.dart';
import '../../features/checkout/data/repository/checkout_repository.dart';
import '../../features/media_center/data/data_source/media_center_data_source.dart';
import '../../features/media_center/data/repository/media_center_repository.dart';
import '../../features/offers/cubit/offers_cubit.dart';
import '../../features/offers/data/data_source/offers_data_source.dart';
import '../../features/offers/data/repository/offers_repository.dart';
import '../../features/on_boarding/cubit/on_boarding_cubit.dart';
import '../../features/orders/cubit/orders_cubit.dart';
import '../../features/other_page/data/data_source/other_page_data_source.dart';
import '../../features/profile/cubit/profile_cubit.dart';
import '../../features/profile/data/data_source/profile_data_source.dart';
import '../../features/profile/data/repository/profile_repository.dart';
import '../../features/services/cubit/services_cubit.dart';
import '../../features/services/data/data_source/services_data_source.dart';
import '../../features/services/data/repository/services_repository.dart';
import '../../features/tracking_order/cubit/tracking_order_cubit.dart';
import '../../features/tracking_order/data/data_source/tracking_order_data_source.dart';
import '../../features/tracking_order/data/repository/tracking_order_repository.dart';
import '../../features/wallet/cubit/wallet_cubit.dart';
import '../../features/wallet/data/data_source/wallet_data_source.dart';
import '../../features/wallet/data/repository/wallet_repository.dart';
import '../common/general_cubit/calendar/calendar_cubit.dart';
import '../src/app_export.dart';

final getIt = GetIt.instance;
void initGetIt() {
  /// BLoC
  getIt.registerFactory<UserCubit>(() => UserCubit());
  getIt.registerFactory<LocalizationBloc>(() => LocalizationBloc());
  getIt.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt(),getIt()));
  getIt.registerFactory<OtherPageCubit>(() => OtherPageCubit(getIt()));
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt()));
  getIt.registerFactory<OrdersCubit>(() => OrdersCubit(getIt()));
  getIt.registerFactory<OffersCubit>(() => OffersCubit(getIt()));
  getIt.registerFactory<MediaCenterCubit>(() => MediaCenterCubit(getIt()));
  getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt()));
  getIt.registerFactory<WalletCubit>(() => WalletCubit(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt(),getIt()));
  getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit(getIt()));
  getIt.registerLazySingleton<CalendarCubit>(() => CalendarCubit());
  getIt.registerLazySingleton<TrackingOrderCubit>(() => TrackingOrderCubit(getIt()));

  /// Data Sources
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource(getIt()));
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource(getIt()));
  getIt.registerLazySingleton<OtherPageDataSource>(() => OtherPageDataSource(getIt()));
  getIt.registerLazySingleton<NotificationsDataSource>(() => NotificationsDataSource(getIt()));
  getIt.registerLazySingleton<OrdersDataSource>(() => OrdersDataSource(getIt()));
  getIt.registerLazySingleton<OffersDataSource>(() => OffersDataSource(getIt()));
  getIt.registerLazySingleton<MediaCenterDataSource>(() => MediaCenterDataSource(getIt()));
  getIt.registerLazySingleton<ServicesDataSource>(() => ServicesDataSource(getIt()));
  getIt.registerLazySingleton<WalletDataSource>(() => WalletDataSource(getIt()));
  getIt.registerLazySingleton<ProfileDataSource>(() => ProfileDataSource(getIt()));
  getIt.registerLazySingleton<CheckoutDataSource>(() => CheckoutDataSource(getIt()));
  getIt.registerLazySingleton<TrackingOrderDataSource>(() => TrackingOrderDataSource(getIt()));

  /// Repository
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerLazySingleton<OtherPageRepository>(() => OtherPageRepository(getIt()));
  getIt.registerLazySingleton<NotificationsRepository>(() => NotificationsRepository(getIt()));
  getIt.registerLazySingleton<OrdersRepository>(() => OrdersRepository(getIt()));
  getIt.registerLazySingleton<OffersRepository>(() => OffersRepository(getIt()));
  getIt.registerLazySingleton<MediaCenterRepository>(() => MediaCenterRepository(getIt()));
  getIt.registerLazySingleton<ServicesRepository>(() => ServicesRepository(getIt()));
  getIt.registerLazySingleton<WalletRepository>(() => WalletRepository(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(getIt()));
  getIt.registerLazySingleton<CheckoutRepository>(() => CheckoutRepository(getIt()));
  getIt.registerLazySingleton<TrackingOrderRepository>(() => TrackingOrderRepository(getIt()));

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());

  /// SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  /// Validator
  getIt.registerLazySingleton<AppValidator>(() => AppValidator());
}