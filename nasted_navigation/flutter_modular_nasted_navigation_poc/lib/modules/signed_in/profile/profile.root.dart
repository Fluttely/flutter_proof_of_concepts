import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class ProfileRoot extends StatefulWidget {
  const ProfileRoot({super.key});

  @override
  State<ProfileRoot> createState() => _ProfileRootState();
}

abstract class ProfileRootViewModel extends State<ProfileRoot> {
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
    return ValueListenableBuilder(
      valueListenable: NavigationManager.currentRoute,
      builder: (__, value, _) {
        return Scaffold(
          body: Row(
            children: <Widget>[
              NavigationRail(
                selectedIndex:
                    value?.contains(AppAbsolutPathsRoutes.profileSettings) ==
                            true
                        ? 0
                        : 1,
                onDestinationSelected: onDestinationSelected,
                labelType: NavigationRailLabelType.all,
                destinations: const <NavigationRailDestination>[
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
