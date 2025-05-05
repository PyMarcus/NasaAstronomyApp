import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/data/datasources/network/network_checker.dart';
import 'package:nasa_astronomy_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';
import 'package:nasa_astronomy_app/domain/repositories/today_apod/today_apod_repository.dart';

class TodayApodRepositoryImpl implements TodayApodRepository {
  final TodayApodDatasource dataSource;
  final NetworkChecker network;

  TodayApodRepositoryImpl({required this.dataSource, required this.network});

  @override
  Future<Either<Failure, Apod>> fetchApodToday() async {
    if (await network.isConnected) {
      try {
        final model = await dataSource.fetchTodayApod();
        return Right(model);
      } on Failure catch (e) {
        return Left(e);
      }
    } else {
      return Left(NoConnection());
    }
  }
}
