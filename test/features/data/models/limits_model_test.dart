import 'dart:convert';

import 'package:bankamatik/features/withdraw_cash/business/entities/limits.dart';
import 'package:bankamatik/features/withdraw_cash/data/models/limits_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const tLimitsModel =
      LimitsModel(limits: {5000: 1, 2000: 1, 1000: 1, 500: 1, 200: 1, 100: 1});
  test('Должен быть подклассом сущности Limits', () async {
    expect(tLimitsModel, isA<Limits>());
  });
  group('fromJson', () {
    test(
        'Должен возвращать валидную модель, если в JSON находится Map <int,int>',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('limit.json'));
      // act
      final result = LimitsModel.fromJson(jsonMap);
      // assert
      expect(result, tLimitsModel);
    });
  });
  group('toJson', () {
    test('Должен вернуть JSON содержащий правильные данные', () async {
      // act
      final result = tLimitsModel.toJson();
      // assert
      final expectedMap = {
        "5000": 1,
        "2000": 1,
        "1000": 1,
        "500": 1,
        "200": 1,
        "100": 1
      };
      expect(result, expectedMap);
    });
  });
}
