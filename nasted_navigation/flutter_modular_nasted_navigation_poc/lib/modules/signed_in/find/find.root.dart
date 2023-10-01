import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class FindRoot extends StatefulWidget {
  const FindRoot({super.key});

  @override
  State<FindRoot> createState() => _FindRootState();
}

abstract class FindRootViewModel extends State<FindRoot> {
  late FindRootPageType type;

  FindRootPageType _getRootPageType(int value) => switch (value) {
        0 => FindRootPageType.person,
        1 => FindRootPageType.event,
        _ => FindRootPageType.person,
      };

  void rootNavigate(FindRootPageType value) => switch (value) {
        FindRootPageType.person =>
          NavigationManager.navigate(AppAbsolutPathsRoutes.findPerson),
        FindRootPageType.event =>
          NavigationManager.navigate(AppAbsolutPathsRoutes.findEvent),
      };

  void onDestinationSelected(int index) {
    type = _getRootPageType(index);
    rootNavigate(type);
  }
}

enum FindRootPageType {
  person,
  event,
}

class _FindRootState extends FindRootViewModel {
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
                  value?.contains(AppAbsolutPathsRoutes.findPerson) == true
                      ? 0
                      : 1,
              onDestinationSelected: onDestinationSelected,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.people_alt_outlined),
                  label: 'Find People',
                ),
                NavigationDestination(
                  icon: Icon(Icons.event_note),
                  label: 'Find Events',
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
