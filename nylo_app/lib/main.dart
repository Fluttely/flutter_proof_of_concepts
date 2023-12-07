import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

import 'package:updown_app/bootstrap/app.dart';
import 'package:updown_app/bootstrap/boot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(setup: Boot.nylo, setupFinished: Boot.finished);

  runApp(
    AppBuild(
      navigatorKey: NyNavigator.instance.router.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      debugShowCheckedModeBanner: false,
      initialRoute: nylo.getInitialRoute(),
    ),
  );
}
