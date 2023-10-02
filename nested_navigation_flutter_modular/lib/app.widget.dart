import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Modular Nested Navigation POC',
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
