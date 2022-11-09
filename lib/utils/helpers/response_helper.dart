import 'package:dartz/dartz.dart';

typedef FirebaseResponse<T> = Either<Failure, T>;

class Failure {
  final int code;
  final Object response;

  Failure({
    required this.code,
    required this.response,
  });
}
