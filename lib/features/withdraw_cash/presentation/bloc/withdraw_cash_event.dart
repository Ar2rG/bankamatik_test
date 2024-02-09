part of 'withdraw_cash_bloc.dart';

sealed class WithdrawCashEvent extends Equatable {
  const WithdrawCashEvent();

  @override
  List<Object> get props => [];
}

class GetCashEvent extends WithdrawCashEvent {
  final String numberString;

  const GetCashEvent(
    this.numberString,
  );
}
