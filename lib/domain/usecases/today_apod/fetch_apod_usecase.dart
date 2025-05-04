import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';
import 'package:nasa_astronomy_app/domain/repositories/today_apod/today_apod_repository.dart';

class FetchApodUsecase {
  final TodayApodRepository todayApodRepository;

  FetchApodUsecase({required this.todayApodRepository});

  Future<Either<Failure, Apod>> call() {
    return todayApodRepository.fetchApodToday();
  }
}
