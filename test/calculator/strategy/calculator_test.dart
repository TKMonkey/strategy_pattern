import 'package:flutter_test/flutter_test.dart';
import 'package:strategy_pattern/calculator/strategy/addition_operation.dart';
import 'package:strategy_pattern/calculator/strategy/calculator.dart';
import 'package:strategy_pattern/calculator/strategy/division_operation.dart';
import 'package:strategy_pattern/calculator/strategy/multiplication_operation.dart';
import 'package:strategy_pattern/calculator/strategy/subtraction_operation.dart';

void main() {
  group("Strategy Calculator", () {
    group("Addition", () {
      test("should return passed value the first time it's called", () {
        // Arrange
        final calculator = Calculator();
        calculator.currentOperation = AdditionOperation();

        // Act
        final result = calculator.calculate(20);

        //Assert
        expect(result, 20);
      });

      test("should add all numbers sent to calculate", () {
        // Arrange
        final calculator = Calculator();
        calculator.currentOperation = AdditionOperation();

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
        calculator.currentOperation = AdditionOperation();
        calculator.calculate(20);

        calculator.currentOperation = SubtractionOperation();
        calculator.calculate(10);

        calculator.currentOperation = MultiplicationOperation();
        calculator.calculate(2);

        calculator.currentOperation = DivisionOperation();
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
        calculator.currentOperation = AdditionOperation();
        calculator.calculate(20);

        calculator.clear();

        calculator.currentOperation = SubtractionOperation();
        calculator.calculate(10);

        calculator.currentOperation = MultiplicationOperation();
        calculator.calculate(2);

        calculator.currentOperation = DivisionOperation();
        final result = calculator.calculate(5);

        //Assert
        expect(result, -4);
      });
    });
  });
}
