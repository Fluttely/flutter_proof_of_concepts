import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/modules/signed_in/find/find_event/find_event.view.dart';


class FindEventModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const FindEventView());
  }
}
