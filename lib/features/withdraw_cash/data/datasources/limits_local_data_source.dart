import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../models/limits_model.dart';

abstract class LimitsLocalDataSource {
  Future<LimitsModel> getLimits(int desiredAmount);

  Future<LimitsModel> getActualLimits();
}

class LimitsLocalDataSourceImpl implements LimitsLocalDataSource {
  final SharedPreferences sharedPreferences;

  LimitsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LimitsModel> getLimits(int desiredAmount) {
    final jsonString = sharedPreferences.getString("limits");
    try {
      // Выдача купюр от большего к меньшему
      Map<int, int> availableBanknotes =
          LimitsModel.fromJson(json.decode(jsonString!)).limits;
      Map<String, int> result = {};
      for (var banknote in availableBanknotes.keys.toList()) {
        // Количество купюр данного номинала, которое можно использовать
        // Усекающее деление
        int count = desiredAmount ~/ banknote;
        if (count > 0) {
          if (availableBanknotes[banknote]! >= count) {
            result["$banknote"] = count;
            desiredAmount -= count * banknote;
          } else {
            result["$banknote"] = availableBanknotes[banknote]!;
            desiredAmount -= availableBanknotes[banknote]! * banknote;
          }
          // Остановка цикла если сумма дошла до нуля
          if (desiredAmount == 0) {
            break;
          }
        }
      }
      // Проверка остатка
      if (desiredAmount == 0) {
        return Future.value(LimitsModel.fromJson(result));
      } else {
        throw Exception();
      }
    } on Exception {
      throw CacheException();
    }
  }

  @override
  Future<LimitsModel> getActualLimits() async {
    final jsonString = sharedPreferences.getString("limits");
    // Инициализация значений, если поле limits null
    if (jsonString == null) {
      final Map<String, int> initialLimits = {
        "5000": 10,
        "2000": 100,
        "1000": 10,
        "500": 5,
        "200": 100,
        "100": 50
      };
      sharedPreferences.setString("limits", jsonEncode(initialLimits));
      return Future.value(LimitsModel.fromJson(initialLimits));
    } else {
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return Future.value(LimitsModel.fromJson(jsonMap));
    }
  }
}
