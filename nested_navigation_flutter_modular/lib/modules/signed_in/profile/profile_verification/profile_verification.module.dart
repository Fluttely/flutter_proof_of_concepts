import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/modules/signed_in/profile/profile_verification/profile_verification.view.dart';


class ProfileVerificationModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const ProfileVerificationView());
  }
}
