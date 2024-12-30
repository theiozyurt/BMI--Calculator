import 'dart:math';
import 'package:bmi_calculator/screens/result_screen.dart';

class CalculatorBrain {
  final int weight;
  final int height;
  CalculatorBrain({required this.weight, required this.height});

  double result = 0.0;

  String calculateBMI() {
    result = weight / pow(height / 100, 2);
    return result.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (result >= 25) {
      return 'You are overweighted, you should do more exercise and eat less.';
    } else if (result >= 18.5) {
      return 'Great! You have a normal BMI. Good job!';
    } else {
      return 'Your BMI is lower than it must be, you should eat a bit more';
    }
  }

  String getResult() {
    if (result >= 25) {
      return 'Overweight';
    } else if (result >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
