import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/signed_in/find/find_event/find_event.page.dart';


class FindEventModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const FindEventPage());
  }
}
