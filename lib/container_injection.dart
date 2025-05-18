import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nasa_astronomy_app/data/datasources/network/network_checker.dart';
import 'package:nasa_astronomy_app/data/datasources/today_apod/today_apod_datasource.dart';
import 'package:nasa_astronomy_app/data/datasources/today_apod/today_apod_datasource_impl.dart';
import 'package:nasa_astronomy_app/data/repositories/today_apod/today_apod_repository_impl.dart';
import 'package:nasa_astronomy_app/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:nasa_astronomy_app/domain/usecases/today_apod/fetch_apod_usecase.dart';
import 'package:nasa_astronomy_app/presentation/bloc/today_apod/today_apod_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> setupContainer() async {
  // extern
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );

  // intern
  getIt.registerLazySingleton<NetworkChecker>(
    () => NetworkCheckerImpl(internetConnection: getIt()),
  );

  // features
  getIt.registerLazySingleton<TodayApodDatasource>(
    () => TodayApodDatasourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<TodayApodRepository>(
    () => TodayApodRepositoryImpl(dataSource: getIt(), network: getIt()),
  );

  getIt.registerLazySingleton<FetchApodUsecase>(
    () => FetchApodUsecase(todayApodRepository: getIt()),
  );

  getIt.registerFactory<TodayApodBloc>(() => TodayApodBloc(fetchApodUsecase: getIt()));
}
