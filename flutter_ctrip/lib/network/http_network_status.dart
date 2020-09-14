import 'package:connectivity/connectivity.dart';

class HttpNetworkStatus {
  static Future<bool> isAvailableNetwork() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
