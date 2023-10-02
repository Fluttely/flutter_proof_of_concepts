import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.routes.dart';
import 'package:nested_navigation_flutter_modular/core/navigation_manager.dart';

enum FindRootType {
  person,
  event,
}

class FindRoot extends StatelessWidget {
  const FindRoot({super.key});

  FindRootType _getRootType(int value) => switch (value) {
        0 => FindRootType.person,
        1 => FindRootType.event,
        _ => FindRootType.person,
      };

  void rootNavigate(FindRootType value) => switch (value) {
        FindRootType.person =>
          NavigationManager.navigate(AppRoutes.findPerson),
        FindRootType.event =>
          NavigationManager.navigate(AppRoutes.findEvent),
      };

  void onDestinationSelected(int index) {
    final type = _getRootType(index);
    rootNavigate(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: ValueListenableBuilder(
          valueListenable: NavigationManager.currentRoute,
          builder: (__, value, _) {
            return NavigationBar(
              selectedIndex:
                  value?.contains(AppRoutes.findPerson) == true
                      ? 0
                      : 1,
              onDestinationSelected: onDestinationSelected,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.people_alt_outlined),
                  label: 'Find Person',
                ),
                NavigationDestination(
                  icon: Icon(Icons.event_note),
                  label: 'Find Event',
                ),
              ],
            );
          },
        ),
      ),
      body: const RouterOutlet(),
    );
  }
}
