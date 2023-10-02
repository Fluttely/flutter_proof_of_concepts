import 'package:flutter_modular_nasted_navigation_poc/core/app.current_paths.dart';

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
