import '../bloc/actual_limits_bloc.dart';
import 'limits_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActualLimitsContainer extends StatefulWidget {
  const ActualLimitsContainer({super.key});

  @override
  State<ActualLimitsContainer> createState() => _ActualLimitsContainerState();
}

class _ActualLimitsContainerState extends State<ActualLimitsContainer> {
  @override
  void initState() {
    context.read<ActualLimitsBloc>().add(const GetActualLimitsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ActualLimitsBloc, ActualLimitsState>(
          builder: (context, state) {
        if (state is Initial) {
          return const Text('');
        }
        if (state is Loading) {
          return const CircularProgressIndicator();
        }
        if (state is Loaded) {
          return LimitsContainer(state.limits.limits);
        }
        if (state is Error) {
          return Text(
            state.message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Color.fromRGBO(197, 36, 168, 1)),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
