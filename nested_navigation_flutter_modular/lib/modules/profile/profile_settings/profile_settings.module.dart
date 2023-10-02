import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/modules/profile/profile_settings/profile_settings.page.dart';

class ProfileSettingsModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfileSettingsPage());
  }
}
