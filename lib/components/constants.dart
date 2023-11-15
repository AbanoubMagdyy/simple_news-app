import 'package:connectivity_plus/connectivity_plus.dart';

bool isConnect = false;
Future<void> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    isConnect = true;
  } else {
    // Wait for a brief moment to allow the package to update its status
    await Future.delayed(const Duration(seconds: 2));
    connectivityResult = await Connectivity().checkConnectivity();
    isConnect =
        connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi;
  }
}