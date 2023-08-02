import 'package:strategy_pattern/calculator/i_calculator.dart';

enum CalculatorOperation {
  DIVISION,
  ADDITION,
  SUBTRACTION,
  MULTIPLICATION,
}

class Calculator implements ICalculator<CalculatorOperation> {
  CalculatorOperation? _currentOperation;
  double _currentValue = 0;

  set currentOperation(CalculatorOperation operation) =>
      _currentOperation = operation;

  double calculate(double operand2) {
    assert(_currentOperation != null);

    switch (_currentOperation) {
      case CalculatorOperation.DIVISION:
        _currentValue = _currentValue / operand2;
        break;
      case CalculatorOperation.ADDITION:
        _currentValue = _currentValue + operand2;
        break;
      case CalculatorOperation.SUBTRACTION:
        _currentValue = _currentValue - operand2;
        break;
      case CalculatorOperation.MULTIPLICATION:
        _currentValue = _currentValue * operand2;
        break;
      case null:
        throw ArgumentError("Cannot calculate without an operation");
    }

    return _currentValue;
  }

  void clear() {
    _currentValue = 0;
  }
}

double sum(double operand1, double operand2) {
  return operand2 + operand1;
}

double minus(double operand1, double operand2) {
  return operand1 - operand2;
}
