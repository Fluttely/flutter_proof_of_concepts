import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_nasted_navigation_poc/core/app.routes.dart';

class SignedInRoot extends StatefulWidget {
  const SignedInRoot({super.key});

  @override
  State<SignedInRoot> createState() => _SignedInRootState();
}

abstract class SignedInRootViewModel extends State<SignedInRoot> {
  @override
  void initState() {
    Modular.to.navigate(AppRoutes.findPersonAbsolutPath);
    super.initState();
  }

  ValueNotifier<int> selectedPageIndex = ValueNotifier(0);

  late SignedInRootType type;

  SignedInRootType _getRootPageType(int value) => switch (value) {
        0 => SignedInRootType.find,
        1 => SignedInRootType.chats,
        _ => SignedInRootType.find,
      };

  void rootNavigate(SignedInRootType value) => switch (value) {
        SignedInRootType.find =>
          Modular.to.navigate(AppRoutes.findAbsolutPath),
        SignedInRootType.chats =>
          Modular.to.navigate(AppRoutes.profileAbsolutPath),
      };

  void onDestinationSelected(int index) {
    selectedPageIndex.value = index;

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
        valueListenable: selectedPageIndex,
        builder: (context, selectedPageIndexValue, _) {
          return NavigationBar(
            indicatorColor: Colors.transparent,
            backgroundColor: Colors.white,
            selectedIndex: selectedPageIndexValue,
            elevation: 0,
            shadowColor: Colors.purpleAccent,
            height: 52,
            onDestinationSelected: onDestinationSelected,
            destinations: [
              NavigationDestination(
                selectedIcon: _navigationIcon(
                  icon: Icons.local_fire_department,
                  color: Colors.purpleAccent,
                  size: 32,
                ),
                icon: _navigationIcon(
                  icon: Icons.local_fire_department_outlined,
                  color: Colors.grey,
                  size: 32,
                ),
                label: '',
                tooltip: 'Search for people/events',
              ),
              NavigationDestination(
                selectedIcon: _navigationIcon(
                  icon: Icons.chat_bubble,
                  color: Colors.purpleAccent,
                  size: 28,
                ),
                icon: _navigationIcon(
                  icon: Icons.chat_bubble_outline,
                  color: Colors.grey,
                  size: 28,
                ),
                label: '',
                tooltip: 'Lets chat',
              ),
            ],
          );
        },
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
