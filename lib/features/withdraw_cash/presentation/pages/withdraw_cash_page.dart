import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/actual_limits_bloc.dart';
import '../bloc/withdraw_cash_bloc.dart';
import '../widgets/actual_limits_container.dart';
import '../widgets/custom_bottom_clippers.dart';
import '../widgets/custom_top_clippers.dart';
import '../widgets/withdraw_controls.dart';
import '../widgets/withdraw_limits_container.dart';

class WithdrawCashPage extends StatelessWidget {
  const WithdrawCashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // Разделил на два отдельных блока, для возможного последущего
          // обновления остатка лимитов
          BlocProvider(create: (_) => sl<WithdrawCashBloc>()),
          BlocProvider(create: (_) => sl<ActualLimitsBloc>()),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'ATM',
              style: TextStyle(color: Colors.white),
            ),
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        blurRadius: 20,
                        offset: Offset(0, 0.1))
                  ],
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(56, 39, 180, 1),
                    Color.fromRGBO(108, 24, 164, 1),
                  ])),
            ),
          ),
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.35,
                child: const Stack(children: [
                  AllTopClippers(),
                  WithdrawControls(),
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.17,
                child: const WithdrawLimitsContainer(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.17,
                child: const ActualLimitsContainer(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.17,
                  color: Colors.white,
                  child: const AllBottomClippers()),
            ],
          ),
        ));
  }
}
