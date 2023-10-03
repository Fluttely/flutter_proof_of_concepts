import 'package:flutter/material.dart';
import 'package:nested_navigation_flutter_modular/core/app.absolut_paths.routes.dart';
import 'package:nested_navigation_flutter_modular/core/navigation_manager.dart';

class FindEventView extends StatefulWidget {
  const FindEventView({super.key});

  @override
  State<FindEventView> createState() => _FindEventViewState();
}

abstract class FindEventViewViewModel extends State<FindEventView> {}

class _FindEventViewState extends FindEventViewViewModel {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          NavigationManager.navigate(AppAbsolutPathsRoutes.profileVerification);
        },
        child: const Text('Navigate to Profile Veification Page'),
      ),
    );
  }
}
