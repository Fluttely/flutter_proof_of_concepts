import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.current_paths.dart';

import 'views/find_person.details_view.dart';
import 'views/find_person.match_view.dart';
import 'views/find_person.view.dart';

class FindPersonModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const FindPersonView());
    r.child(AppCurrentPaths.findPersonDetails,
        child: (context) => const FindPersonDetailsView());
    r.child(AppCurrentPaths.findPersonMatch,
        child: (context) => const FindPersonMatchView());
  }
}
