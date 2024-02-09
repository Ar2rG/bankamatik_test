import 'package:flutter/material.dart';

class LimitsContainer extends StatelessWidget {
  final Map<int, int> limits;
  const LimitsContainer(this.limits, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 25),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Баланс Банкомата',
                style: TextStyle(color: Color.fromRGBO(161, 160, 170, 1)),
              ),
              const SizedBox(height: 18),
              Text(
                '${limits[100]} X 100 рублей',
                style: const TextStyle(
                    color: Color.fromRGBO(55, 44, 175, 1), fontSize: 17),
              ),
              Text(
                '${limits[200]} X 200 рублей',
                style: const TextStyle(
                    color: Color.fromRGBO(55, 44, 175, 1), fontSize: 17),
              ),
              Text(
                '${limits[2000]} X 2000 рублей',
                style: const TextStyle(
                    color: Color.fromRGBO(55, 44, 175, 1), fontSize: 17),
              ),
            ],
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(''),
              const SizedBox(height: 18),
              Text(
                '${limits[500]} X 500 рублей',
                style: const TextStyle(
                    color: Color.fromRGBO(55, 44, 175, 1), fontSize: 17),
              ),
              Text(
                '${limits[1000]} X 1000 рублей',
                style: const TextStyle(
                    color: Color.fromRGBO(55, 44, 175, 1), fontSize: 17),
              ),
              Text(
                '${limits[5000]} X 5000 рублей',
                style: const TextStyle(
                    color: Color.fromRGBO(55, 44, 175, 1), fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
