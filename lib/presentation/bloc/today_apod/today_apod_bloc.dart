import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';
import 'package:nasa_astronomy_app/domain/usecases/today_apod/fetch_apod_usecase.dart';

part 'today_apod_event.dart';
part 'today_apod_state.dart';

class TodayApodBloc {
  FetchApodUsecase fetchApodUsecase;

  TodayApodBloc({required this.fetchApodUsecase}) {
    // escuta eventos de entrada e aciona blockeeventcontroller.
    _inputController.stream.listen(_blockEventController); 
  }

  final StreamController<TodayApodEvent> _inputController =
      StreamController<TodayApodEvent>();
  final StreamController<TodayApodState> _outputController =
      StreamController<TodayApodState>();

  Sink<TodayApodEvent> get input => _inputController.sink; // entrada
  Stream<TodayApodState> get stream => _outputController.stream; // saida

  void _blockEventController(TodayApodEvent event) {}
}
