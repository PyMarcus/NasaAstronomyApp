import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/data/datasources/network/network_checker.dart';
import 'package:nasa_astronomy_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:nasa_astronomy_app/data/repositories/today_apod/today_apod_repository_impl.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';

import '../../../test_values.dart';
import 'today_apod_datasource_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TodayApodDatasource>(),
  MockSpec<NetworkChecker>(),
])
void main() {
  late MockTodayApodDatasource datasource;
  late MockNetworkChecker network;
  late TodayApodRepositoryImpl repository;

  setUp(() {
    datasource = MockTodayApodDatasource();
    network = MockNetworkChecker();
    repository = TodayApodRepositoryImpl(
      dataSource: datasource,
      network: network,
    );
  });

  group("Fetch Apod today", () {
    test("Should return an ApodModel", () async {
      // scenary
      when(network.isConnected).thenAnswer((_) async => true);
      when(datasource.fetchTodayApod()).thenAnswer((_) async => testApodModel);
      // action
      final result = await repository.fetchApodToday();
      // expected
      expect(result, Right<Failure, Apod>(testApodModel));
    });

    test("Should return a Failure", () async {
      // scenary
      when(network.isConnected).thenAnswer((_) async => true);
      when(datasource.fetchTodayApod()).thenThrow(apiFailure);
      // action
      final result = await repository.fetchApodToday();
      // expected
      expect(result, Left<Failure, Apod>(apiFailure));
    });

    test("Should return a NoConnection", () async {
      // scenary
      when(network.isConnected).thenAnswer((_) async => false);
      // action
      final result = await repository.fetchApodToday();
      verifyNever(datasource.fetchTodayApod());
      // expected
      expect(result, Left<Failure, Apod>(noConnectionFailure));
    });
  });
}
