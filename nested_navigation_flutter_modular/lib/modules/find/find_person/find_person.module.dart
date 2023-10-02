import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.paths.dart';

import 'find_person.details.page.dart';
import 'find_person.page.dart';

class FindPersonModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const FindPersonPage());
    r.child(AppPaths.details,
        child: (context) => const FindPersonDetailsPage());
  }
}
