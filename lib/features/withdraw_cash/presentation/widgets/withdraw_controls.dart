import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/withdraw_cash_bloc.dart';

class WithdrawControls extends StatefulWidget {
  const WithdrawControls({super.key});

  @override
  State<WithdrawControls> createState() => _WithdrawControlsState();
}

class _WithdrawControlsState extends State<WithdrawControls> {
  String inputString = '';

  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextFormField(
              controller: _controller,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                  label: Center(
                heightFactor: 0.1,
                child: Text("Сумма в рублях",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              )),
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              onChanged: (value) {
                final text = _controller.text;
                if (value.length < 7 && !value.endsWith(".00 руб")) {
                  _controller.value = _controller.value.copyWith(
                    text: '$value.00 руб',
                  );
                  setState(() => inputString = value);
                } else {
                  setState(
                      () => inputString = value.substring(0, text.length - 7));
                }
                // if (value.length > 7 && value.endsWith(".00 руб")) {
                //   final updatedText =
                //       "${text.substring(0, text.length - 7)}.00 руб";
                //   _controller.value = _controller.value.copyWith(
                //     text: updatedText,
                //   );
                // }
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.50,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromRGBO(230, 30, 173, 1),
                )),
                onPressed: () {
                  context
                      .read<WithdrawCashBloc>()
                      .add(GetCashEvent(inputString));
                },
                child: const Text('Выдать сумму',
                    style: TextStyle(color: Colors.white, fontSize: 16.0))),
          )
        ],
      ),
    );
  }
}
