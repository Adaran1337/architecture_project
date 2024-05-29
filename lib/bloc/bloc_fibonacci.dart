import 'dart:math';

import 'package:architecture_project/bloc/bloc_fibonacci_state.dart';
import 'package:bloc/bloc.dart';

import '../fibonacci/fibonacci_utils.dart';
import 'bloc_fibonacci_event.dart';
import 'bloc_fibonacci_model.dart';

class BlocFibonacci extends Bloc<FibonacciEvent, FibonacciState> {
  BlocFibonacci() : super(FibonacciBootstrapState()) {
    on<NextFibonacciEvent>((event, emit) {
      final value = state is FibonacciWorkState
          ? (state as FibonacciWorkState).model
          : BlocFibonacciModel.initialState();
      int newIndex = value.index + 1;
      int newFibonacci = calculateFibonacci(newIndex);
      emit(FibonacciWorkState(BlocFibonacciModel(newIndex, newFibonacci)));
    });

    on<PrevFibonacciEvent>((event, emit) {
      final value = state is FibonacciWorkState
          ? (state as FibonacciWorkState).model
          : BlocFibonacciModel.initialState();
      int newIndex = max(1, value.index - 1);
      int newFibonacci = calculateFibonacci(newIndex);
      emit(FibonacciWorkState(BlocFibonacciModel(newIndex, newFibonacci)));
    });
  }
}
