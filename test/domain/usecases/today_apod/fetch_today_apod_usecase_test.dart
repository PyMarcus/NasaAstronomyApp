import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';
import 'package:nasa_astronomy_app/domain/repositories/today_apod/today_apod_repository.dart';
import 'package:nasa_astronomy_app/domain/usecases/core/usecase.dart';
import 'package:nasa_astronomy_app/domain/usecases/today_apod/fetch_apod_usecase.dart';

import '../../../test_values.dart';
import 'fetch_today_apod_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodayApodRepository>()])
void main() {
  late FetchApodUsecase fetchApodUsecase;
  late MockTodayApodRepository todayApodRepository;

  setUp(() {
    todayApodRepository = MockTodayApodRepository();
    fetchApodUsecase = FetchApodUsecase(
      todayApodRepository: todayApodRepository,
    );
  });

  // returns apod
  test("Should return an Apod", () async {
    // scenary
    when(
      todayApodRepository.fetchApodToday(),
    ).thenAnswer((_) async => Right<Failure, Apod>(testApod));
    // action
    final result = await fetchApodUsecase(NoParameter());
    // expected
    expect(result, Right<Failure, Apod>(testApod));
  });
  // return failure

  test("Should return a failure", () async{
    // scenary
    when(
      todayApodRepository.fetchApodToday(),
    ).thenAnswer((_) async => Left<Failure, Apod>(noConnectionFailure));
    // action
    final result = await fetchApodUsecase(NoParameter());
    // expected
    expect(result, Left<Failure, Apod>(noConnectionFailure));
    
  });
}
