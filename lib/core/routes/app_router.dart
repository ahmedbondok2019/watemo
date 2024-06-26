import 'package:completed/features/checkout/presentation/screen/payment_screen.dart';
import 'package:completed/features/media_center/presentation/screen/media_center_screen.dart';
import 'package:completed/features/on_boarding/cubit/on_boarding_cubit.dart';
import 'package:completed/features/orders/data/models/user_order/orders_model.dart';
import 'package:completed/features/orders/presentation/screen/order_all_videos_screen.dart';
import 'package:completed/features/orders/presentation/screen/order_step_screen.dart';
import 'package:completed/features/other_page/presentation/screen/invitation_friend_screen.dart';
import 'package:completed/features/services/cubit/services_cubit.dart';
import 'package:completed/features/wallet/presentation/screen/wallet_screen.dart';
import '../../features/checkout/cubit/checkout_cubit.dart';
import '../../features/checkout/data/models/create_order/create_order_req_model.dart';
import '../../features/checkout/presentation/screen/checkout_screen.dart';
import '../../features/media_center/cubit/media_center_cubit.dart';
import '../../features/media_center/presentation/screen/faqs_screen.dart';
import '../../features/media_center/presentation/screen/hadith_screen.dart';
import '../../features/home/data/models/hajj_model.dart';
import '../../features/main_layer/presentation/screen/main_layer.dart';
import '../../features/media_center/presentation/screen/videos_screen.dart';
import '../../features/orders/cubit/orders_cubit.dart';
import '../../features/orders/presentation/screen/orders_screen.dart';
import '../../features/other_page/presentation/screen/privacy_screen.dart';
import '../../features/profile/cubit/profile_cubit.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../../features/services/data/models/services/services_model.dart';
import '../../features/services/presentation/screen/services_screen.dart';
import '../../features/services/presentation/screen/service_details_screen.dart';
import '../../features/tracking_order/presentation/screen/tracking_order_screen.dart';
import '../../features/wallet/cubit/wallet_cubit.dart';
import '../../features/wallet/presentation/screen/add_wallet_screen.dart';
import '../../features/wallet/presentation/screen/all_wallet_screen.dart';
import '../common/models/title_id_model/title_id_list_model.dart';
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
                case AppRoutes.homeScreen:
                  return MultiBlocProvider(providers: [
                    BlocProvider<HomeCubit>(
                        create: (context) => getIt<HomeCubit>()
                          ..getHomeVendorData()),
                    BlocProvider<OrdersCubit>(
                        create: (context) => getIt<OrdersCubit>()
                          ..getAllOrdersVendor()
                    ),
                  ],
                      child: HomeScreen());
                case AppRoutes.moreScreen:
                  return MoreScreen();
                case AppRoutes.orderAllVideos:
                  List args = settings.arguments as List;
                  List<String> videos = args[0] as List<String>;
                  List<String> titles = args[1] as List<String>;
                  return OrderAllVideosScreen(
                      videos: videos,
                    titles: titles,
                  );
                case AppRoutes.termConditions:
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<OtherPageCubit>(
                            create: (context) => getIt<OtherPageCubit>()..getTerms()),
                      ],
                      child: TermConditionsScreen());
                case AppRoutes.privacy:
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<OtherPageCubit>(
                            create: (context) => getIt<OtherPageCubit>()..getPrivacy()),
                      ],
                      child: PrivacyScreen());
                  case AppRoutes.serviceDetails:
                  List arg = settings.arguments as List;
                  HajjModel? hajj = arg[0] as HajjModel?;
                  TitleIdListModel titleId = arg[1] as TitleIdListModel;
                  ServicesModel? service = arg[2] as ServicesModel?;
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<ServicesCubit>(
                            create: (context) => getIt<ServicesCubit>()
                              ..getRelations()
                              ..getSpokenLanguages()
                              ..getAllServices(id: "3")
                        ),
                      ],
                      child: ServiceDetailsScreen(
                        hajj: hajj, titleId: titleId,
                          service: service));
                case AppRoutes.selectLang:
                  bool isEdit = settings.arguments as bool;
                  return SelectLangScreen(isEdit: isEdit);
                case AppRoutes.invitationFriend:
                  return InvitationFriendScreen();
                case AppRoutes.wallet:
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<WalletCubit>(
                            create: (context) => getIt<WalletCubit>()..getWallet()),
                      ],
                      child: WalletScreen(isHome: false));
                case AppRoutes.lastWallet:
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<WalletCubit>(
                            create: (context) => getIt<WalletCubit>()
                              ..getLastWallet()
                        ),
                      ],
                      child: AllWalletScreen());
                case AppRoutes.profile:
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<ProfileCubit>(
                            create: (context) => getIt<ProfileCubit>()
                              ..getUser()
                              ..getCountries()
                              ..getSpokenLanguages()
                        ),
                      ],
                      child: ProfileScreen());
                  case AppRoutes.addWallet:
                    return MultiBlocProvider(
                        providers: [
                          BlocProvider<WalletCubit>(
                              create: (context) => getIt<WalletCubit>()
                          ),
                        ],
                        child: AddWalletScreen());
                case AppRoutes.contactUs:
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<OtherPageCubit>(
                            create: (context) => getIt<OtherPageCubit>()),
                      ],
                      child: ContactUsScreen());
                case AppRoutes.checkout:
                  List arg = settings.arguments as List;
                  ServicesModel? service = arg[0] as ServicesModel?;
                  HajjModel? hajj = arg[1] as HajjModel?;
                  CreateOrderReqModel order = arg[2];
                  List<ServicesModel> selectServicesList = arg[3] as List<ServicesModel>;
                  return BlocProvider(
                      create: (context) => getIt<CheckoutCubit>(),
                      child: CheckoutScreen(
                          service: service,
                          order: order,
                        hajj: hajj,
                          selectServicesList: selectServicesList,
                      ));
                case AppRoutes.payment:
                  String? url = settings.arguments as String?;
                  return PaymentScreen(url: url ?? "");
                case AppRoutes.aboutUs:
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<OtherPageCubit>(
                            create: (context) =>
                            getIt<OtherPageCubit>()..getAboutUs()
                        ),
                      ],
                      child: AboutUsScreen());
                case AppRoutes.notifications:
                  return MultiBlocProvider(
                      providers: [
                        BlocProvider<NotificationsCubit>(
                            create: (context) =>
                            getIt<NotificationsCubit>()..getNotifications()
                        ),
                      ],
                      child: NotificationsScreen());
                case AppRoutes.orders:
                  return BlocProvider(
                      create: (context) => AppConstants.userType ==
                          AppConstants.user ||
                          AppConstants.userType == AppConstants.company
                          ? getIt<OrdersCubit>()
                          : getIt<OrdersCubit>()..getAllOrdersVendor(),
                      child: OrdersScreen());
                case AppRoutes.orderStep:
                  OrdersModel order = settings.arguments as OrdersModel;
                  return BlocProvider(
                      create: (context) =>
                      getIt<OrdersCubit>()..serviceStepsOrderVendor(
                          orderId: order.id.toString(),
                          serviceId: order.serviceTypeId.toString()
                      ),
                      child: OrderStepScreen(order: order));
                case AppRoutes.hadith:
                  return BlocProvider<MediaCenterCubit>(
                    create: (context) => getIt<MediaCenterCubit>()..getAllHadith(),
                    child: HadithScreen(),
                  );
                case AppRoutes.faqs:
                  return BlocProvider<MediaCenterCubit>(
                    create: (context) => getIt<MediaCenterCubit>()..getAllFaqs(),
                    child: FaqsScreen(),
                  );
                case AppRoutes.videos:
                  return BlocProvider<MediaCenterCubit>(
                    create: (context) => getIt<MediaCenterCubit>()..getAllVideos(),
                    child: VideosScreen(),
                  );
                case AppRoutes.trackingOrder:
                  String orderId = settings.arguments as String;
                  return TrackingOrderScreen(orderId: orderId);
                case AppRoutes.mediaCenter:
                  return MediaCenterScreen();
                case AppRoutes.servicesScreen:
                  TitleIdListModel titleId =
                  settings.arguments as TitleIdListModel;
                  return BlocProvider<ServicesCubit>(
                    create: (context) =>
                        getIt<ServicesCubit>()..getAllServices(
                            id: titleId.id.toString()),
                    child: ServicesScreen(titleId: titleId),
                  );
                case AppRoutes.authScreen:
                  return BlocProvider(
                    create: (context) =>
                        getIt<AuthCubit>()
                          ..getCountries()
                          ..getSpokenLanguages(),
                    child: const AuthScreen(),
                  );
                case AppRoutes.selectUserType:
                  return BlocProvider(
                    create: (context) => getIt<AuthCubit>(),
                    child: const SelectUserTypeScreen(),
                  );
                case AppRoutes.forgotPassword:
                  return BlocProvider(
                    create: (context) => getIt<AuthCubit>()..getCountries(),
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
