import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.current_paths.dart';
import 'package:flutter_modular_nasted_navigation_poc/modules/signed_in/profile/profile.module.dart';

import 'find/find.module.dart';
import 'signed_in.root.dart';

class SignedInModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const SignedInRoot(), children: [
      ModuleRoute(AppCurrentPaths.find, module: FindModule()),
      ModuleRoute(AppCurrentPaths.profile, module: ProfileModule()),
    ]);
  }
}
