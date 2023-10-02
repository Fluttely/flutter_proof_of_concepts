import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.current_paths.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/find/find_person/find_person.module.dart';

import 'find.root.dart';
import 'find_event/find_event.module.dart';

class FindModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const FindRoot(), children: [
      ModuleRoute(AppPaths.person, module: FindPersonModule()),
      ModuleRoute(AppPaths.event, module: FindEventModule()),
    ]);
  }
}
