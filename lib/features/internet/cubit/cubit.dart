import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/src/app_export.dart';

class InternetCubit extends Cubit<InternetState> {
  late StreamSubscription<ConnectivityResult> _subscription;

  InternetCubit() : super(InternetInitial()) {
    // Initialize the subscription in the constructor
    _subscription = Connectivity().onConnectivityChanged.listen(_handleConnectivityChange);

    // Check the initial connectivity state
    checkConnection();
  }

  void _handleConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
      connected();
    } else {
      notConnected();
    }
  }

  void checkConnection() {
    Connectivity().checkConnectivity().then(_handleConnectivityChange);
  }

  void connected() {
    emit(ConnectedState(message: "Connected"));
  }

  void notConnected() {
    emit(NotConnectedState(message: "Not Connected"));
  }

  @override
  Future<void> close() {
    // Cancel the subscription only if it's not null
    _subscription.cancel();
    return super.close();
  }
}
