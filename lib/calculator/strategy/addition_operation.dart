import 'package:strategy_pattern/calculator/strategy/operation.dart';

class AdditionOperation implements Operation {
  @override
  double calculate(double operand1, double operand2) => operand1 + operand2;
}
