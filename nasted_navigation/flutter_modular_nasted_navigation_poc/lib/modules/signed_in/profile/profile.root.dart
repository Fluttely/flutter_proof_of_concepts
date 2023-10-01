import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class ProfileRoot extends StatefulWidget {
  const ProfileRoot({super.key});

  @override
  State<ProfileRoot> createState() => _ProfileRootState();
}

abstract class ProfileRootViewModel extends State<ProfileRoot> {
  ValueNotifier<int> selectedPageIndex = ValueNotifier(0);

  late ProfileRootPageType type;

  ProfileRootPageType _getRootPageType(int value) => switch (value) {
        0 => ProfileRootPageType.person,
        1 => ProfileRootPageType.event,
        _ => ProfileRootPageType.person,
      };

  void rootNavigate(ProfileRootPageType value) => switch (value) {
        ProfileRootPageType.person =>
          NavigationManager.navigate(AppAbsolutPathsRoutes.profileSettings),
        ProfileRootPageType.event =>
          NavigationManager.navigate(AppAbsolutPathsRoutes.profileVerification),
      };

  void onDestinationSelected(int index) {
    selectedPageIndex.value = index;

    type = _getRootPageType(index);
    rootNavigate(type);
  }
}

enum ProfileRootPageType {
  person,
  event,
}

class _ProfileRootState extends ProfileRootViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: ValueListenableBuilder(
          valueListenable: NavigationManager.currentRoute,
          builder: (__, value, _) {
            return NavigationBar(
              indicatorColor: Colors.transparent,
              backgroundColor: Colors.redAccent,
              selectedIndex:
                  value?.contains(AppAbsolutPathsRoutes.profileSettings) == true
                      ? 0
                      : 1,
              elevation: 0,
              height: 52,
              onDestinationSelected: onDestinationSelected,
              destinations: [
                NavigationDestination(
                  selectedIcon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 32,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey[800],
                    size: 32,
                  ),
                  label: 'Settings',
                  tooltip: 'Search for people',
                ),
                NavigationDestination(
                  selectedIcon: const Icon(
                    Icons.verified,
                    color: Colors.white,
                    size: 32,
                  ),
                  icon: Icon(
                    Icons.verified_outlined,
                    color: Colors.grey[800],
                    size: 32,
                  ),
                  label: 'Verification',
                  tooltip: 'Search for events',
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
