import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/entities/limits.dart';
import '../../business/usecases/get_actual_limits.dart';

part 'actual_limits_event.dart';
part 'actual_limits_state.dart';

class ActualLimitsBloc extends Bloc<ActualLimitsEvent, ActualLimitsState> {
  final GetActualLimits getActualLimits;
  ActualLimitsBloc({required this.getActualLimits}) : super(Initial()) {
    on<ActualLimitsEvent>((event, emit) async {
      // Инициализация или просто отображение лимитов
      emit(Loading());
      final limitsOrFailure = await getActualLimits();
      limitsOrFailure.fold(
          (failure) => emit(const Error("Ошибка проверки лимитов")),
          (limits) => emit(Loaded(limits)));
    });
  }
}
