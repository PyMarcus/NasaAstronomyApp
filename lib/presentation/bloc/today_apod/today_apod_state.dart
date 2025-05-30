part of 'today_apod_bloc.dart';

class TodayApodState extends Equatable {
  const TodayApodState();

  @override
  List<Object?> get props => [];
}

class SuccessTodayApodState extends TodayApodState {
  final Apod apod;

  const SuccessTodayApodState({required this.apod});

  @override
  List<Object?> get props => [apod];
}

class ErrorTodayApodState extends TodayApodState {
  final String msg;

  const ErrorTodayApodState({required this.msg});

  @override
  List<Object?> get props => [msg];

}

class LoadingTodayApodState extends TodayApodState {}
