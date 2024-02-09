import '../../business/entities/limits.dart';

class LimitsModel extends Limits {
  const LimitsModel({required Map<int, int> limits}) : super(limits: limits);

  factory LimitsModel.fromJson(Map<String, dynamic> json) {
    return LimitsModel(limits: {
      5000: json["5000"] ?? 0,
      2000: json["2000"] ?? 0,
      1000: json["1000"] ?? 0,
      500: json["500"] ?? 0,
      200: json["200"] ?? 0,
      100: json["100"] ?? 0
    });
  }
  Map<String, dynamic> toJson() {
    return {
      "5000": limits[5000],
      "2000": limits[2000],
      "1000": limits[1000],
      "500": limits[500],
      "200": limits[200],
      "100": limits[100]
    };
  }
}
