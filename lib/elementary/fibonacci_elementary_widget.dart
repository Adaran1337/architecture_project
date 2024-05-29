import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import 'fibonacci_widget_model.dart';

class FibonacciElementaryWidget extends ElementaryWidget<FibonacciWidgetModel> {
  const FibonacciElementaryWidget({Key? key})
      : super(createFibonacciWidgetModel, key: key);

  @override
  Widget build(FibonacciWidgetModel wm) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ValueListenableBuilder<int>(
            valueListenable: wm.state,
            builder: (context, state, child) {
              return Text(
                'Elementary\nЧисло Фибоначчи: \n$state',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              );
            },
          ),
          ElevatedButton(
            onPressed: wm.nextFibonacci,
            child: const Text('Следующее значение'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: wm.prevFibonacci,
            child: const Text('Предыдущее значение'),
          ),
        ],
      ),
    );
  }
}
