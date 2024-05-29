import 'package:architecture_project/bloc/bloc_fibonacci_event.dart';
import 'package:architecture_project/bloc/bloc_fibonacci_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_fibonacci.dart';

class BlocWidget extends StatelessWidget {
  const BlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocFibonacci();

    return BlocProvider(
      create: (_) => counterBloc,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<BlocFibonacci, FibonacciState>(
              builder: (context, state) {
                if (state is FibonacciWorkState) {
                  return Text(
                    'BLoC\nЧисло Фибоначчи: \n${state.model.fibonacciValue}',
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  );
                } else if (state is FibonacciBootstrapState) {
                  return Text(
                    'BLoC\nНажмите на копку, чтобы начать вычисления',
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.center,
                  );
                }
                return const Text(
                  'Ошибка',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                );
              },
            ),
            ElevatedButton(
              onPressed: () => counterBloc.add(NextFibonacciEvent()),
              child: const Text('Следующее значение'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => counterBloc.add(PrevFibonacciEvent()),
              child: const Text('Предыдущее значение'),
            ),
          ],
        ),
      ),
    );
  }
}
