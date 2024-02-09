import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/withdraw_cash_bloc.dart';
import 'limits_container.dart';

class WithdrawLimitsContainer extends StatelessWidget {
  const WithdrawLimitsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<WithdrawCashBloc, WithdrawCashState>(
          builder: (context, state) {
        if (state is Initial) {
          return const Text("");
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
