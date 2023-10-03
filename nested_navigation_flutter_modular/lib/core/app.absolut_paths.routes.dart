import 'package:nested_navigation_flutter_modular/core/app.current_paths.dart';

class AppAbsolutPathsRoutes {
  /// Profile
  static const String profile = AppCurrentPaths.profile;

  /// Profile Settings
  static const String profileSettings =
      profile + AppCurrentPaths.profileSettings;

  /// Profile Verification
  static const String profileVerification =
      profile + AppCurrentPaths.profileVerification;

  /// Find
  static const String find = AppCurrentPaths.find;

  /// Find Persons
  static const String findPerson =
      find + AppCurrentPaths.findPerson;
  static const String findPersonDetails =
      findPerson + AppCurrentPaths.findPersonDetails;
  static const String findPersonMatch =
      findPerson + AppCurrentPaths.findPersonMatch;

  /// Find Events
  static const String findEvent =
      find + AppCurrentPaths.findEvent;
}
