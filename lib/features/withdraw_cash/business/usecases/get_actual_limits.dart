import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/limits.dart';
import '../repositories/withdraw_cash_repository.dart';

class GetActualLimits {
  final WithdrawCashRepository repository;

  GetActualLimits(this.repository);
  Future<Either<Failure, Limits>> call() async {
    return await repository.getActualLimits();
  }
}
