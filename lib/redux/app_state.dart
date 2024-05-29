class AppState {
  final int index;
  final int fibonacciValue;

  const AppState(this.index, this.fibonacciValue);

  const AppState.initialState() : index = 1, fibonacciValue = 1;
}
