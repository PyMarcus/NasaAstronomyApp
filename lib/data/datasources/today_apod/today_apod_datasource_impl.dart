import 'package:nasa_astronomy_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:nasa_astronomy_app/data/models/apod_model.dart';
import 'package:http/http.dart' as http;

class TodayApodDatasourceImpl implements TodayApodDatasource {
  final http.Client client;

  TodayApodDatasourceImpl({required this.client})

  @override
  Future<ApodModel> fetchTodayApod() {
    throw UnimplementedError();
  }
}
