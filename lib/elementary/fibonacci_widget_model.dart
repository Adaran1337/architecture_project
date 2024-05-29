import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'fibonacci_elementary_widget.dart';
import 'fibonacci_model.dart';

class FibonacciWidgetModel
    extends WidgetModel<FibonacciElementaryWidget, FibonacciModel> {
  final state = ValueNotifier<int>(1);

  FibonacciWidgetModel(FibonacciModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    updateState();
  }

  void nextFibonacci() {
    model.nextFibonacci();
    updateState();
  }

  void prevFibonacci() {
    model.prevFibonacci();
    updateState();
  }

  void updateState() {
    state.value = model.fibonacciValue;
  }
}

FibonacciWidgetModel createFibonacciWidgetModel(BuildContext context) {
  return FibonacciWidgetModel(FibonacciModel());
}
