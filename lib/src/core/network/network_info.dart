abstract class NetworkInfo {
  Stream<bool> get isConnected;
  Future<bool> get isData;
  Future<bool> checkConnection();
}
