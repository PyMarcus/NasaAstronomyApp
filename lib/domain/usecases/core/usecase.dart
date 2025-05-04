import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_app/core/failure.dart';

abstract class Usecase<R, P> {
  /// Default usecase
  /// R is the return
  /// P is the parameter
  Future<Either<Failure, R>> call(P parameter);
  
}

class NoParameter{}
