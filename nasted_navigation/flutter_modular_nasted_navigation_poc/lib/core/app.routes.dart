import 'package:flutter_modular_nasted_navigation_poc/core/app.paths.dart';

class AppRoutes {
  /// Profile
  static const String _profileAbsolutPath = AppPaths.profileCurrentPath;

  /// Profile Persons
  static const String profilePersonAbsolutPath =
      _profileAbsolutPath + AppPaths.profileSettingsCurrentPath;

  /// Profile Events
  static const String profileEventAbsolutPath =
      _profileAbsolutPath + AppPaths.profileVerificationCurrentPath;

  /// Find
  static const String _findAbsolutPath = AppPaths.findCurrentPath;

  /// Find Persons
  static const String findPersonAbsolutPath =
      _findAbsolutPath + AppPaths.findPersonCurrentPath;
  static const String findPersonDetailsAbsolutPath =
      findPersonAbsolutPath + AppPaths.findPersonDetailsCurrentPath;
  static const String findPersonMatchAbsolutPath =
      findPersonAbsolutPath + AppPaths.findPersonMatchCurrentPath;

  /// Find Events
  static const String findEventAbsolutPath =
      _findAbsolutPath + AppPaths.findEventCurrentPath;
}
