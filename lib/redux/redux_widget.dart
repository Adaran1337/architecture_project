import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';
import 'reducer.dart';

class ReduxWidget extends StatelessWidget {
  final store =
      Store<AppState>(reducer, initialState: const AppState.initialState());

  ReduxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<AppState, String>(
              converter: (store) => store.state.fibonacciValue.toString(),
              builder: (context, state) {
                return Text(
                  'Redux\nЧисло Фибоначчи: \n$state',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                );
              },
            ),
            StoreConnector<AppState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(CounterActions.next);
              },
              builder: (context, callback) {
                return ElevatedButton(
                  onPressed: callback,
                  child: const Text('Следующее значение'),
                );
              },
            ),
            const SizedBox(height: 8),
            StoreConnector<AppState, VoidCallback>(
              converter: (store) {
                return () => store.dispatch(CounterActions.prev);
              },
              builder: (context, callback) {
                return ElevatedButton(
                  onPressed: callback,
                  child: const Text('Предыдущее значение'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
