import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.routes.dart';
import 'package:nested_navigation_flutter_modular/core/navigation_manager.dart';

enum ProfileRootType {
  settings,
  verification,
}

class ProfileRoot extends StatelessWidget {
  const ProfileRoot({super.key});

  ProfileRootType _getRootType(int value) => switch (value) {
        0 => ProfileRootType.settings,
        1 => ProfileRootType.verification,
        _ => ProfileRootType.settings,
      };

  void rootNavigate(ProfileRootType value) => switch (value) {
        ProfileRootType.settings =>
          NavigationManager.navigate(AppRoutes.profileSettings),
        ProfileRootType.verification =>
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
