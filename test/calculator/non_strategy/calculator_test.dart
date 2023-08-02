import 'package:flutter_test/flutter_test.dart';
import 'package:strategy_pattern/calculator/non_strategy/calculator.dart';

void main() {
  group("Non-Strategy Calculator", () {
    group("Addition", () {
      test("should return passed value the first time it's called", () {
        // Arrange
        final calculator = Calculator();
        calculator.currentOperation = CalculatorOperation.ADDITION;

        // Act
        final result = calculator.calculate(20);

        //Assert
        expect(result, 20);
      });

      test("should add all numbers sent to calculate", () {
        // Arrange
        final calculator = Calculator();
        calculator.currentOperation = CalculatorOperation.ADDITION;

        // Act
        calculator.calculate(20);
        calculator.calculate(10);
        final result = calculator.calculate(11);

        //Assert
        expect(result, 41);
      });
    });

    group("Multi operations", () {
      test(
          "should properly calculate result of all passed operations and operands",
          () {
        // Arrange
        final calculator = Calculator();

        // Act
        calculator.currentOperation = CalculatorOperation.ADDITION;
        calculator.calculate(20);

        calculator.currentOperation = CalculatorOperation.SUBTRACTION;
        calculator.calculate(10);

        calculator.currentOperation = CalculatorOperation.MULTIPLICATION;
        calculator.calculate(2);

        calculator.currentOperation = CalculatorOperation.DIVISION;
        final result = calculator.calculate(5);

        //Assert
        expect(result, 4);
      });

      test(
          "should properly calculate result of all passed operations and operands after clear is called",
          () {
        // Arrange
        final calculator = Calculator();

        // Act
        calculator.currentOperation = CalculatorOperation.ADDITION;
        calculator.calculate(20);

        calculator.clear();

        calculator.currentOperation = CalculatorOperation.SUBTRACTION;
        calculator.calculate(10);

        calculator.currentOperation = CalculatorOperation.MULTIPLICATION;
        calculator.calculate(2);

        calculator.currentOperation = CalculatorOperation.DIVISION;
        final result = calculator.calculate(5);

        //Assert
        expect(result, -4);
      });
    });
  });
}
