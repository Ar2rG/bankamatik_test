part of 'actual_limits_bloc.dart';

sealed class ActualLimitsEvent extends Equatable {
  const ActualLimitsEvent();

  @override
  List<Object> get props => [];
}

class GetActualLimitsEvent extends ActualLimitsEvent {
  const GetActualLimitsEvent();
  @override
  List<Object> get props => [];
}
