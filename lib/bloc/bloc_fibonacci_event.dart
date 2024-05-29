abstract class FibonacciEvent {
  const FibonacciEvent();
}

class NextFibonacciEvent extends FibonacciEvent {}

class PrevFibonacciEvent extends FibonacciEvent {}
