import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/signed_in/profile/profile_event/profile_event.view.dart';


class ProfileEventModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfileEventView());
  }
}
