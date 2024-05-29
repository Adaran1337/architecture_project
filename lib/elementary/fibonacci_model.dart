import 'dart:math';

import 'package:architecture_project/fibonacci/fibonacci_utils.dart';
import 'package:elementary/elementary.dart';

class FibonacciModel extends ElementaryModel {
  int index = 1;
  int fibonacciValue = 1;

  void nextFibonacci() {
    index++;
    fibonacciValue = calculateFibonacci(index);
  }

  void prevFibonacci() {
    index = max(1, index - 1);
    fibonacciValue = calculateFibonacci(index);
  }
}
