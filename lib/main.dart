import 'package:flutter/material.dart';
import 'package:nasa_astronomy_app/container_injection.dart';
import 'package:nasa_astronomy_app/presentation/pages/today_apod/today_apod_page.dart';

void main() async {
  await setupContainer();
  runApp(const NasaAstronomyApp());
}

class NasaAstronomyApp extends StatelessWidget {
  const NasaAstronomyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Nasa Astronomy", home: ApodTodayPage());
  }
}
