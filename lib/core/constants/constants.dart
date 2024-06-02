import '../helpers/cache_helper.dart';

class AppConstants{
  static String userType = CacheHelper.getData(key: appType) ?? "user";
  static const String googleKey = "AIzaSyAAOcn3r6DVavhuoPatQvNGg5kUuV1zAFo";

  // <<--- key SharedPreferences --->>
  static const String appType = 'app_type';
  static const String userData = '';
  static const String userName = "userName";
  static const String token = "token";
  static const String isLoggedIn = "isLoggedIn";
  static const String codeStatus = "public";
  static const String user = "user";
  static const String company = "company";
  static const String vendor = "vendor";
}
