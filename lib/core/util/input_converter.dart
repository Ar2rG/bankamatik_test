import '../errors/failure.dart';
import 'package:dartz/dartz.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInt(String str) {
    try {
      final integer = int.parse(str);
      if (integer % 100 != 0) {
        throw const FormatException();
      }
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure();
}
