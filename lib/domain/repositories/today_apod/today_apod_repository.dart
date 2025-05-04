import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';

abstract class TodayApodRepository {
  /// Return a apod data with side of either case.
  Future<Either<Failure, Apod>> fetchApodToday();
}
