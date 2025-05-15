import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/domain/usecases/today_apod/fetch_apod_usecase.dart';
import 'package:nasa_astronomy_app/presentation/bloc/today_apod/today_apod_bloc.dart';

import '../../../test_values.dart';
import 'today_apod_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchApodUsecase>()])
void main() {
  late MockFetchApodUsecase mockFetchApodUsecase;
  late TodayApodBloc todayApodBloc;

  setUp(() {
    mockFetchApodUsecase = MockFetchApodUsecase();
    todayApodBloc = TodayApodBloc(fetchApodUsecase: mockFetchApodUsecase);
  });

  group("bloc - FetchTodayApod", () {

    test("Emits loading and success state", () {

      // scenary
      when(mockFetchApodUsecase(any)).thenAnswer((_) async => Right(testApod));
      // call
      todayApodBloc.input.add(FetchTodayApodEvent());
      // result
      expect(
        todayApodBloc.stream,
        emitsInOrder([
          LoadingTodayApodState(),
          SuccessTodayApodState(apod: testApod),
        ]),
      );
    });


    test("Emits loading and fail state", () {
      // scenary
      when(mockFetchApodUsecase(any)).thenAnswer((_) async => Left(NoConnection()));
      // call
      todayApodBloc.input.add(FetchTodayApodEvent());
      // result
      expect(
        todayApodBloc.stream,
        emitsInOrder([
          LoadingTodayApodState(),
          ErrorTodayApodState(msg: noConnectionFailure.msg),
        ]),
      );
    });
  });

}
