import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.absolut_paths.routes.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/navigation_manager.dart';

class SignedInRoot extends StatefulWidget {
  const SignedInRoot({super.key});

  @override
  State<SignedInRoot> createState() => _SignedInRootState();
}

abstract class SignedInRootViewModel extends State<SignedInRoot> {
  @override
  void initState() {
    NavigationManager.navigate(AppAbsolutPathsRoutes.findPerson);
    super.initState();
  }

  late SignedInRootType type;

  SignedInRootType _getRootPageType(int value) => switch (value) {
        0 => SignedInRootType.find,
        1 => SignedInRootType.chats,
        _ => SignedInRootType.find,
      };

  void rootNavigate(SignedInRootType value) => switch (value) {
        SignedInRootType.find =>
          NavigationManager.navigate(AppAbsolutPathsRoutes.findPerson),
        SignedInRootType.chats =>
          NavigationManager.navigate(AppAbsolutPathsRoutes.profileSettings),
      };

  void onDestinationSelected(int index) {
    type = _getRootPageType(index);
    rootNavigate(type);
  }
}

enum SignedInRootType {
  find,
  chats,
}

class _SignedInRootState extends SignedInRootViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: NavigationManager.currentRoute,
        builder: (__, value, _) {
          return NavigationBar(
            selectedIndex:
                value?.contains(AppAbsolutPathsRoutes.find) == true ? 0 : 1,
            onDestinationSelected: onDestinationSelected,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Find',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_2),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
