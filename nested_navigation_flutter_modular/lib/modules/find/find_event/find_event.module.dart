import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/modules/find/find_event/find_event.page.dart';


class FindEventModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const FindEventPage());
  }
}
