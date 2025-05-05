import 'package:nasa_astronomy_app/data/models/apod_model.dart';

abstract class TodayApodDatasource {
  /// return an [Apodmodel] data class in a success case.
  Future<ApodModel> fetchTodayApod();
}
