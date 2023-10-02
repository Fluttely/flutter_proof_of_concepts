import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigationManager {
  static ValueNotifier<String?> currentRoute = ValueNotifier(null);

  static void navigate(String route) {
    if (route.isNotEmpty) {
      currentRoute.value = route;
      Modular.to.navigate(route);
    }
  }
}
