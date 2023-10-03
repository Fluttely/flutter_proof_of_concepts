import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.absolut_paths.routes.dart';
import 'package:nested_navigation_flutter_modular/core/navigation_manager.dart';

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
              indicatorColor: Colors.red.shade300,
              backgroundColor: Colors.red,
              selectedIndex:
                  value?.contains(AppAbsolutPathsRoutes.findPerson) == true
                      ? 0
                      : 1,
              elevation: 0,
              height: 52,
              onDestinationSelected: onDestinationSelected,
              destinations: const [
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.people_alt,
                    color: Colors.white,
                    size: 32,
                  ),
                  icon: Icon(
                    Icons.people_alt_outlined,
                    color: Colors.black,
                    size: 32,
                  ),
                  label: 'Find People',
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.event_note,
                    color: Colors.white,
                    size: 32,
                  ),
                  icon: Icon(
                    Icons.event_note,
                    color: Colors.black,
                    size: 32,
                  ),
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
