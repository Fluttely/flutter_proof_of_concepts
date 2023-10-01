import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';

class FindRoot extends StatefulWidget {
  const FindRoot({super.key});

  @override
  State<FindRoot> createState() => _FindRootState();
}

abstract class FindRootViewModel extends State<FindRoot> {
  ValueNotifier<int> selectedPageIndex = ValueNotifier(0);

  late FindRootPageType type;

  FindRootPageType _getRootPageType(int value) => switch (value) {
        0 => FindRootPageType.person,
        1 => FindRootPageType.event,
        _ => FindRootPageType.person,
      };

  void rootNavigate(FindRootPageType value) => switch (value) {
        FindRootPageType.person =>
          Modular.to.navigate(AppRoutes.findPersonAbsolutPath),
        FindRootPageType.event =>
          Modular.to.navigate(AppRoutes.findEventAbsolutPath),
      };

  void onDestinationSelected(int index) {
    selectedPageIndex.value = index;

    type = _getRootPageType(index);
    rootNavigate(type);
  }
}

enum FindRootPageType {
  person,
  event,
}

class _FindRootState extends FindRootViewModel
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: ValueListenableBuilder(
            valueListenable: selectedPageIndex,
            builder: (context, selectedPageIndexValue, _) {
              return NavigationBar(
                indicatorColor: Colors.transparent,
                backgroundColor: Colors.purpleAccent,
                selectedIndex: selectedPageIndexValue,
                elevation: 0,
                height: 52,
                onDestinationSelected: onDestinationSelected,
                destinations: [
                  NavigationDestination(
                    selectedIcon: _navigationIcon(
                      icon: Icons.people_alt,
                      color: Colors.white,
                      size: 32,
                    ),
                    icon: _navigationIcon(
                      icon: Icons.people_alt_outlined,
                      color: Colors.black,
                      size: 32,
                    ),
                    label: '',
                    tooltip: 'Search for people',
                  ),
                  NavigationDestination(
                    selectedIcon: _navigationIcon(
                      icon: Icons.event_note,
                      color: Colors.white,
                      size: 32,
                    ),
                    icon: _navigationIcon(
                      icon: Icons.event_note,
                      color: Colors.black,
                      size: 32,
                    ),
                    label: '',
                    tooltip: 'Search for events',
                  ),
                ],
              );
            },
          ),
        ),
        body: const RouterOutlet(),
      ),
    );
  }

  Widget _navigationIcon({
    required IconData icon,
    required Color color,
    required double size,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Icon(
        icon,
        size: size,
      ),
    );
  }
}
