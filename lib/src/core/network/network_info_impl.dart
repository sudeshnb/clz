import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl({required this.connectivity});

  @override
  Future<bool> get isData async {
    final connectivityResult = await connectivity.checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  @override
  Stream<bool> get isConnected async* {
    await for (final status in connectivity.onConnectivityChanged) {
      if (status.contains(ConnectivityResult.none)) {
        yield false;
      } else {
        yield await _checkInternetAccess();
      }
    }
  }

  @override
  Future<bool> checkConnection() async {
    try {
      return await InternetConnection().hasInternetAccess;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<bool> _checkInternetAccess() async {
    try {
      await InternetConnection().hasInternetAccess;
      return true;
    } catch (_) {
      return false;
    }
  }
}
