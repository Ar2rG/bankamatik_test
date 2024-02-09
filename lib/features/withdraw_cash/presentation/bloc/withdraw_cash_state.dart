part of 'withdraw_cash_bloc.dart';

sealed class WithdrawCashState extends Equatable {
  const WithdrawCashState();

  @override
  List<Object?> get props => [];
}

final class Initial extends WithdrawCashState {}

final class Loading extends WithdrawCashState {}

final class Loaded extends WithdrawCashState {
  final Limits limits;
  const Loaded(this.limits);
  @override
  List<Object?> get props => [limits];
}

final class Error extends WithdrawCashState {
  final String message;
  const Error(this.message);
  @override
  List<Object?> get props => [message];
}
