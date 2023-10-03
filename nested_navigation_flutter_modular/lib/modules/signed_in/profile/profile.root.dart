import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nested_navigation_flutter_modular/core/app.absolut_paths.routes.dart';
import 'package:nested_navigation_flutter_modular/core/navigation_manager.dart';

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
                indicatorColor: Colors.transparent,
                backgroundColor: Colors.white,
                selectedIndex:
                    value?.contains(AppAbsolutPathsRoutes.profileSettings) ==
                            true
                        ? 0
                        : 1,
                onDestinationSelected: onDestinationSelected,
                labelType: NavigationRailLabelType.selected,
                destinations: const <NavigationRailDestination>[
                  NavigationRailDestination(
                    selectedIcon: Icon(
                      Icons.settings,
                      size: 32,
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey,
                      size: 32,
                    ),
                    label: Text(
                      'Settings',
                    ),
                  ),
                  NavigationRailDestination(
                    selectedIcon: Icon(
                      Icons.verified,
                      size: 32,
                    ),
                    icon: Icon(
                      Icons.verified_outlined,
                      color: Colors.grey,
                      size: 32,
                    ),
                    label: Text(
                      'Verification',
                    ),
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
