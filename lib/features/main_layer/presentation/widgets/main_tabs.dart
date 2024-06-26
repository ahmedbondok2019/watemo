import '../../../../core/common/general_cubit/user/user_cubit.dart';
import '../../../../core/src/app_export.dart';
import '../../../orders/cubit/orders_cubit.dart';
import '../../../orders/presentation/screen/orders_screen.dart';
import '../../../wallet/cubit/wallet_cubit.dart';
import '../../../wallet/presentation/screen/wallet_screen.dart';

class MainTabs extends StatelessWidget {
  final int index;

  const MainTabs({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return _widgetMainTab();
  }

  Widget _widgetMainTab() {
    if (AppConstants.userType == AppConstants.user ||
        AppConstants.userType == AppConstants.company) {
      return index == 0
          ? MultiBlocProvider(providers: [
              BlocProvider<HomeCubit>(
                  create: (context) => getIt<HomeCubit>()..getHomeData()),
              BlocProvider<UserCubit>(
                  create: (context) => getIt<UserCubit>()..getUser()),
            ], child: HomeScreen())
          : index == 1
              ? MultiBlocProvider(providers: [
                  BlocProvider<UserCubit>(
                      create: (context) => getIt<UserCubit>()..getUser()),
                  BlocProvider<OrdersCubit>(
                      create: (context) => getIt<OrdersCubit>()..getOrders()),
                ], child: OrdersScreen())
              : index == 2
                  ? MultiBlocProvider(providers: [
                      BlocProvider<UserCubit>(
                          create: (context) => getIt<UserCubit>()..getUser()),
                      BlocProvider<WalletCubit>(
                          create: (context) =>
                              getIt<WalletCubit>()..getWallet()),
                    ], child: WalletScreen(isHome: true))
                  : MultiBlocProvider(providers: [
                      BlocProvider<UserCubit>(
                          create: (context) => getIt<UserCubit>()..getUser()),
                    ], child: MoreScreen());
    }
    else {
      return index == 0
          ? MultiBlocProvider(providers: [
              BlocProvider<UserCubit>(
                  create: (context) => getIt<UserCubit>()..getUser()),
              BlocProvider<HomeCubit>(
                  create: (context) => getIt<HomeCubit>()..getHomeVendorData()),
              BlocProvider<OrdersCubit>(
                  create: (context) =>
                      getIt<OrdersCubit>()..getAllOrdersVendor()),
            ], child: HomeScreen())
          : index == 1
              ? MultiBlocProvider(providers: [
                  BlocProvider<UserCubit>(
                      create: (context) => getIt<UserCubit>()..getUser()),
                  BlocProvider<OrdersCubit>(
                      create: (context) =>
                          getIt<OrdersCubit>()..getAllOrdersVendor()),
                ], child: OrdersScreen())
              : index == 2
                  ? MultiBlocProvider(providers: [
                      BlocProvider<UserCubit>(
                          create: (context) => getIt<UserCubit>()..getUser()),
                      BlocProvider<WalletCubit>(
                          create: (context) =>
                              getIt<WalletCubit>()..getWallet()),
                    ], child: WalletScreen(isHome: true))
                  : MultiBlocProvider(providers: [
                      BlocProvider<UserCubit>(
                          create: (context) => getIt<UserCubit>()..getUser()),
                    ], child: MoreScreen());
    }
  }
}
