import 'package:flutter/material.dart';

import 'features/withdraw_cash/presentation/pages/withdraw_cash_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ATM',
        theme: ThemeData(
          applyElevationOverlayColor: true,
          scaffoldBackgroundColor: const Color.fromRGBO(242, 242, 250, 1),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const WithdrawCashPage());
  }
}
