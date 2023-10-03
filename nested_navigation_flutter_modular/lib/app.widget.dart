import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

abstract class AppWidgetViewModel extends State<AppWidget> {}

class _AppWidgetState extends AppWidgetViewModel {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Modular Nasted Navigation POC',
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        // useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(background: Colors.white),
      ),
    );
  }
}
