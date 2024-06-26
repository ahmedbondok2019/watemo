import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'core/helpers/awesome_notifications_helper.dart';
import 'core/helpers/cache_helper.dart';
import 'core/services/notification_service.dart';
import 'core/src/app.dart';
import 'core/src/app_export.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initGetIt();
  await CacheHelper.init();
  Bloc.observer = AppBlocObserver();
  await NotificationService().init();
  await AwesomeNotificationsHelper().init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
      Platform.isIOS ? Brightness.light : Brightness.dark,
    ),
  );
  runApp(const MyApp());
}