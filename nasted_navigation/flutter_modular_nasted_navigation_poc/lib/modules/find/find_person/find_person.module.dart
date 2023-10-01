import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.current_paths.dart';

import 'find_person.page_1.dart';
import 'find_person.page_2.dart';
import 'find_person.page_3.dart';

class FindPersonModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const FindPersonPage1());
    r.child(AppCurrentPaths.findPersonDetails,
        child: (context) => const FindPersonPage2());
    r.child(AppCurrentPaths.findPersonMatch,
        child: (context) => const FindPersonPage3());
  }
}
