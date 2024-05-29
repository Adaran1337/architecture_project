import 'dart:math';

import 'package:architecture_project/fibonacci/fibonacci_utils.dart';

import 'actions.dart';
import 'app_state.dart';

AppState reducer(AppState previousState, action) {
  if (action == CounterActions.next) {
    int newIndex = previousState.index + 1;
    int newFibonacci = calculateFibonacci(newIndex);
    return AppState(newIndex, newFibonacci);
  }
  if (action == CounterActions.prev) {
    int newIndex = max(1, previousState.index - 1);
    int newFibonacci = calculateFibonacci(newIndex);
    return AppState(newIndex, newFibonacci);
  }
  return previousState;
}
