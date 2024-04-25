import '../../features/checkout/cubit/checkout_cubit.dart';
import '../../features/checkout/data/data_source/checkout_data_source.dart';
import '../../features/checkout/data/repository/checkout_repository.dart';
import '../../features/hadeeth/cubit/hadith_cubit.dart';
import '../../features/hadeeth/data/data_source/hadith_data_source.dart';
import '../../features/hadeeth/data/repository/hadith_repository.dart';
import '../../features/offers/cubit/offers_cubit.dart';
import '../../features/offers/data/data_source/offers_data_source.dart';
import '../../features/offers/data/repository/offers_repository.dart';
import '../../features/on_boarding/cubit/on_boarding_cubit.dart';
import '../../features/other_page/data/data_source/other_page_data_source.dart';
import '../../features/profile/cubit/profile_cubit.dart';
import '../../features/profile/data/data_source/profile_data_source.dart';
import '../../features/profile/data/repository/profile_repository.dart';
import '../../features/providers/cubit/providers_cubit.dart';
import '../../features/providers/data/data_source/providers_data_source.dart';
import '../../features/providers/data/repository/providers_repository.dart';
import '../../features/services/cubit/services_cubit.dart';
import '../../features/services/data/data_source/services_data_source.dart';
import '../../features/services/data/repository/services_repository.dart';
import '../../features/services_details/cubit/service_details_cubit.dart';
import '../../features/services_details/data/data_source/service_details_data_source.dart';
import '../../features/services_details/data/repository/service_details_repository.dart';
import '../../features/wallet/cubit/wallet_cubit.dart';
import '../../features/wallet/data/data_source/wallet_data_source.dart';
import '../../features/wallet/data/repository/wallet_repository.dart';
import '../src/app_export.dart';

final getIt = GetIt.instance;
void initGetIt() {
  /// BLoC
  getIt.registerFactory<LocalizationBloc>(() => LocalizationBloc());
  getIt.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<OtherPageCubit>(() => OtherPageCubit(getIt()));
  getIt.registerFactory<NotificationsCubit>(() => NotificationsCubit(getIt()));
  getIt.registerFactory<OrdersCubit>(() => OrdersCubit(getIt()));
  getIt.registerFactory<OffersCubit>(() => OffersCubit(getIt()));
  getIt.registerFactory<HadithCubit>(() => HadithCubit(getIt()));
  getIt.registerFactory<ServicesCubit>(() => ServicesCubit(getIt()));
  getIt.registerFactory<WalletCubit>(() => WalletCubit(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
  getIt.registerFactory<ProvidersCubit>(() => ProvidersCubit(getIt()));
  getIt.registerFactory<CheckoutCubit>(() => CheckoutCubit(getIt()));
  getIt.registerFactory<ServiceDetailsCubit>(() => ServiceDetailsCubit(getIt()));

  /// Data Sources
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource(getIt()));
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource(getIt()));
  getIt.registerLazySingleton<OtherPageDataSource>(() => OtherPageDataSource(getIt()));
  getIt.registerLazySingleton<NotificationsDataSource>(() => NotificationsDataSource(getIt()));
  getIt.registerLazySingleton<OrdersDataSource>(() => OrdersDataSource(getIt()));
  getIt.registerLazySingleton<OffersDataSource>(() => OffersDataSource(getIt()));
  getIt.registerLazySingleton<HadithDataSource>(() => HadithDataSource(getIt()));
  getIt.registerLazySingleton<ServicesDataSource>(() => ServicesDataSource(getIt()));
  getIt.registerLazySingleton<WalletDataSource>(() => WalletDataSource(getIt()));
  getIt.registerLazySingleton<ProfileDataSource>(() => ProfileDataSource(getIt()));
  getIt.registerLazySingleton<CheckoutDataSource>(() => CheckoutDataSource(getIt()));
  getIt.registerLazySingleton<ProvidersDataSource>(() => ProvidersDataSource(getIt()));
  getIt.registerLazySingleton<ServiceDetailsDataSource>(() => ServiceDetailsDataSource(getIt()));

  /// Repository
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerLazySingleton<OtherPageRepository>(() => OtherPageRepository(getIt()));
  getIt.registerLazySingleton<NotificationsRepository>(() => NotificationsRepository(getIt()));
  getIt.registerLazySingleton<OrdersRepository>(() => OrdersRepository(getIt()));
  getIt.registerLazySingleton<OffersRepository>(() => OffersRepository(getIt()));
  getIt.registerLazySingleton<HadithRepository>(() => HadithRepository(getIt()));
  getIt.registerLazySingleton<ServicesRepository>(() => ServicesRepository(getIt()));
  getIt.registerLazySingleton<WalletRepository>(() => WalletRepository(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepository(getIt()));
  getIt.registerLazySingleton<CheckoutRepository>(() => CheckoutRepository(getIt()));
  getIt.registerLazySingleton<ProvidersRepository>(() => ProvidersRepository(getIt()));
  getIt.registerLazySingleton<ServiceDetailsRepository>(() => ServiceDetailsRepository(getIt()));

  /// Dio
  getIt.registerLazySingleton<BaseDioHelper>(() => DioHelper());

  /// SharedPreferences
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());

  /// Validator
  getIt.registerLazySingleton<AppValidator>(() => AppValidator());
}