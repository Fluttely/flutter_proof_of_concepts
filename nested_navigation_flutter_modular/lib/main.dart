import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/modules/signed_in/signed_in.module.dart';

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
