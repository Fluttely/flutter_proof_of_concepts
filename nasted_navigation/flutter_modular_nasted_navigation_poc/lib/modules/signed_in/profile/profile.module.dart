import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.paths.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/signed_in/profile/profile.view.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/signed_in/profile/profile_event/profile_event.module.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/signed_in/profile/profile_person/profile_person.module.dart';

class ProfileModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfileRoot(), children: [
      ModuleRoute(AppPaths.findPersonCurrentPath, module: ProfilePersonModule()),
      ModuleRoute(AppPaths.findEventCurrentPath, module: ProfileEventModule()),
    ]);
  }
}
