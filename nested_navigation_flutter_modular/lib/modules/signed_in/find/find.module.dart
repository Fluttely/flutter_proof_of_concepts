import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.current_paths.dart';

import 'find.root.dart';
import 'find_event/find_event.module.dart';
import 'find_person/find_person.module.dart';

class FindModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const FindRoot(), children: [
      ModuleRoute(AppCurrentPaths.findPerson, module: FindPersonModule()),
      ModuleRoute(AppCurrentPaths.findEvent, module: FindEventModule()),
    ]);
  }
}
