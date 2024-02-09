import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/limits.dart';
import '../repositories/withdraw_cash_repository.dart';

class GetCash {
  final WithdrawCashRepository repository;

  GetCash(this.repository);
  Future<Either<Failure, Limits>> call({required int desiredAmount}) async {
    return await repository.getCash(desiredAmount);
  }
}
