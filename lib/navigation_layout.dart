import 'dart:collection';

import 'package:flutter/material.dart';

import 'navigation_utils.dart';

class NavigationLayout extends StatelessWidget {
  static const _screenRouteToIndexMap = {
    NavigationUtils.bloc: 0,
    NavigationUtils.redux: 1,
    NavigationUtils.elementary: 2
  };

  static final _indexToScreenRouteMap = LinkedHashMap.fromEntries(
      _screenRouteToIndexMap.entries.map((e) => MapEntry(e.value, e.key)));

  final Widget childWidget;

  const NavigationLayout({Key? key, required this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Архитектуры'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: childWidget,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'BLoC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Redux',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.square),
            label: 'Elementary',
          ),
        ],
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.blueGrey,
        currentIndex:
            _screenRouteToIndexMap[ModalRoute.of(context)?.settings.name] ?? 0,
        onTap: (index) {
          String? route = _indexToScreenRouteMap[index];

          if (route != null && ModalRoute.of(context)?.settings.name != route) {
            Navigator.pushReplacementNamed(context, route);
          }
        },
      ),
    );
  }
}
