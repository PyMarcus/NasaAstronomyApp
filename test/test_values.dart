import 'package:nasa_astronomy_app/core/failure.dart';
import 'package:nasa_astronomy_app/data/models/apod_model.dart';
import 'package:nasa_astronomy_app/domain/entities/apod.dart';

Apod testApod = Apod(
  copyright: 'NASA',
  date: DateTime.parse('2025-05-01'),
  explanation: 'This is a fake explanation for testing purposes.',
  hdurl: 'https://example.com/fake_hd.jpg',
  mediaType: 'image',
  serviceVersion: 'v1',
  thumbnailUrl: 'https://example.com/fake_thumb.jpg',
  title: 'Fake Astronomy Picture',
  url: 'https://example.com/fake.jpg',
);

ApodModel testApodModel = ApodModel(
  copyright: 'NASA',
  date: DateTime.parse('2025-05-01'),
  explanation: 'This is a fake explanation for testing purposes.',
  hdurl: 'https://example.com/fake_hd.jpg',
  mediaType: 'image',
  serviceVersion: 'v1',
  thumbnailUrl: 'https://example.com/fake_thumb.jpg',
  title: 'Fake Astronomy Picture',
  url: 'https://example.com/fake.jpg',
);

Failure noConnectionFailure = NoConnection();
Failure apiFailure = ApiFailure();
