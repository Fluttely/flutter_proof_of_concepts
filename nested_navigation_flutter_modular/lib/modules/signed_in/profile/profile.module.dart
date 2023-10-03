import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.current_paths.dart';
import 'package:nested_navigation_flutter_modular/modules/signed_in/profile/profile.root.dart';
import 'package:nested_navigation_flutter_modular/modules/signed_in/profile/profile_settings/profile_settings.module.dart';
import 'package:nested_navigation_flutter_modular/modules/signed_in/profile/profile_verification/profile_verification.module.dart';

class ProfileModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfileRoot(), children: [
      ModuleRoute(AppCurrentPaths.profileSettings, module: ProfileSettingsModule()),
      ModuleRoute(AppCurrentPaths.profileVerification, module: ProfileVerificationModule()),
    ]);
  }
}
