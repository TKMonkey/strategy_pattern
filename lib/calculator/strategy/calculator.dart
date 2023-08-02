import 'package:strategy_pattern/calculator/i_calculator.dart';
import 'package:strategy_pattern/calculator/strategy/operation.dart';

class Calculator implements ICalculator<Operation> {
  Operation? _currentOperation;
  double _currentValue = 0;

  set currentOperation(Operation operation) => _currentOperation = operation;

  double calculate(double operand2) {
    assert(_currentOperation != null);

    _currentValue = _currentOperation!.calculate(_currentValue, operand2);

    return _currentValue;
  }

  @override
  clear() {
    _currentValue = 0;
  }
}
