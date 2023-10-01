import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/signed_in/profile/profile_person/profile_person.view.dart';

class ProfilePersonModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfilePersonView());
  }
}
