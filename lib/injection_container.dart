import 'package:bankamatik/features/withdraw_cash/presentation/bloc/actual_limits_bloc.dart';

import 'core/util/input_converter.dart';
import 'features/withdraw_cash/business/repositories/withdraw_cash_repository.dart';
import 'features/withdraw_cash/business/usecases/get_actual_limits.dart';
import 'features/withdraw_cash/business/usecases/get_cash.dart';
import 'features/withdraw_cash/data/datasources/limits_local_data_source.dart';
import 'features/withdraw_cash/data/repositories/withdraw_cash_repository_impl.dart';
import 'features/withdraw_cash/presentation/bloc/withdraw_cash_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Dependency injection
// Для обработки внедрения своих repository, use cases и data sources
// Создание экземпляра
final sl = GetIt.instance;

Future<void> init() async {
//! Feature - Withdraw Cash
// Bloc
  sl.registerFactory(() => WithdrawCashBloc(
        getCash: sl(),
        inputConverter: sl(),
      ));
  sl.registerFactory(() => ActualLimitsBloc(
        getActualLimits: sl(),
      ));
// Use cases
  sl.registerLazySingleton(() => GetCash(sl()));
  sl.registerLazySingleton(() => GetActualLimits(sl()));
// Repositories
  sl.registerLazySingleton<WithdrawCashRepository>(
      () => WithdrawCashRepositoryImpl(localDataSource: sl()));
// Data sources
  sl.registerLazySingleton<LimitsLocalDataSource>(
      () => LimitsLocalDataSourceImpl(sharedPreferences: sl()));
//! Core
  sl.registerLazySingleton(() => InputConverter());

//! External
  sl.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  // Так как SharedPreferences капризничал,
  // пришлось добавить ожидание его готовности
  await sl.isReady<SharedPreferences>();
}
