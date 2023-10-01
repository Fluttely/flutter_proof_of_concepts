import 'package:flutter_modular_nasted_navigation_poc/core/app.paths.dart';

class AppRoutes {
  /// Profile
  static const String profileAbsolutPath = AppPaths.profileCurrentPath;

  /// Profile Persons
  static const String profilePersonAbsolutPath =
      profileAbsolutPath + AppPaths.profilePersonCurrentPath;

  /// Profile Events
  static const String profileEventAbsolutPath =
      profileAbsolutPath + AppPaths.profileEventCurrentPath;

  /// Find
  static const String findAbsolutPath = AppPaths.findCurrentPath;

  /// Find Persons
  static const String findPersonAbsolutPath =
      findAbsolutPath + AppPaths.findPersonCurrentPath;
  static const String findPersonDetailsAbsolutPath =
      findPersonAbsolutPath + AppPaths.findPersonDetailsCurrentPath;
  static const String findPersonMatchAbsolutPath =
      findPersonAbsolutPath + AppPaths.findPersonMatchCurrentPath;

  /// Find Events
  static const String findEventAbsolutPath =
      findAbsolutPath + AppPaths.findEventCurrentPath;
}
