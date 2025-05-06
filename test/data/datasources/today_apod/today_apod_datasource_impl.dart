import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_astronomy_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:nasa_astronomy_app/data/datasources/today_apod/today_apod_datasource_impl.dart';

import '../../../fixture/fixture.dart';
import '../../../mocks/mocks.mocks.dart';
import '../../../test_values.dart';

void main() {
  late MockClient client;
  late TodayApodDatasource datasource;

  setUp(() {
    client = MockClient();
    datasource = TodayApodDatasourceImpl(client: client);
  });

  group("API consumes", () {
    test("Status == 200", () async {
      //scene
      when(client.get(any)).thenAnswer(
        (_) async => http.Response.bytes(
          utf8.encode(fixture("image_response.json")),
          200,
        ),
      );

      // action
      final result = datasource.fetchTodayApod();

      // expected
      expect(result, testApodModel);
    });

    test("Status != 200", () async {
       //scene
      when(client.get(any)).thenAnswer(
        (_) async => http.Response.bytes(
          utf8.encode(fixture("image_response.json")),
          500,
        ),
      );

      // expected
      expect(()=>datasource.fetchTodayApod(), throwsA(apiFailure));
    });
  });
}
