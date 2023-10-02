import 'package:nested_navigation_flutter_modular/core/app.paths.dart';

/// AppAbsolutPaths
class AppRoutes {
  /// Profile
  static const String profile = AppPaths.profile;

  /// Profile Settings
  static const String profileSettings =
      profile + AppPaths.settings;

  /// Profile Verification
  static const String profileVerification =
      profile + AppPaths.verification;

  /// Find
  static const String find = AppPaths.find;

  /// Find Person
  static const String findPerson =
      find + AppPaths.person;
  static const String findPersonDetails =
      findPerson + AppPaths.details;

  /// Find Event
  static const String findEvent =
      find + AppPaths.event;
}
