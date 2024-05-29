class BlocFibonacciModel {
  final int index;
  final int fibonacciValue;

  const BlocFibonacciModel(this.index, this.fibonacciValue);

  const BlocFibonacciModel.initialState()
      : index = 1,
        fibonacciValue = 1;
}
