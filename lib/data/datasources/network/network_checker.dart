import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
}

class NetworkCheckerImpl implements NetworkChecker {
  final InternetConnectionChecker internetConnection;

  NetworkCheckerImpl({required this.internetConnection});

  @override
  Future<bool> get isConnected async => internetConnection.hasConnection;
}
