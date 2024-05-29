import 'bloc_fibonacci_model.dart';

abstract class FibonacciState {
  const FibonacciState();
}

class FibonacciBootstrapState extends FibonacciState {
  const FibonacciBootstrapState();
}

class FibonacciWorkState extends FibonacciState {
  final BlocFibonacciModel model;

  const FibonacciWorkState(this.model);
}
