part of 'actual_limits_bloc.dart';

sealed class ActualLimitsState extends Equatable {
  const ActualLimitsState();

  @override
  List<Object?> get props => [];
}

final class Initial extends ActualLimitsState {}

final class Loading extends ActualLimitsState {}

final class Loaded extends ActualLimitsState {
  final Limits limits;
  const Loaded(this.limits);
  @override
  List<Object?> get props => [limits];
}

final class Error extends ActualLimitsState {
  final String message;
  const Error(this.message);
  @override
  List<Object?> get props => [message];
}
