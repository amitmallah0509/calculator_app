import 'package:hive/hive.dart';

part 'calculator_model.g.dart';

@HiveType(typeId: 1)
class Calculator {
  Calculator({required this.calculateValue, required this.total});

  @HiveField(0)
  String calculateValue;

  @HiveField(1)
  String total;

  @override
  String toString() {
    return '$calculateValue: $total';
  }
}
