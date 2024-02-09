import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/limits.dart';

abstract class WithdrawCashRepository {
  Future<Either<Failure, Limits>> getCash(int desiredAmount);
  Future<Either<Failure, Limits>> getActualLimits();
}
