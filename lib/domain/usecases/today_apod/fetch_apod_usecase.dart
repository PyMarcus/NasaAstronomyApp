import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';
import 'package:nasa_astronomy_app/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:nasa_astronomy_app/domain/usecases/core/usecase.dart';

class FetchApodUsecase extends Usecase<Apod, NoParameter> {
  final TodayApodRepository todayApodRepository;

  FetchApodUsecase({required this.todayApodRepository});

  Future<Either<Failure, Apod>> call(NoParameter parameter) async {
    return await todayApodRepository.fetchApodToday();
  }
}
