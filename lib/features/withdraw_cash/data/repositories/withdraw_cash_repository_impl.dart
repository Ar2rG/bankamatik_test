import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../business/entities/limits.dart';
import '../../business/repositories/withdraw_cash_repository.dart';
import '../datasources/limits_local_data_source.dart';

class WithdrawCashRepositoryImpl implements WithdrawCashRepository {
  final LimitsLocalDataSource localDataSource;

  WithdrawCashRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Limits>> getCash(int desiredAmount) async {
    try {
      final localLimits = await localDataSource.getLimits(desiredAmount);
      return Right(localLimits);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Limits>> getActualLimits() async {
    try {
      final localLimits = await localDataSource.getActualLimits();
      return Right(localLimits);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
