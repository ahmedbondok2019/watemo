import 'package:completed/features/offers/presentation/screen/offers_screen.dart';
import 'package:completed/features/services/cubit/services_cubit.dart';
import '../../../../core/src/app_export.dart';
import '../../../more/cubit/more_cubit.dart';
import '../../../offers/cubit/offers_cubit.dart';
import '../../../orders/presentation/screen/orders_screen.dart';

class MainTabs extends StatelessWidget {
  final int index;
  const MainTabs({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? MultiBlocProvider(providers: [
          BlocProvider<HomeCubit>(
              create: (context) => getIt<HomeCubit>()
                ..getHomeData()
                ..getUser()),
          BlocProvider<ServicesCubit>(
              create: (context) => getIt<ServicesCubit>()
          ),
        ], child: const HomeScreen())
        : index == 1
          ? MultiBlocProvider(providers: [
          BlocProvider<HomeCubit>(
              create: (context) => getIt<HomeCubit>()..getUser()),
          BlocProvider<OrdersCubit>(
              create: (context) => getIt<OrdersCubit>()..getOrders()
          ),
        ], child: const OrdersScreen())
          : index == 2
            ? MultiBlocProvider(providers: [
          BlocProvider<HomeCubit>(
              create: (context) => getIt<HomeCubit>()..getUser()),
          BlocProvider<OffersCubit>(
              create: (context) => getIt<OffersCubit>()..getOffersData()),
        ], child: const OffersScreen())
            : MultiBlocProvider(
            providers: [
          BlocProvider<HomeCubit>(
              create: (context) => getIt<HomeCubit>()..getUser()),
          BlocProvider<MoreCubit>(
              create: (context) => getIt<MoreCubit>()),
        ],
            child: const MoreScreen());
  }
}