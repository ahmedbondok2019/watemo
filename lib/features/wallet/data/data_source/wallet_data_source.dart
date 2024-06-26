import '../../../../core/src/app_export.dart';

class WalletDataSource {
  final BaseDioHelper baseDioHelper;

  WalletDataSource(this.baseDioHelper);

  /// <<--- get wallet --->>
  Future<Response> getWallet() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.getWallet,
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<--- get last wallet --->>
  Future<Response> getLastWallet() async {
    final Response response = await baseDioHelper.get(
        endPoint: EndPoints.getLastWallet,
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }

  /// <<--- add Amount To wallet --->>
  Future<Response> addAmountToWallet({
    required String paymentMethod,
    required String amount,
  }) async {
    final Response response = await baseDioHelper.post(
        endPoint: EndPoints.addBalance,
        data: {
          "payment_method": paymentMethod,
          "amount": amount,
        },
        token: getIt<SharedPreferences>().getString(AppConstants.token)
    );
    return response;
  }
}