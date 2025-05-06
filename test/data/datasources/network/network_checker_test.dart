import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_astronomy_app/data/datasources/network/network_checker.dart';

import 'network_checker_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnectionChecker>()])
void main() {
  late MockInternetConnectionChecker internetConnection;
  late NetworkChecker networkChecker;

  setUp(() {
    internetConnection = MockInternetConnectionChecker();
    networkChecker = NetworkCheckerImpl(internetConnection: internetConnection);
  });

  test("Test internet connection", () async{
    when(networkChecker.isConnected).thenAnswer((_) async => true);
    final result = await networkChecker.isConnected;
    expect(result, true);
  });


  test("Test no internet connection", () async{
    when(networkChecker.isConnected).thenAnswer((_) async => false);
    final result = await networkChecker.isConnected;
    expect(result, false);
  });
}
