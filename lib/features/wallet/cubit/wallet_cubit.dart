import '../../../core/src/app_export.dart';
import '../../checkout/data/models/checkout_order/checkout_model.dart';
import '../data/models/transactions_model.dart';
import '../data/models/wallet_res_model.dart';
import '../data/repository/wallet_repository.dart';
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepository _repository;
  WalletCubit(this._repository) : super(WalletIdle());

  static WalletCubit get(context) => BlocProvider.of<WalletCubit>(context);

  TextEditingController totalController = TextEditingController();
  List<TransactionsModel> transactionsList = [];
  List<TransactionsModel> lastTransactionsList = [];
  dynamic total = 0.0;
  int pageNumber = 1;
  String date = "";
  bool gender = true;
  int selectMethod = 1;
  int paymentType = 0;
  String? urlPayment;

  void changeStatusGender() {
    emit(ChangeStatusGenderLoading());
    gender = !gender;
    emit(ChangeStatusGender(gender: gender));
  }

  void changePaymentType(int type) {
    emit(ChangePaymentTypeLoading());
    paymentType = type;
    emit(ChangePaymentType(paymentType: paymentType));
  }

  /// <<--- get Wallet --->>
  Future<void> getWallet() async {
    emit(WalletLoading());
    final NetworkService<WalletResModel> data = await _repository.getWallet();
    switch (data) {
      case Succeed<WalletResModel>(data: WalletResModel data):
        total = data.wallet.total;
        transactionsList.addAll(data.wallet.transactions);
        emit(WalletSuccess());
      case Failure<WalletResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(WalletFailed(networkExceptions: error));
    }
  }

  /// <<--- get last wallet --->>
  Future<void> getLastWallet() async {
    emit(LastWalletLoading());
    final NetworkService<WalletResModel> data = await _repository.getLastWallet();
    switch (data) {
      case Succeed<WalletResModel>(data: WalletResModel data):
        total = data.wallet.total;
        lastTransactionsList.addAll(data.wallet.transactions);
        emit(LastWalletSuccess());
      case Failure<WalletResModel>(
          networkExceptions: NetworkExceptions error
      ):
        emit(LastWalletFailed(networkExceptions: error));
    }
  }

  /// <<--- add Amount To wallet --->>
  Future addAmountToWallet() async {
    emit(AddAmountToWalletLoading());
    String type =
    paymentType == 0
        ? "mada"
        : paymentType == 1
        ? "visa"
        : "wallet";
    final NetworkService<CheckoutModel> data =
    await _repository.addAmountToWallet(
        paymentMethod: type,
        amount: totalController.text.trim());
    data.when(
      succeed: (responseData) {
        urlPayment = responseData.checkout!.targetUrl;
        emit(AddAmountToWalletSuccess(message: responseData.error.toString()));
      },
      failure: (error) {
        emit(AddAmountToWalletFailure(networkExceptions: error));
      },
    );
  }
}