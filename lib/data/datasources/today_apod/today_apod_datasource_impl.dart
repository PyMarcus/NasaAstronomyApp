import 'dart:convert';

import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:nasa_astronomy_app/data/models/apod_model.dart';
import 'package:http/http.dart' as http;

class TodayApodDatasourceImpl implements TodayApodDatasource {
  final http.Client client;

  TodayApodDatasourceImpl({required this.client});

  @override
  Future<ApodModel> fetchTodayApod() async {
    http.Response response;

    try {
      response = await client.get(Uri.parse("url"));
    } catch (e) {
      throw ApiFailure();
    }

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      return ApodModel.fromJson(jsonResponse);
    }
    throw ApiFailure();
  }
}
