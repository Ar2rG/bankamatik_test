import 'package:equatable/equatable.dart';

class Limits extends Equatable {
  final Map<int, int> limits;

  const Limits({required this.limits});

  @override
  List<Object> get props => [limits];
}
