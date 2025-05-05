import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';
import 'package:nasa_astronomy_app/domain/repositories/today_apod/today_apod_repository.dart';

class TodayApodRepositoryImpl implements TodayApodRepository{
  @override
  Future<Either<Failure, Apod>> fetchApodToday() {
    // TODO: implement fetchApodToday
    throw UnimplementedError();
  }
}