import 'package:completed/features/services_details/cubit/service_details_cubit.dart';

import '../../features/checkout/cubit/checkout_cubit.dart';
import '../../features/profile/cubit/profile_cubit.dart';
import 'app_export.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(393, 985),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LocalizationBloc>(
                  create: (context) => getIt<LocalizationBloc>()),
              BlocProvider(create: (context) => InternetCubit()),
              BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
              BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
              BlocProvider<ServiceDetailsCubit>(create: (context) => getIt<ServiceDetailsCubit>()),
              BlocProvider<CheckoutCubit>(create: (context) => getIt<CheckoutCubit>()),
            ],
            child: BlocBuilder<LocalizationBloc, LocalizationState>(
              buildWhen: (previous, current) => previous != current,
              builder: (_, localeState) {
                return MaterialApp(
                  localizationsDelegates: const [
                    AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalization.supportedLocales,
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null &&
                          deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  locale: getIt<SharedPreferences>().getString("locale") == null
                      ? localeState.locale
                      : Locale(getIt<SharedPreferences>().getString("locale")!),
                  title: 'Atamuu',
                  restorationScopeId: 'app',
                  debugShowCheckedModeBanner: false,
                  theme: AppThemes.lightTheme,
                  initialRoute:
                  getIt<SharedPreferences>().getString(
                      AppConstants.token) != null
                      ? AppRoutes.mainLayer
                      : AppRoutes.initScreen,
                  onGenerateRoute: AppRouter.generateRoutes,
                );
              },
            ),
          ),
        );
      },
    );
  }
}