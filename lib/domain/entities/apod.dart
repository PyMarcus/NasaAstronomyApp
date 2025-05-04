import 'package:equatable/equatable.dart';

class Apod extends Equatable {
  String copyright;
  DateTime date;
  String explanation;
  String hdurl;
  String mediaType;
  String serviceVersion;
  String thumbnailUrl;
  String title;
  String url;


  Apod({
    required this.copyright,
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.thumbnailUrl,
    required this.title,
    required this.url,
  });
  
  @override
  List<Object?> get props => [
        copyright,
        date,
        explanation,
        hdurl,
        mediaType,
        serviceVersion,
        thumbnailUrl,
        title,
        url,
      ];
}
  

