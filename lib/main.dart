import 'package:architecture_project/navigation_layout.dart';
import 'package:architecture_project/redux/redux_widget.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc_widget.dart';
import 'elementary/fibonacci_elementary_widget.dart';
import 'navigation_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Архитектуры',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        NavigationUtils.bloc: (context) =>
            const NavigationLayout(childWidget: BlocWidget()),
        NavigationUtils.redux: (context) =>
            NavigationLayout(childWidget: ReduxWidget()),
        NavigationUtils.elementary: (context) =>
            const NavigationLayout(childWidget: FibonacciElementaryWidget()),
      },
      initialRoute: NavigationUtils.bloc,
    );
  }
}
