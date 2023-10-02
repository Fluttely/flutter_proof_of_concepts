import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.paths.dart';
import 'package:nested_navigation_flutter_modular/modules/profile/profile.root.dart';
import 'package:nested_navigation_flutter_modular/modules/profile/profile_settings/profile_settings.module.dart';
import 'package:nested_navigation_flutter_modular/modules/profile/profile_verification/profile_verification.module.dart';

class ProfileModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfileRoot(), children: [
      ModuleRoute(AppPaths.settings,
          module: ProfileSettingsModule()),
      ModuleRoute(AppPaths.verification,
          module: ProfileVerificationModule()),
    ]);
  }
}
