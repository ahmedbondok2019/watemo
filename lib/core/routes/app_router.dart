import 'package:completed/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:completed/features/other_page/presentation/screen/invitation_friend_screen.dart';
import 'package:completed/features/services/cubit/services_cubit.dart';
import 'package:completed/features/wallet/presentation/screen/wallet_screen.dart';
import '../../features/checkout/cubit/checkout_cubit.dart';
import '../../features/checkout/data/models/create_order/create_order_req_model.dart';
import '../../features/checkout/presentation/screen/checkout_screen.dart';
import '../../features/hadeeth/presentation/screen/hadith_screen.dart';
import '../../features/main_layer/presentation/screen/main_layer.dart';
import '../../features/orders/presentation/screen/orders_screen.dart';
import '../../features/profile/cubit/profile_cubit.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../../features/providers/cubit/providers_cubit.dart';
import '../../features/providers/presentation/screen/providers_screen.dart';
import '../../features/services/data/models/services/services_model.dart';
import '../../features/services/presentation/screen/services_screen.dart';
import '../../features/services_details/cubit/service_details_cubit.dart';
import '../../features/services_details/presentation/screen/service_details_screen.dart';
import '../../features/wallet/cubit/wallet_cubit.dart';
import '../../features/wallet/presentation/screen/add_wallet_screen.dart';
import '../../features/wallet/presentation/screen/all_wallet_screen.dart';
import '../src/app_export.dart';
part 'app_routes.dart';

class AppRouter {
  static Route? generateRoutes(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        return BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is ConnectedState) {
              switch (settings.name) {
                case AppRoutes.initScreen:
                  return const SplashScreen();
                case AppRoutes.onBoarding:
                  return BlocProvider(
                      create: (context) => getIt<OnBoardingCubit>(),
                      child: const OnBoarding());
                case AppRoutes.mainLayer:
                  return const MainLayer();
                case AppRoutes.moreScreen:
                  return const MoreScreen();
                case AppRoutes.termConditions:
                  return BlocProvider(
                      create: (context) => getIt<OtherPageCubit>()..getTerms(),
                      child: const TermConditionsScreen());
                case AppRoutes.serviceDetails:
                  ServicesModel service = settings.arguments as ServicesModel;
                  return BlocProvider(
                      create: (context) => getIt<ServiceDetailsCubit>()
                        ..getRelations(),
                      child: ServiceDetailsScreen(
                        service: service));
                case AppRoutes.provider:
                  List arg = settings.arguments as List;
                  ServicesModel service = arg[0] as ServicesModel;
                  CreateOrderReqModel orderDetails = arg[1] as CreateOrderReqModel;
                  List<int> selectLang = arg[2] as List<int>;
                  String genderSelect = arg[3] as String;
                  int selectMethod = arg[4] as int;
                  return BlocProvider(
                      create: (context) => getIt<ProvidersCubit>()
                        ..getProviders(
                          serviceId: service.id.toString(),
                          selectMethod: selectMethod.toString(),
                          selectL: selectLang,
                          genderSelect: genderSelect,
                        ),
                      child: ProvidersScreen(
                        service: service,
                        selectLang: selectLang,
                        orderDetails: orderDetails,
                      ));
                case AppRoutes.selectLang:
                  bool isEdit = settings.arguments as bool;
                  return SelectLangScreen(isEdit: isEdit);
                case AppRoutes.invitationFriend:
                  return const InvitationFriendScreen();
                case AppRoutes.wallet:
                  return BlocProvider(
                      create: (context) => getIt<WalletCubit>()..getWallet(),
                      child: const WalletScreen());
                case AppRoutes.lastWallet:
                  return BlocProvider(
                      create: (context) =>
                          getIt<WalletCubit>()..getLastWallet(),
                      child: const AllWalletScreen());
                case AppRoutes.profile:
                  return BlocProvider(
                      create: (context) => getIt<ProfileCubit>()..getUser(),
                      child: const ProfileScreen());
                case AppRoutes.addWallet:
                  return BlocProvider(
                      create: (context) => getIt<WalletCubit>(),
                      child: const AddWalletScreen());
                case AppRoutes.contactUs:
                  return BlocProvider(
                      create: (context) => getIt<OtherPageCubit>(),
                      child: const ContactUsScreen());
                case AppRoutes.checkout:
                  List arg = settings.arguments as List;
                  ServicesModel service = arg[0];
                  CreateOrderReqModel order = arg[1];
                  return BlocProvider(
                      create: (context) => getIt<CheckoutCubit>(),
                      child: CheckoutScreen(
                          service: service,
                          order: order
                      ));
                case AppRoutes.aboutUs:
                  return BlocProvider(
                      create: (context) =>
                          getIt<OtherPageCubit>()..getAboutUs(),
                      child: const AboutUsScreen());
                case AppRoutes.notifications:
                  return BlocProvider(
                      create: (context) => getIt<NotificationsCubit>(),
                      child: const NotificationsScreen());
                case AppRoutes.orders:
                  return BlocProvider(
                      create: (context) => getIt<OrdersCubit>(),
                      child: const OrdersScreen());
                case AppRoutes.hadithScreen:
                  return const HadithScreen();
                case AppRoutes.servicesScreen:
                  return BlocProvider<ServicesCubit>(
                    create: (context) =>
                        getIt<ServicesCubit>()..getAllServices(),
                    child: const ServicesScreen(),
                  );
                case AppRoutes.authScreen:
                  return BlocProvider(
                    create: (context) =>
                        getIt<AuthCubit>()..getNationalityResidence(),
                    child: const AuthScreen(),
                  );
                case AppRoutes.selectUserType:
                  return BlocProvider(
                    create: (context) => getIt<AuthCubit>(),
                    child: const SelectUserTypeScreen(),
                  );
                case AppRoutes.forgotPassword:
                  return BlocProvider(
                    create: (context) => getIt<AuthCubit>(),
                    child: const ForgotPassword(),
                  );
                case AppRoutes.resetPassword:
                  return BlocProvider(
                    create: (context) => getIt<AuthCubit>(),
                    child: const ResetPassword(),
                  );
                case AppRoutes.otpScreen:
                  String phone = settings.arguments as String;
                  return BlocProvider(
                    create: (context) => getIt<AuthCubit>(),
                    child: OtpScreen(
                        phone: phone
                    ),
                  );
                default:
                  return NoRouteScreen(routeName: settings.name!);
              }
            } else if (state is NotConnectedState) {
              return const NoInternetScreen();
            } else {
              return const NoInternetScreen();
            }
          },
        );
      },
    );
  }
}
