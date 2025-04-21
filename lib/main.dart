import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'models/app_state.dart';
import 'store/store.dart';
import 'pages/home_page.dart';

void main() {
  initializeStore();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Pokédex',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: HomePage(),
      ),
    );
  }
}
