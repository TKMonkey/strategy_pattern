abstract class ICalculator<O> {
  set currentOperation(O operation);
  double calculate(double operand2);
  clear();
}
