int calculateFibonacci(int index) {
  int current = 0;
  int next = 1;
  for (int i = 0; i < index; i++) {
    int sum = current + next;
    current = next;
    next = sum;
  }
  return next;
}