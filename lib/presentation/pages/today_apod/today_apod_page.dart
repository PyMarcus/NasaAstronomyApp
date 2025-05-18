import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nasa_astronomy_app/container_injection.dart';
import 'package:nasa_astronomy_app/presentation/bloc/today_apod/today_apod_bloc.dart';

class ApodTodayPage extends StatefulWidget {
  const ApodTodayPage({super.key});

  @override
  State<ApodTodayPage> createState() => _ApodTodayPageState();
}

class _ApodTodayPageState extends State<ApodTodayPage> {
  late TodayApodBloc _todayApodBloc;

  @override
  void initState() {
    super.initState();
    _todayApodBloc = getIt<TodayApodBloc>();
    _todayApodBloc.input.add(FetchTodayApodEvent());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TodayApodState>(
      stream: _todayApodBloc.stream,
      builder: (context, snapshot) {
        TodayApodState? state = snapshot.data;
        Widget body = Container();

        // loading
        if (state is LoadingTodayApodState) {
          body = Center(child: CircularProgressIndicator());
        }

        // error
        if (state is ErrorTodayApodState) {
          body = Center(child: Text(state.msg));
        }

        // success
        if (state is SuccessTodayApodState) {
          body = Column(
            children: [
              Text(state.apod.title ?? ""),
              Text(state.apod.explanation ?? ""),
            ],
          );
        }

        return Scaffold(body: body);
      },
    );
  }
}
