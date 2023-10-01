import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/signed_in/signed_in.module.dart';

import 'app.widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ModularApp(
      module: SignedInModule(),
      child: const AppWidget(),
    ),
  );
}
