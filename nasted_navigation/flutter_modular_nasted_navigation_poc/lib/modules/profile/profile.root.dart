import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

enum ProfileRootType {
  person,
  event,
}

class ProfileRoot extends StatelessWidget {
  const ProfileRoot({super.key});

  ProfileRootType _getRootType(int value) => switch (value) {
        0 => ProfileRootType.person,
        1 => ProfileRootType.event,
        _ => ProfileRootType.person,
      };

  void rootNavigate(ProfileRootType value) => switch (value) {
        ProfileRootType.person =>
          NavigationManager.navigate(AppRoutes.profileSettings),
        ProfileRootType.event =>
          NavigationManager.navigate(AppRoutes.profileVerification),
      };

  void onDestinationSelected(int index) {
    final type = _getRootType(index);
    rootNavigate(type);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: NavigationManager.currentRoute,
      builder: (__, value, _) {
        return Scaffold(
          body: Row(
            children: <Widget>[
              NavigationRail(
                selectedIndex:
                    value?.contains(AppRoutes.profileSettings) ==
                            true
                        ? 0
                        : 1,
                onDestinationSelected: onDestinationSelected,
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.verified),
                    label: Text('Verification'),
                  ),
                ],
              ),
              const VerticalDivider(thickness: 1, width: 1),
              const Expanded(
                child: RouterOutlet(),
              ),
            ],
          ),
        );
      },
    );
  }
}
